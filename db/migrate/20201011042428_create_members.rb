class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members, id: :uuid do |t|
      t.belongs_to :schedule, null: false, type: :uuid, foreign_key: true, index: true
      t.string :name, null: false
      t.timestamps
    end
    add_index :members, [:schedule_id, :name], unique: true
  end
end
