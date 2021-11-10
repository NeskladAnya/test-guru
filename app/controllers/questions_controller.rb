class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_test_questions

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<%= @test.questions.inspect %>'
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  def show
    render inline: '<%= @questions.find(params[:id]).inspect %>'
  end

  def destroy
    @questions.find(params[:id]).destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_test_questions
    @questions = @test.questions
  end

  def question_params
    params.require[:questions].permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question is not found'
  end
end
