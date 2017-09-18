class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :occupation
      t.string :location
      t.string :session_token
      t.string :password_digest

      t.timestamps
    end
      add_index :users, :email, unique: true
      add_index :users, :session_token
  end
end
