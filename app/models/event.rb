class Event < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  scope :past, -> { where('date < :current_time', current_time: DateTime.now) }
  scope :upcoming, -> { where('date >= :current_time', current_time: DateTime.now) }
end
