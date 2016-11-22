class Team < ApplicationRecord
	validates :name, uniqueness: true 
  has_many :users
  has_many :team_users
end
