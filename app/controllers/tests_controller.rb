class TestsController < ApplicationController

  before_action :find_test, only: %i[show edit update destroy start]
  before_action :find_user, only: :start
  before_action :new_test, only: :create

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    if @test.save
      flash[:success] = "Test was successfully created."
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      flash[:success] = "Test was successfully updated."
      redirect_to test_path(@test)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @test.destroy
    flash[:danger] = "Test was successfully deleted."
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def new_test
    @test = Test.new(test_params)
  end

  def find_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

end
