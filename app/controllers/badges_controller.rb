class BadgesController < ApplicationController
  
  def index
    @badges = Badge.all
    @current_badges = current_user.badges
  end
end
