class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :display_text
      t.text :discription
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.integer :status_id
      t.integer :level
      t.string :label

      t.timestamps
    end
  end
end
