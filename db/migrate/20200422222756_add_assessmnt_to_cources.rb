class AddAssessmntToCources < ActiveRecord::Migration[6.0]
  def change
    add_column :cources, :assessmnt, :boolean
  end
end
