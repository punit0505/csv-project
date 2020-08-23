class SendCsvMailer < ApplicationMailer
	def send_csv_to_email(email, tempfile)
      attachments['data_file.csv'] = File.read(tempfile)
	  mail( :to => email,
	  :subject => 'CSV Data' )
	end
end
