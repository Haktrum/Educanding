class AddNegativeVoteIndexToVotes < ActiveRecord::Migration[5.1]
  def change
    add_index :votes, '(points < 0)'
  end
end
