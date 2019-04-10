# encoding: utf-8
# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'single_column_no_title'

  # GET /resource/sign_in
  def new
    super
    @user = User.new
  end
end
