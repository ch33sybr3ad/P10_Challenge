class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :users
      t.belongs_to :jobs

      t.timestamps null: false
    end
  end
end