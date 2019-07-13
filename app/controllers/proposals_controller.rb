# encoding: utf-8
# frozen_string_literal: true

class ProposalsController < ApplicationController
  layout 'single_column'

  def new
    @proposal = set_new_proposal
  end

  def create
  end

  def index
  end

  def detail
  end

  def edit
  end

  def delete
  end

  protected

  def set_new_proposal
    proposal = Proposal.new
    recommend = Recommend.find(params[:id])
    # TODO: current_userのidが入るようにする
    proposal.proposing_user_parent_id = 1
    proposal.receiving_user_parent_id = recommend.user_parent_id
    proposal.recommend_id = recommend.id
    proposal
  end

  def proposal_params
    params.required(:proposal).permit(
    )
  end
end
