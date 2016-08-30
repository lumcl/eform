class AjaxsController < ApplicationController

  def download_imes_file
    require 'open-uri'
    url = "http://172.31.4.177:8080/iMes/FileDownloader?filePath=#{params[:bdfd]}"
    Timeout::timeout(30) do
      data = open(URI.escape(url)).read
      send_data data, disposition: 'attachment', filename: params[:bdfd].split('\\').last
    end
  end

  def upload_imes_file
    url = "http://172.31.4.177:8080/iMes/FileUploader?action=#{params[:zaction]}&GSDM=#{params[:gsdm]}&BDBH=#{params[:bdbh]}&BDDM=#{params[:bddm]}&BZDM=#{params[:bzdm]}"
    #url = "http://172.31.4.177:8080/iMes/FileUploader"
    puts "###################"
    puts params
    puts request
    puts url
    a = RestClient.post url, {
        file: params[:file]
        #file: File.new("/Users/lum/Downloads/abc.xls")
    }
    #a = RestClient.post url, {file: File.new("/Users/lum/Downloads/abc.xls", 'rb'), multipart: true}
    a.inspect
    puts a
    puts "##################"
    redirect_to :back
  end
end
