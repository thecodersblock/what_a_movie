class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end

    create_table :genres_movies, id: false do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :genre, index: true
    end

    create_table :movies_users, id: false do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :user, index: true
    end

  end
end
