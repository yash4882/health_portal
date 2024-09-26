class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :contact
      t.string :health_issue

      t.timestamps
    end
  end
end
