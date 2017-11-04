class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :descripcion, :text
    add_reference :users, :faculty, foreign_key: true
  end
end
