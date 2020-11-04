class AddColumnHeadingsInUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users ,:headings, :string
  end
end
