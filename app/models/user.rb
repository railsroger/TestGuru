class User < ApplicationRecord
  has_many :tests
  
  def tests_level(level)
    tests.where(level: level)
  end
end
