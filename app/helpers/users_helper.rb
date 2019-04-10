# encoding: utf-8
# frozen_string_literal: true

module UsersHelper
  def registration_options
    {
      I18n.t('individual_use') => true,
      I18n.t('corporate_use') => false
    }
  end
end
