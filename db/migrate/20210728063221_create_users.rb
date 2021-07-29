class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.date :date_of_birth

      t.timestamps
    end
  end
end
