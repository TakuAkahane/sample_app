# frozen_string_literal: true

class InvestmentFrequentlySearchedKeyword < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Big', often_search_keyword: true },
    { id: 2, name: 'Fancy', often_search_keyword: true }
  ]
end
