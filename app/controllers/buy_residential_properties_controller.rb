# encoding: utf-8
# frozen_string_literal: true

class BuyResidentialPropertiesController < ApplicationController
  layout 'single_column'

  def new
    @new_property = BuyResidentialProperty.new
  end

  def create
    @new_property = BuyResidentialProperty.new(buy_residential_properties_params)
    if @new_property.save
      redirect_to buy_residential_properties_path
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def buy_residential_properties_params
    params.required(:buy_residential_property).permit(
      :property_name, :address, :price, :floore_size, :floore_level, :completion_date,
      property_type: []
    )
  end
end
