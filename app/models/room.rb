class Room < ActiveRecord::Base

  has_many :lamps

  validates :name, :presence => true

  self.per_page = 5
end
