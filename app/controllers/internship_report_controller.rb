class InternshipReportController < ApplicationController
  def index
    render :file => 'app\views\interships\_form.html.erb'
  end
  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
