class AddTotalVotesToMonste < ActiveRecord::Migration
  def change
    add_column :monsters, :total_vote_count, :integer, default: 0
  end
end
