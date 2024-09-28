class AddBloodTypeHeightWeightToPatients < ActiveRecord::Migration[7.2]
  def change
    add_column :patients, :blood_type, :string
    add_column :patients, :height, :decimal
    add_column :patients, :weight, :decimal
  end
end
