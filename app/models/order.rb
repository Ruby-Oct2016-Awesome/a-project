class Order < ApplicationRecord
  belongs_to :voucher
  belongs_to :user
end
