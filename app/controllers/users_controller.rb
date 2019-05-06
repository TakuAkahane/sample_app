# encoding: utf-8
# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'two_column_side_search'

  def index
    @users = current_user.my_sub_accounts.paginate(page: params[:page], per_page: 20)
    render layout: 'two_column_side_menu'
  end

  def new
    @user = User.new
    @user.build_role
    render layout: 'two_column_side_menu'
  end

  def create
    @user = User.new(params.require(:user).permit(:last_name, :first_name, :email, :role_id, :display_name))
    @user.company_id = current_user.company_id
    @user.skip_password_validation = true
    @user.parent_id = current_user.parent_id
    @user.individual_use = current_user.individual_use
    unless @user.valid?(:all)
      render :new, layout: 'two_column_side_menu'
      return
    end
    @user.save!
    flash[:success] = t('msg.create_sub_account')
    redirect_to manage_users_users_path
  end

  def edit_account_type
    @user = User.find_by(id: params.permit(:format)[:format])
    render layout: false
  end

  def change_account_type
    @user = User.find_by(id: params.require(:user).permit(:id)[:id])
    account_type = params.require(:user).require(:anavi_role).permit(:account_type)[:account_type]
    render json: { status: 'error', message: t('msg.fail_to_update', v: t('role')) } unless @user.change_account_type(account_type)
    render json: { status: 'success', html: view_context.display_account_type(@user), id: @user.id }
  end

  def destroy_sub_account
    destroy_user = User.find_by(id: params.permit(:id)[:id])
    begin
      ActiveRecord::Base.transaction do
        if require_in_charge(destroy_user)
          to_user_id = params.require(:user).permit(:change_in_charge_uid)[:change_in_charge_uid]
        end
        destroy_user.destroy
      end
    rescue e
      logger.error e
      render json: { status: 'error', message: t('msg.fail_to_delete', v: t('sub_account')) }
    end
    render json: { status: 'success', id: destroy_user.id }
  end

  def change_in_charge
    @user = User.find_by(id: params.permit(:format)[:format])
    @require_in_charge = require_in_charge(@user)
    render layout: false
  end

  private

  def require_in_charge(user)
  end
end
