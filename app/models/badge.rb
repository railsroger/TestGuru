class Badge < ApplicationRecord
  has_many :users_badges
  has_many :users, through: :users_badges

  def self.images
    images_path = 'app/assets/images/'
    badges = Dir.glob("#{images_path}badges/*")
    badges.map { |badge_path| badge_path.gsub(images_path, '') }
  end

end
