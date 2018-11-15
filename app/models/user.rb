class User < ApplicationRecord

  def tests_level(level)
    tests.where(level: level)
  end
end
