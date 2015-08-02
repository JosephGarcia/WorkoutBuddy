class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :height
      t.integer :weight
      t.string :education
      t.string :strengths
      t.string :weaknesses
      t.string :goals
      t.string :memberships
      t.string :equipment
      t.string :activities
      t.string :photo
      t.references :user
      t.timestamps null: false
    end
  end
end
