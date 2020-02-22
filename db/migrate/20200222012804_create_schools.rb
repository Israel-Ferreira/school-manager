class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :title
      t.string :owner_email
      t.string :s_domain
      t.string :pitch

      t.timestamps
    end
  end
end
