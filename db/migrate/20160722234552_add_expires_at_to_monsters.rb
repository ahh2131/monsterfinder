class AddExpiresAtToMonsters < ActiveRecord::Migration
  def change
    if !column_exists?(:monsters, :expires_at)
      add_column :monsters, :expires_at, :datetime
    end
  end
end
