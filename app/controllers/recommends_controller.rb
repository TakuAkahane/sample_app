# encoding: utf-8
# frozen_string_literal: true

class RecommendsController < ApplicationController
  layout 'single_column'

  def new
    @recommend = Recommend.new
  end

  def create
    @recommend = Recommend.new(recommend_params)
  end

  def index
  end

  def edit
  end

  def delete
  end

  def active
    render layout: 'two_column_side_search'
  end

  protected

  def recommend_params
    params.required(:recommend).permit(
      :gross_rate_of_return, :recommend_name, :comment,
      :building_classification, :ward_id, :age_of_a_building,
      :time_to_nearest_station, :require_price_min, :require_price_max
    )
  end
end
