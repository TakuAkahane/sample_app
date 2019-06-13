module SellPropertiesHelper
  # partialのformにおいて、form_forの送信先指定
  def get_sell_property_form_for_url(property)
    return manage_create_sell_properties_path if property.id.blank?
    manage_update_sell_property_path
  end
end
