class AddAssocToTasks < ActiveRecord::Migration[6.0]
  def change
    change_table :tasks do |t|
      t.belongs_to :cource
    end
  end
end
