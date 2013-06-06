class InternshipReportController < ApplicationController
  #def index
   # render :file => 'app\views\interships\_form.html.erb'
  #end
  #def uploadFile
   # post = DataFile.save(params[:upload])
    #render :text => "File has been uploaded successfully"
  #end

  def show
    internship_report = Internship_report.find(params[:id])
    # do security check here
    send_file internship_report.data.path, :type => internship_report.data_content_type
  end
end
