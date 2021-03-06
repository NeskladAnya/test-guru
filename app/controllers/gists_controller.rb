class GistsController < ApplicationController
  before_action :find_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question, url: result.url, author: current_user)

      redirect_to @test_passage, notice: view_context.link_to(t('.notice'), result.url, target: '_blank').html_safe
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
