class AddLowerNameIndexToTags < ActiveRecord::Migration[5.1]
  def change
    add_index :tags, 'lower(name::text)', unique: true
  end
end
