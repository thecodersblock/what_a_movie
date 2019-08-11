class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :year
      t.string :director, null: true

      t.timestamps
    end
  end
end
