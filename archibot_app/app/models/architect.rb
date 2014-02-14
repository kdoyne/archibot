class Architect < ActiveRecord::Base
  validates :name, {presence: true, uniqueness: true}
  validates :style, {presence: true}
  has_many :buildings
end