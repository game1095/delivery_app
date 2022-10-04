class PostOffice < ApplicationRecord
  has_many :user
  has_many :branch
end
