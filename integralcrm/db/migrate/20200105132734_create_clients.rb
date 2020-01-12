class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :contact_number
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.string :email
      t.string :add_info
      t.integer :created_by
    end
  end
end
