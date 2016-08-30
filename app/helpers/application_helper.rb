module ApplicationHelper
  def select_options_tag(name='',select_options={},options={})
    #set selected from value
    selected = ''
    unless options[:value].blank?
      selected = options[:value]
      options.delete(:value)
    end
    select_tag(name,options_for_select(select_options,selected),options)
  end

  def download_imes_file(filename)
    link_to '點擊本鏈接下載附檔 Download Attachment', "http://172.31.4.177:8080/iMes/FileDownloader?filePath=#{filename}"
  end
end
