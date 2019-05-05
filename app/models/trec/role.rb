# encoding: utf-8
# frozen_string_literal: true

module Trec
  class Role < ApplicationRecord
    include TheRole::Api::Role
    include AccountType

    has_many :users

    # validate
    validates :name, length: { maximum: 30 }, presence: true
    validates :title, length: { maximum: 30 }, presence: true
    validates :description, length: { maximum: 300 }, presence: true
  end
end
