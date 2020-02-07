class Event < ApplicationRecord
	belongs_to :user, foreign_key: :user_id, class_name: 'User'
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
