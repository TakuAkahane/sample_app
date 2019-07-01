module RecommendsHelper
  # partialのformにおいて、form_forの送信先指定
  def get_recommend_form_for_url(recommend)
    return manage_create_recommends_path if recommend.id.blank?
    manage_update_recommend_path
  end
end
