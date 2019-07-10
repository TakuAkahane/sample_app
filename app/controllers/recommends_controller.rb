# encoding: utf-8
# frozen_string_literal: true

class RecommendsController < ApplicationController
  layout 'single_column'

  def new
    @recommend = Recommend.new
  end

  def create
    @recommend = create_new_recommend
    if @recommend.save
      redirect_to manage_index_recommends_path
    else
      render :new
    end
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

  def create_new_recommend
    new_recommend = Recommend.new(recommend_params)
    new_recommend.ward_id = convert_ward_id
    new_recommend.age_of_a_building = convert_age_of_a_building
    new_recommend.time_to_nearest_station = convert_time_to_nearest_station
    new_recommend
  end

  # Serializeに対応するため、型をconvert
  def convert_ward_id
    recommend_params[:ward_id].present? ? recommend_params[:ward_id].split : []
  end

  def convert_age_of_a_building
    recommend_params[:age_of_a_building].present? ? recommend_params[:age_of_a_building].split : []
  end

  def convert_time_to_nearest_station
    recommend_params[:time_to_nearest_station].present? ? recommend_params[:time_to_nearest_station].split : []
  end

  def recommend_params
    params.required(:recommend).permit(
      :gross_rate_of_return, :recommend_name, :comment, :ward_id, :age_of_a_building,
      :time_to_nearest_station, :require_price_min, :require_price_max,
      building_classification: [], building_structure: []
    )
  end
end
