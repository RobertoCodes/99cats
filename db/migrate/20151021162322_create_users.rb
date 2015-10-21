class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.string :password_digest, null: false, unique: true
      t.string :session_token, presence: true
      t.timestamps
    end

    add_index :users, :session_token, unique: true
  end
end
