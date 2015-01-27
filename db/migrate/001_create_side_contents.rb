class CreateSideContents < ActiveRecord::Migration
  def change
    create_table :side_contents do |t|
      t.integer  :user_id
      t.integer  :project_id
      t.text     :text
      t.datetime :created_on, :null => false
      t.datetime :updated_on, :null => false
    end
    add_index "side_contents", ["user_id", "project_id"], :unique => true
  end
end
