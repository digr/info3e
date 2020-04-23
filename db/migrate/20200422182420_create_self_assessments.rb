class CreateSelfAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :self_assessments do |t|
      t.date :date
      t.integer :value
      t.belongs_to :cource
      t.belongs_to :user
      t.timestamps
    end
  end
end
