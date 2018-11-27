class Category < ApplicationRecord
  has_many :tests
  default_scope { where(title: title).order(created_at: :desc) }
  validates :title, presence: true
end
