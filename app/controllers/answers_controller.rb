class AnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show edit update destroy]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
      if @answer.save
        flash[:success] = 'Answer was successfully created.'
        redirect_to @answer
      else
        render :new
      end
  end

  def update
    if @answer.update(answer_params)
       flash[:success] = 'Answer was successfully updated.'
       redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    flash[:danger] = 'Answer was successfully destroyed.'
    redirect_to @answer.question
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:title, :correct)
  end
end
