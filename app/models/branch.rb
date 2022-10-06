class Branch < ApplicationRecord
  belongs_to :branch_type
  belongs_to :post_office

  has_many :point
end
