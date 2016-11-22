class TeamUser < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team
end
