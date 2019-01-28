class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
    @gists = Gist.all
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = current_user.created_tests.new(test_params)
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

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

end
