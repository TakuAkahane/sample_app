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
end
