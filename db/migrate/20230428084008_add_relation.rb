class AddRelation < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :user, forreign_key: true
    add_reference :tasks, :status, forreign_key: true
  end
end
