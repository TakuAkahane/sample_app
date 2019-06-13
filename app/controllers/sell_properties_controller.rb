# encoding: utf-8
# frozen_string_literal: true

class SellPropertiesController < ApplicationController
  layout 'single_column'

  def new
    @sell_property = SellProperty.new
  end

  def index
  end

  def edit
  end

  def delete
  end

  def active
  end
end
