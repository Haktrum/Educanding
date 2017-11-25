class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :nombre
      t.integer :puntaje, default: 0
      t.boolean :activo, default: true

      t.timestamps
    end
  end
end
