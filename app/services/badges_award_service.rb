class BadgesAwardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  
  def call
    Badge.all.each do |badge|
      reward(badge) if send("#{badge.rule}?", badge.rule_value)
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
    successful_test? && @user.tests.where("category_id = ?", category_id).uniq.count == Test.where("category_id = ?", category_id).count
  end

  def first_try?
    successful_test? && @user.tests.where("title = ?", @test_passage.test.title).count == 1
  end

  def level_complete?(level)
    successful_test? && @user.tests.where("level = ?", level).uniq.count == Test.where("level = ?", level).count
  end

end