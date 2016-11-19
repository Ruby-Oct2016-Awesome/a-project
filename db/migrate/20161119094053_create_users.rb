class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :password_digest
      t.string :name
      t.string :credit_card
      t.string :air_credit

      t.timestamps
    end
  end
end
