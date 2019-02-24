class BadgesAwardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  
  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule}?", badge.level || badge.category)
    end
  end

  private

  def reward(badge)
    @user.badges << badge
  end

  def successful_test?
    @test_passage.successfully?
  end

  def category_complete?(category)
    successful_test? && @test.category.title == category
  end

  def first_try?
    successful_test? && @user.tests.where(id: @test.id).count == 1
  end

  def level_complete?(level)
    successful_test? && @test.level == level
  end

end