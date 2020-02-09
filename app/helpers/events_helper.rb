module EventsHelper
  def find_attendance(event)
    attendance.where(['attendee_id = ? and attended_event_id = ?',
                      current_user.id, event.id]).first.id
  end
end
