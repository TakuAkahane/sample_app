# encoding: utf-8
# frozen_string_literal: true

module UsersHelper
  # ユーザ登録画面選択肢
  def registration_options
    {
      I18n.t('individual_use') => true,
      I18n.t('corporate_use') => false
    }
  end

  # SNSを使った会員登録プロセスの過程であることを示すメソッド
  def registration_process_by_sns?
    # ログイン済みであること、パスワードが設定されていないこと
    user_signed_in? && current_user.incomplete_sns_registration
  end
end
