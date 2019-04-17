# encoding: utf-8
# frozen_string_literal: true

class BuyResidentialPropertiesController < ApplicationController
  layout 'single_column'

  def new
    @residential_property = BuyResidentialProperty.new
  end

  def create
    @residential_property = create_new_property
    if @residential_property.save
      redirect_to manage_index_buy_residential_properties_path
    else
      render :new
    end
  end

  def index
    @residential_properties = BuyResidentialProperty.all.paginate(page: params[:page], per_page: 12)
    render layout: 'two_column_side_search'
  end

  def detail
    @residential_property = BuyResidentialProperty.all.last
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
    @residential_properties = BuyResidentialProperty.all.paginate(page: params[:page], per_page: 12)
    render layout: 'two_column_side_search'
  end

  private

  def create_new_property
    new_property = BuyResidentialProperty.new(buy_residential_properties_params)
    new_property.property_type = convert_property_type
    new_property.ward_id = convert_ward_id
    new_property.floore_plan = convert_floore_plan
    new_property.balcony_direction = convert_balcony_direction
    new_property
  end

  # Serializeに対応するため、型をconvert
  def convert_property_type
    buy_residential_properties_params[:property_type].present? ? buy_residential_properties_params[:property_type].split : []
  end

  def convert_ward_id
    buy_residential_properties_params[:ward_id].present? ? buy_residential_properties_params[:ward_id].split : []
  end

  def convert_floore_plan
    buy_residential_properties_params[:floore_plan].present? ? buy_residential_properties_params[:floore_plan].split : []
  end

  def convert_balcony_direction
    buy_residential_properties_params[:balcony_direction].present? ? buy_residential_properties_params[:balcony_direction].split : []
  end

  def buy_residential_properties_params
    params.required(:buy_residential_property).permit(
      :property_name, :ward_id, :address, :price, :floore_plan, :floore_size, :floore_level, :completion_date,
      :balcony_size, :balcony_direction, :total_number_of_houses, :rights_concening_land, :management_company,
      :management_fee, :repair_reserve_fund, :handover_date, :transportation, :property_type
    )
  end
end
