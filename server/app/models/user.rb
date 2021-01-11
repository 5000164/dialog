class User < ApplicationRecord
  has_many :user_groups
  has_one :candidate
  has_many :statements
  has_many :topics
end
