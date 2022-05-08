class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password_digest
      t.string :role

      t.timestamps
    end
    add_index :accounts, :email
  end
end
