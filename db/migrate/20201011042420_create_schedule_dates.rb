class CreateScheduleDates < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_dates, id: :uuid do |t|
      t.belongs_to :schedule, null: false, type: :uuid, foreign_key: true, index: true
      t.date :date, null: false
      t.timestamps
    end
    add_index :schedule_dates, [:schedule_id, :date], unique: true
  end
end
