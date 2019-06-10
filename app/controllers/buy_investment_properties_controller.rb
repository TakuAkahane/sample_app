# encoding: utf-8
# frozen_string_literal: true

class BuyInvestmentPropertiesController < BizmatchController
  layout 'single_column'

  def new
    @investment_property = BuyInvestmentProperty.new
  end

  def create
    @investment_property = create_new_property
    if @investment_property.save
      redirect_to manage_index_buy_investment_properties_path
    else
      render :new
    end
  end

  def index
    @investment_properties = BuyInvestmentProperty.all.paginate(page: params[:page], per_page: 12)
    render layout: 'two_column_side_search'
  end

  def detail
    @investment_property = BuyInvestmentProperty.all.last
  end

  def view
  end

  def edit
  end

  def delete
  end

  def update
  end

  def active
    init_classes
    @search_condition = create_search_condition
    according_control(@search_condition)
    @search_condition = confirm_switch_type(@search_condition)
    @search_condition = confirm_sort_type(@search_condition)
    @search_condition.frequently_searched_keyword = investment_property_frequently_searched_keyword_array
    validate_bookmark_filter?
    session[:search_investment_property_path] = request.fullpath
    @investment_properties = BuyInvestmentProperty.all.paginate(page: params[:page], per_page: 12)
    return redirect_to(@search_condition.url) if @search_condition.params.present?
    render layout: 'two_column_side_search'
  end

  def search_condition_params
    ActionController::Parameters.new
  end

  private

  def init_classes
    @bizmatch_condition_model = InvestmentPropertySearchCondition
    @bizmatch_condition_controller = InvestmentPropertySearchConditionController
  end

  def create_new_property
    new_property = BuyInvestmentProperty.new(buy_investment_properties_params)
    new_property.property_type = convert_property_type
    new_property.ward_id = convert_ward_id
    new_property.floore_plan = convert_floore_plan
    new_property.balcony_direction = convert_balcony_direction
    new_property
  end

  # Serializeに対応するため、型をconvert
  def convert_property_type
    buy_investment_properties_params[:property_type].present? ? buy_investment_properties_params[:property_type].split : []
  end

  def convert_ward_id
    buy_investment_properties_params[:ward_id].present? ? buy_investment_properties_params[:ward_id].split : []
  end

  def convert_floore_plan
    buy_investment_properties_params[:floore_plan].present? ? buy_investment_properties_params[:floore_plan].split : []
  end

  def convert_balcony_direction
    buy_investment_properties_params[:balcony_direction].present? ? buy_investment_properties_params[:balcony_direction].split : []
  end

  def buy_investment_properties_params
    params.required(:buy_investment_property).permit(
      :property_name, :ward_id, :address, :price, :floore_plan, :floore_size, :floore_level, :completion_date,
      :balcony_size, :balcony_direction, :total_number_of_houses, :rights_concening_land, :management_company,
      :management_fee, :repair_reserve_fund, :handover_date, :transportation, :property_type
    )
  end
end
