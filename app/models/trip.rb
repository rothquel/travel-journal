class Trip < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_one_attached :photo
end
