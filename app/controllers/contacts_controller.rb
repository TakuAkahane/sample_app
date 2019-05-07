# encoding: utf-8
# frozen_string_literal: true

class ContactsController < ApplicationController
  layout 'single_column_full'

  def new
    @contact = preset_new_data
  end

  def confirm
    @contact = Contact.new(contact_params)
    return unless @contact.invalid?
    flash.now[:error] = t('msg.error_in_the_input_content')
    force_page_title :new
    render :new
  end

  def complete
    @contact = Contact.new(contact_params)
    if params[:back].present?
      force_page_title :new
      render :new
    else
      flash[:success] = t('msg.received_contact')
      @contact.save
    end
  end

  private

  def preset_new_data
    return Contact.new unless user_signed_in?
    Contact.new(
      company: current_user.individual_use ? nil : current_user.company.name,
      last_name: current_user.last_name,
      first_name: current_user.first_name,
      email: current_user.email,
      tel: current_user.individual_use ? nil : current_user.company.tel
    )
  end

  def contact_params
    params.required(:contact).permit(
      :inquirytype, :company, :first_name, :last_name, :email, :tel, :content
    )
  end
end
