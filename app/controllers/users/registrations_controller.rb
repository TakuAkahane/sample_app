# encoding: utf-8
# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'single_column'

  # GET /resource/sign_up
  def new
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
