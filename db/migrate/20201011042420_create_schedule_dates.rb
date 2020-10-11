class CreateScheduleDates < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_dates do |t|
      t.references :schedule, null: false
      t.date :date, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :schedule_dates, [:schedule_id, :date], unique: true
  end
end
