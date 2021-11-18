class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def edit
  end

  def new
    @test = Test.new
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
