class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.string :type
      t.string :service_tag
      t.string :os

      t.timestamps
    end
  end
end
