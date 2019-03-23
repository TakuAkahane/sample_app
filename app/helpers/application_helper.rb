# encoding: utf-8
# frozen_string_literal: true

module ApplicationHelper
  # h1タグ作成
  def generate_h1tag
    content_tag :h1, page_title, class: 'mb-0'
  end

  # h1タグ非表示
  def disable_h1tag
    @disable_h1tag = true
  end

  # ページタイトル表示
  def page_title
    return @exception_title if @exception_title.present?
    if session[:force_page_title].present?
      pt = session[:force_page_title]
      session[:force_page_title] = nil
      return nil
    end
  end
end
