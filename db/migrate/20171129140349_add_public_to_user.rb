class AddPublicToUser < ActiveRecord::Migration[5.1]

  def change
    add_column :users, :public, :boolean, default: false
  end

end
