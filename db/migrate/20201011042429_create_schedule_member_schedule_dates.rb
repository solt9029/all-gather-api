class CreateScheduleMemberScheduleDates < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_member_schedule_dates, id: :uuid do |t|
      t.belongs_to :schedule_date, null: false, type: :uuid, foreign_key: true, index: true
      t.belongs_to :schedule_member, null: false, type: :uuid, foreign_key: true, index: true
      t.date :date, null: false
      t.timestamps
    end
    add_index :schedule_member_schedule_dates, [:schedule_date_id, :member_id, :date], unique: true, name: 'index_schedule_member_schedule_dates'
  end
end
