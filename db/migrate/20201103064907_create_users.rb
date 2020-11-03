class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :website_url
      t.string :url_slug 

      t.timestamps
    end
  end
end
