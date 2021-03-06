class User < ApplicationRecord
  has_many :events, foreign_key: :user_id
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, source: :attended_event
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def upcoming_events
    attended_events.where('date >= :current_time', current_time: DateTime.now)
  end

  def previous_events
    attended_events.where('date < :current_time', current_time: DateTime.now)
  end
end
