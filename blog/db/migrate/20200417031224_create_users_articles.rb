class CreateUsersArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :users_articles do |t|
      t.references :users, foreign_key: true
      t.references :articles, foreign_key: true

      t.timestamps
    end
  end
end
