class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :login
      t.string :email
      t.string :name
      t.string :encrypted_access_token

      t.timestamps
    end
  end
end
