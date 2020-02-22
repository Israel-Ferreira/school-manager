class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.references :school, null: false, foreign_key: true
      t.string :description
      t.string :content
      t.string :duration
      t.timestamps
    end
  end
end
