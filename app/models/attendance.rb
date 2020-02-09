class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates :attended_event_id, presence: true
  validates :attendee_id, presence: true
  validates :host_id, presence: true
end
