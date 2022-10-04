class Branch < ApplicationRecord
  belongs_to :branch_type
  belongs_to :post_office
end
