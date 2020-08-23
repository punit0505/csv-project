class DataFilesController < ApplicationController

	def new
		@data_file = DataFile.new
	end
    def index
    end
    def create
     data_file = DataFile.new(data_file_params)
     if data_file.save
     	DataFileWorker.perform_async(data_file.id)
     	flash[:info] = "Succesfully submited Email will be send in some time"
     else 	
        flash[:error] = "Something went wrong"
     end	
        redirect_to new_data_file_path
    end	


    private

    def data_file_params
      params.require(:data_file).permit(:csv_upload, :emails)
    end
end

