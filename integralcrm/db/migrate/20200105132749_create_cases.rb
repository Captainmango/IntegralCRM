class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :owner #alias for user.id
      t.integer :client_id
      t.string :status
      t.string :open_date
      t.string :close_date
      t.string :add_info
      t.timestamps
    end
  end
end
