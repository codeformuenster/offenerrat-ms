class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.references :gremium
      t.timestamps
    end
  end
end
