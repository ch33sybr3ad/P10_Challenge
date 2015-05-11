class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobtitle, :company, :location, :snippet, :url, :jobkey

      t.timestamps null: false
    end
  end
end