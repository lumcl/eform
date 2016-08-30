class Imes::FileUploadersController < ApplicationController

  def bd_file_upload
    if params[:file].present?
      imes_action = params[:imes_action]
      gsdm = params[:gsdm]
      bddm = params[:bddm]
      bdbh = params[:bdbh]
      url = "http://172.31.4.177:8080/iMes/FileUploader?action=#{imes_action}&GSDM=#{gsdm}&BDBH=#{bdbh}&BDDM=#{bddm}"
      Timeout::timeout(30) do
        RestClient.post url, {file: params[:file]}
      end
    end
    redirect_to url_for(controller: "imes/#{bddm.downcase}hs", action: 'show', id: bdbh)
  end
end
