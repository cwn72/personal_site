class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :resume, index: true
      t.string :job_title
      t.string :company
      t.boolean :current
      t.date :start_date
      t.date :end_date
      t.text :overview

      t.timestamps
    end
  end
end
