class CreateScheduleDateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_date_members do |t|
      t.references :schedule_date, null: false
      t.references :member, null: false
      t.date :date, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :schedule_date_members, [:schedule_date_id, :member_id, :date], unique: true, name: 'index_schedule_date_members'
  end
end
