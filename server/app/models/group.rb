class Group < ApplicationRecord
  has_many :user_groups
  has_many :statements
  has_many :topics
  has_many :group_topics
end
