class Badge < ApplicationRecord
  
  BADGES_AWARD = {
    'Passing all tests of the category' => :category_complete,
    'Passing the test on the first try' => :first_try,
    'Passing all tests of a certain level' => :level_complete
  }.freeze

  has_many :users_badges
  has_many :users, through: :users_badges

  validates :title, :image, presence: true

  def self.images
    images_path = 'app/assets/images/'
    badges = Dir.glob("#{images_path}badges/*")
    badges.map { |badge_path| badge_path.gsub(images_path, '') }
  end

end
