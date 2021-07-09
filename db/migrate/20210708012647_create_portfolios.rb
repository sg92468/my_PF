class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :name, null: false
      t.text :information
      t.string :site_url
      t.string :github_url, null: false
      t.string :use_language, null: false
      t.string :genre, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
