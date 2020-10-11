class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
