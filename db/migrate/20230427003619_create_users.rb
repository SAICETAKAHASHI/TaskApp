class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_password
      t.integer :control_level

      t.timestamps
    end
  end
end
