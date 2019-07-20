# encoding: utf-8
# frozen_string_literal: true

class Contact < ApplicationRecord
  # 列挙型カラム向け gem 利用
  include InquiryType

  # validate
  validates :inquirytype, presence: true
  validates :first_name, presence: true, length: { in: 1..50 }
  validates :last_name, presence: true, length: { in: 1..50 }
  validates :email, presence: true, length: { in: 1..100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :tel, presence: true, format: { with: /\A[0-9]{10,12}\z/ }
  validates :content, presence: true

  def inquirytype?
    case inquirytype
    when 'about_rc'
      I18n.t('about_rc')
    when 'media_coverage'
      I18n.t('request_about_media_coverage')
    end
  end
end
