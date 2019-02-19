class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[destroy edit update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      flash[:success] = "Badge was successfully created."
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      flash[:success] = "Question was successfully updated."
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    flash[:danger] = "Question was successfully deleted."
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :rule)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

end