class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :head
      t.string :body
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
