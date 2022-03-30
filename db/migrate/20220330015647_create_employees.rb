class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :job
      t.string :department
      t.integer :salary
      t.date :hire_date

      t.timestamps
    end
  end
end
