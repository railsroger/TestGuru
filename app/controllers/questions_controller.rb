class QuestionsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[edit update show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      flash[:success] = "Question was successfully created."
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      flash[:success] = "Question was successfully updated."
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @question.destroy
    flash[:danger] = "Question was successfully deleted."
    redirect_to @question.test
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
