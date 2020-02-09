class AttendancesController < ApplicationController
  def create
    @attendance = current_user.attendances.build(attendance_params)
    if @attendance.save
      flash[:success] = 'attendance sent!'
      redirect_to current_user
    else
      flash.now[:danger] = 'There was a problem with your invite. Try again.'
      redirect_to root_path
    end
  end

  def update
    params.inspect
    @attendance = attendance.find(params[:id])
    params[:choice] == '1' ? accept(@attendance) : reject(@attendance)
    redirect_to current_user
  end

  private

  def attendance_params
    params[:attendance][:pending] = true
    params.require(:attendance).permit(:attendee_id, :attended_event_id, :host_id, :pending, :accepted, :rejected)
  end
end
