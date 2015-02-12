class Album < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :artist, presence: true, length: { maximum: 255 }
  validates :genre, presence: true, length: { in: 3..255 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
