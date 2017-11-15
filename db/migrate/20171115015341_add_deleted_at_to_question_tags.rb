class AddDeletedAtToQuestionTags < ActiveRecord::Migration[5.1]
  def change
    add_column :question_tags, :deleted_at, :datetime
    add_index :question_tags, :deleted_at
  end
end
