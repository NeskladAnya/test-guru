class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[ show update result]
  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.save_result
      BadgeAssigningService.new(@test_passage).call if @test_passage.passed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
