class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
