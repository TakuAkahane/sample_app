# encoding: utf-8
# frozen_string_literal: true

class ResidentialPropertySearchConditionController < BizmatchController
  require 'cgi'
  layout 'single_column'

  #----------------------------------------------------------------------------#
  # 検索のアクション
  #----------------------------------------------------------------------------#
  def search
    init_classes
    @search_condition = create_search_condition
    according_control(@search_condition)
    return if @search_condition == false
    @search_condition.frequently_searched_keyword = residential_property_frequently_searched_keyword_array
    @residential_properties = @search_condition.search(paginate_option, current_user)
    session[:search_residential_property_path] = request.fullpath
    render 'buy_residential_properties/active', layout: 'two_column_side_search'
  end

  #----------------------------------------------------------------------------#
  # 検索URL保管のアクション
  #----------------------------------------------------------------------------#
  def save_search_condition

  end

  protected

  def search_condition_params
    params.required(:residential_property_search_condition)
          .permit(
            :free_keyword
          )
  end

end
