class ChangeHeightTypeInInformation < ActiveRecord::Migration
  def change
  	    change_column :information, :height, :string
  end
end
