class CreateDataFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :data_files do |t|
      t.string :emails
      t.attachment :csv_upload
      t.timestamps
    end
  end
end
