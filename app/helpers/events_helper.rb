module EventsHelper
	def find_invitation(event) 
			Invitation.where(['attendee_id = ? and attended_event_id = ?',
												current_user.id, event.id]).first.id
	end
end
