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
    end
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
end
