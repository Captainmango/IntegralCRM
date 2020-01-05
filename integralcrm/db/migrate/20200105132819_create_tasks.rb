class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :case_id
      t.integer :client_id
      t.string :content

      t.timestamps
    end
  end
end
