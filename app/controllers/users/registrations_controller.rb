# encoding: utf-8
# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'single_column'

  # GET /resource/sign_up
  def new
    if user_signed_in?
      # ログイン済みの場合はログアウトを促す
      flash[:alert] = t('msg.require_logout')
      redirect_back(fallback_location: users_registrations_path)
      return
    end
    # インスタンス作成後、会社情報を自動保管するためにbuild_[model]メソッドを実行
    @user = User.new
    @user.build_company
  end

  # POST /resource
  def create
    return if registrated_by_sns_auth?
    unless create_valid?
      flash.now[:error] = t('msg.error_in_the_input_content')
      render :new
      return
    end
    begin
      ActiveRecord::Base.transaction do
        # 確認メールの再送信
        resend_confirmation_mail if @user.id.present?
        # company paramsがある場合、devise controllerにて無条件でcompanyレコードが作られる。そのため個人利用の場合はcompany paramsを削除。
        params[:user][:company_attributes] = nil if @user.individual_use
        # deviseへの登録処理
        super
        resource.update_attribute(:parent_id, resource.id)
        # 登録出来た場合、DB登録完了のフラグを立てる
        db_auth_registration_completed
        # 法人利用の場合
        update_company_in_create
        end
      end
    rescue
  end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
  end

  # DELTE /resource
  def destroy
    super
  end

  def index
  end

  private

  # TODO: public
  def update_company_in_create
    return if resource.individual_use
    resource.company.user_parent_id = resource.id
    resource.company.public = 'public'
    resource.company.tel = @user.tel
    resource.company.employee_size_id = set_employee_size_id
    resource.company.save(validate: false)
  end

  def create_valid?
    # DB認証の会員登録バリデーション
    tag = %i[all db_auth creating]

    # 仮登録中ユーザの場合、emailをvalidateしない
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.confirmed_at.nil?
      @user.attributes = devise_parameter_sanitizer.sanitize(:sign_up)
      @user.skip_email_validation = true
      tag << :creating_corp unless @user.individual_use
      @user.company.tel = @user.tel unless @user.individual_use
      return @user.valid?(tag)
    end

    # userモデルのインスタンス変数をdeviseがフックするため、local変数でvalidationしない
    @user = User.new
    @user.build_company
    @user.build_role
    @user.attributes = devise_parameter_sanitizer(:sign_up)
    unless @user.individual_use
      tag << :creating_corp
      @user.company.tel = @user.tels
    end
    @user.valid?(tag)
  end

  def db_auth_registration_completed
    user = User.find_by(email: params.require(:user).permit(:email)[:email])
    user.update_attribute(:db_auth_registration_completed, true) unless user.blank?
  end

  def registrated_by_sns_auth?
    user = User.find_by(email: params.require(:user).permit(:email)[:email])
    if user.present? && user.db_auth_registration_completed == false && user.id == user.parent_id
      # レコードが存在している、且つDB認証が完了していない => SNS認証登録
      # 既にSNS認証登録が成されている場合、パスワード変更ページでパスワード登録するよう促す
      flash[:error] = t('msg.registration_completed_by_sns ')
      redirect_to new_user_session_path
      return true
    end
    false
  end

  def resend_confirmation_mail
    raw_token, _hashed_token = Devise.token_generator.generate(User, :confirmation_token)
    @user.confirmation_token = raw_token
    @user.confirmation_sent_at = Time.now
    @user.save
    @user.resend_confirmation_instructions
    set_flash_message! :notice, :"signed_up_buy_#{resource.inactive_message}"
    expire_data_after_sign_in!
    respond_with @user, location: after_inactive_sign_up_path_for(@user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id, :first_name, :last_name, :display_name, :email, :individual_use,
                                                       :password, :tel,
                                                       company_attributes: %i[name site_url establishment number_of_employees]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :display_name, :prefecture_id, :address, :tel,
                                                              :division, :position,
                                                              company_attributes: %i[name site_url tel business establishment capital number_of_employees]])
    devise_parameter_sanitizer.permit(:sub_account_registration, keys: %i[first_name last_name display_name division position])
  end
end
