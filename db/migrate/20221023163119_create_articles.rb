class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.datetime :scheduled_published_at
      t.datetime :published_at

      t.timestamps
    end
  end
end
