class Add < ActiveRecord::Migration
  def change
  	add_column :stats, :site_id, :integer
  end
end
