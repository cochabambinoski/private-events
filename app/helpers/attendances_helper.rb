module AttendancesHelper
  def accept(attendance)
    attendance.update_columns(pending: 0, accepted: 1)
  end

  def reject(attendance)
    attendance.update_columns(pending: 0, rejected: 1)
  end
end
