class AddDateToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :date, :string
  end
end
