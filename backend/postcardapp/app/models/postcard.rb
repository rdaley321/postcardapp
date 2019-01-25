class Postcard < ApplicationRecord
  belongs_to :address
  belongs_to :state
end
