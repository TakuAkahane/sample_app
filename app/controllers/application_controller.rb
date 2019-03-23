class ApplicationController < ActionController::Base
  # title/meta tagの処理
  include MetaTaggable
end
