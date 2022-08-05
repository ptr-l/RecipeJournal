class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :category
      t.boolean :made
      t.datetime :when
      t.text :ingredients
      t.text :method
      t.text :review

      t.timestamps
    end
  end
end
