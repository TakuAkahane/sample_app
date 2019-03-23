class ApplicationController < ActionController::Base
  # title/meta tagの処理
  include MetaTaggable

  # ページタイトル作成
  def force_page_title(force_action_name)
    @page_title = view_context.force_page_title force_action_name
  end
end
