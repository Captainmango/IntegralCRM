class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :owner #alias for user_id
      t.integer :client_id
      t.integer :case_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
