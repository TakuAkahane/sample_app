module BuyResidentialPropertiesHelper
  # partialのformにおいて、form_forの送信先指定
  def get_residential_property_form_for_url(property)
    return manage_new_buy_residential_properties_path if property.id.blank?
    manage_update_buy_residential_property_path
  end
end
