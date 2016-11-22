class Team < ApplicationRecord
  has_many :users
  has_many :team_users
end
