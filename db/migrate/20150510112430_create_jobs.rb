class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobtitle, :company, :location, :snippet, :url, :jobkey, :website, :rating, :logo

      t.timestamps null: false
    end
  end
end