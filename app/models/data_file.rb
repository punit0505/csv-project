class DataFile < ApplicationRecord
	has_attached_file :csv_upload
	validates_attachment :csv_upload,
	                     presence: true,
	                     size: { in: 0..250.megabytes }

	validates_attachment_content_type :csv_upload,
	                                  content_type: [
	                                    'text/plain',
	                                    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']

    validates :emails, presence: true
                                 
end
