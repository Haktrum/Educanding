class AddDeletedAtToFaculties < ActiveRecord::Migration[5.1]
  def change
    add_column :faculties, :deleted_at, :datetime
    add_index :faculties, :deleted_at
  end
end
