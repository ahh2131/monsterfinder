class AddTimestamps < ActiveRecord::Migration
  def change
    change_table :monsters do |t|
      t.timestamps
    end
  end
end
