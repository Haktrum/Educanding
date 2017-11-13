class ChangePositiveToPointsInVote < ActiveRecord::Migration[5.1]
  def change
    change_column :votes, :positive, :smallint, using: 'case positive when true then 1 else -10 end'
    change_table :votes do |t|
      t.rename :positive, :points
    end
  end
end
