class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_test_questions, only: %i[create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<%= @test.questions.inspect %>'
  end

  def new
  end

  def create
    @question = @questions.build(question_params)

    if @question.save
      render inline: '<%= @question.inspect %>'
    else
      render :new
    end
  end

  def show
     @question = Question.find(params[:id])

     render plain: @question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_test_questions
    @questions = @test.questions
  end

  def question_params
    params.require(:questions).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question is not found'
  end
end
