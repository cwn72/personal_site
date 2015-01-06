class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :resume, index: true
      t.string :name
      t.integer :experience
      t.integer :years

      t.timestamps
    end
  end
end
