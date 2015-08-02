class AddInformationIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :information_id, :integer
  end
end
