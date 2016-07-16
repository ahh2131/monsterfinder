class AddCustomCounterCacheToMonsters < ActiveRecord::Migration
  def change
    add_column :monsters, :upvote_count, :integer, default: 0
    add_column :monsters, :downvote_count, :integer, default: 0
  end
end
