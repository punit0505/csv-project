class DataFileWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'csv'
  def perform(data_file_id)
    data_file = DataFile.find(data_file_id)
    tempfile = Tempfile.new('data_file'+data_file.id.to_s+'.csv')
    headers = ["Refrrel Url", "Landing Page URl"]

    CSV.open(tempfile, 'w', write_headers: true, headers: headers) do |writer|
        CSV.foreach((data_file.csv_upload.path), headers: true) do |csv| 
          if landing_page_url_exists
            writer << [ csv['referrel_url'],  csv['landing_page_url']]
          end
        end
    end
    data_file.emails.split(",").each do |email| 
      SendCsvMailer.send_csv_to_email(email, tempfile).deliver
    end  
  end
  #Scrap data for get landing page url present or not in Refrrel url
  def landing_page_url_exists
    #implement logic for scrpaing is remaining
     return true
  end  
end