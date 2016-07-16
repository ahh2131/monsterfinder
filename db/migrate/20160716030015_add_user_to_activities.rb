class AddUserToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :user, index: true, foreign_key: true
    remove_column :activities, :uuid
  end
end
