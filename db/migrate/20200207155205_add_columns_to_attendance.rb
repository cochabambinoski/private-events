# frozen_string_literal: true

class AddColumnsToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :pending, :boolean, default: 1
    add_column :attendances, :accepted, :boolean, default: 0
    add_column :attendances, :rejected, :boolean, default: 0
    add_column :attendances, :host_id, :integer
  end
end
