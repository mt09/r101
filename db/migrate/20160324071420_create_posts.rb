class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :group_id

      t.timestamps null: false
    end
  end
end
