class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_one :group_topic
end
