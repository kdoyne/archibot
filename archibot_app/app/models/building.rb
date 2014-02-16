# == Schema Information
#
# Table name: buildings
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :string(255)
#  year_built   :integer
#  photo_url    :string(255)
#  latitude     :float
#  longitude    :float
#  architect_id :integer
#

class Building < ActiveRecord::Base
  validates :name, {presence: true, uniqueness: true}
  validates :address, {presence: true}
  validates :architect, {presence: true}
  geocoded_by :address
  after_validation :geocode
  belongs_to :architect
  has_many :favorite_buildings
  has_many :favorited_by, through: :favorite_recipies, source: :user
end
