class CreateVotos < ActiveRecord::Migration[5.1]
  def change
    create_table :votos do |t|
      t.references :user, foreign_key: true
      t.references :votable, polymorphic: true
      t.boolean :positive

      t.timestamps
    end
  end
end
