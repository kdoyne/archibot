class Building < ActiveRecord::Base
  validates :name, {presence: true, uniqueness: true}
  validates :address, {presence: true}
  validates :architect, {presence: true}
  geocoded_by :address
  after_validation :geocode
  belongs_to :architect
end