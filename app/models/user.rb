class User < ApplicationRecord
  has_many :posts, foreign_key: "user_id"
end
