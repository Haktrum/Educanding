class UpdateVotes < ActiveRecord::Migration[5.1]
  def change
    change_column :votes, :points, :smallint, using: 'case points when 1 then 1 else -1 end'
  end
end
