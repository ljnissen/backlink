class AddIndexToStatsSiteId < ActiveRecord::Migration
  def change
  	    add_index :stats, :site_id
  end
end
