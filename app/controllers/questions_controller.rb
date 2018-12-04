class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all
  end

  def new
  end

  def create
    @question = @test.questions.create!(question_params)
    render plain: "Question was successfully created"
  end

  def show
  end

  def destroy
    @question.destroy
    render plain: "This question has been deleted."
    redirect_to test_question_path
  end

  private

    def find_question
      @question = Question.find(params[:id])
    end

    def find_test
      @test = Test.find(params[:test_id])
    end

    def question_params
      params.require(:question).permit(:body)
    end

    def rescue_with_question_not_found
      render plain: "Question not found!"
    end
end
