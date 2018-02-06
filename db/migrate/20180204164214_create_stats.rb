class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :service
      t.string :kind
      t.integer :value
      t.integer :popularity

      t.timestamps null: false
    end
  end
end
