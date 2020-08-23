class RemoveTagIdFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :tag_id, :integer
  end
end
