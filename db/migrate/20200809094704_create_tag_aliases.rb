class CreateTagAliases < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_aliases do |t|
      t.references :tag, null: false, foreign_key: true
      t.string :alias

      t.timestamps
    end
  end
end
