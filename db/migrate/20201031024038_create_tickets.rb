class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.text :title
      t.text :description
      t.boolean :is_open
      t.string :issue_type
      t.integer :user_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
