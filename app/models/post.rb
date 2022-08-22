class Post < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_one_attached :cover_photo
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
