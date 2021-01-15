class Business < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood
  belongs_to :category
end
