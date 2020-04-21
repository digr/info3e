class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.date :date
      t.belongs_to :cource
      t.belongs_to :user
      t.timestamps
    end
  end
end
