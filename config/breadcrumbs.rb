# encoding: utf-8
# frozen_string_literal: true

crumb :root do
  link t('top').to_s, my_path if current_user.present?
  link "#{t('tokyo_real_estate_community')}#{t('top')}", root_path if current_user.nil?
end

crumb :contacts do
  link t('contact_us').to_s, new_contact_path
end
