# encoding: utf-8
# frozen_string_literal: true

class RecommendsController < ApplicationController
  layout 'single_column'

  def new
    @recommend = Recommend.new
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
end
