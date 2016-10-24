class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :description
      t.text :body
      t.references :designer, index: true
      t.references :season, index: true

      t.timestamps null: false
    end
  end
end
