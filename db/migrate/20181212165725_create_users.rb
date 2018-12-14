class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :parent_name
      t.string :parent_email
      t.string :password_digest
      t.string :child_username

      t.timestamps
    end
  end
end
