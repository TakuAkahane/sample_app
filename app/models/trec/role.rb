# encoding: utf-8
# frozen_string_literal: true

module Trec
  class Role < ApplicationRecord
    include AccountType

    has_many :user
  end
end
