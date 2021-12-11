class Admin::QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new

    @question_test = Test.find(@question.test_id)
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def show
    @question_test = Test.find(@question.test_id)
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    @question_test = Test.find(@question.test_id)
    redirect_to admin_test_path(@question_test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question is not found'
  end
end
