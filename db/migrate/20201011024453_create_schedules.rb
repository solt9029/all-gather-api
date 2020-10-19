class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules, id: :uuid do |t|
      t.string :title, null: false
      t.timestamps
    end
  end
end
