class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :description
      t.string :conference_room
      t.string :mentor

      t.timestamps
    end
  end
end
