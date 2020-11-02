class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.string :device_type
      t.string :service_tag
      t.string :os
      t.integer :user_id

      t.timestamps
    end
  end
end
