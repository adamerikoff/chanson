class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, index: {unique: true}, null: false
      t.string :password_digest, null: false
      t.boolean :admin_status, default: false

      t.timestamps
    end
  end
end
