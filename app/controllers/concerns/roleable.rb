# encoding: utf-8
# frozen_string_literal: true

module Roleable
  extend ActiveSupport::Concern
  REGIST_KEY = 'registration_whith_sns'
  SNS_KEY = 'sns'

  def registration_roles_hash
    Rc::Role.select(:id, :name).where(name: %w[light]).map { |role| [role.name, role.id] }.to_h
  end

  def save_sessions_sns_registration
    clear_session_sns_registration
    session[REGIST_KEY] = params.permit(SNS_KEY)
  end

  def clear_session_sns_registration
    session[REGIST_KEY] = nil if session[REGIST_KEY].present?
  end

  def sns_cert_came_from
    return nil unless sns_registration_session?
    session[REGIST_KEY][SNS_KEY]
  end

  def sns_registration_session?
    # キーが無い場合は、通常のログイン認証である。
    return false if session[REGIST_KEY].nil?
    # キーが有る場合は、パラメータをチェックする。
    return true if session[REGIST_KEY].present? &&
                   session[REGIST_KEY][SNS_KEY].present?
    # 条件が揃わない場合、セッションをクリアして例外で処理する。
    session[REGIST_KEY] = nil if session[REGIST_KEY].present?
    raise StandardError
  end
end
