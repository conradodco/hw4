class Place < ApplicationRecord
  has_many :posts, foreign_key: "place_id"
end
