# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  validates :first_name, {presence: true}
  validates :last_name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  has_secure_password
  has_and_belongs_to_many :buildings
  has_and_belongs_to_many :architects
end
