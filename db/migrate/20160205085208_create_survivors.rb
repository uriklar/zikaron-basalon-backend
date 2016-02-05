class CreateSurvivors < ActiveRecord::Migration
  def change
    create_table :survivors do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.boolean :contacted

      t.timestamps
    end
  end
end
