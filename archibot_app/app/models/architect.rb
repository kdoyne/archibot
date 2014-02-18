# == Schema Information
#
# Table name: architects
#
#  id        :integer          not null, primary key
#  name      :string(255)
#  year_born :integer
#  year_died :integer
#  style     :string(255)
#

class Architect < ActiveRecord::Base
  validates :name, {presence: true, uniqueness: true}
  validates :style, {presence: true}
  has_many :buildings
  has_and_belongs_to_many :users

def self.search(query)
  if query
    find(:all, :conditions => ['name LIKE ?', "%#{query}%"] )
  else
    find(:all)
  end
end
end