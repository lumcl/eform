class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :auto_login
  before_action :authenticate_user!

  # rescue_from OCIError, :with => :oci_error

  #config.web_console.whitelisted_ips = '172.91.132.0/16'

  def auto_login
    return false if current_user or params[:juid].blank?

    if params[:juid].present? and params[:SID].present?
      str = "#{params[:BDBH]}#{params[:juid]}#{Date.today.strftime('%Y%m%d')}"
      if Digest::MD5.hexdigest(str).eql?(params[:SID])
          user = User.find_by_email "#{params[:juid].downcase}@l-e-i.com"
        if user.blank?
          user = User.create({email: "#{params[:juid].downcase}@l-e-i.com"})
        end
        sign_in(user)
      end
    end
    false

  end

  def text_area_to_array(text_area)
    array = Array.new
    buf = text_area.split("\n")
    buf.each do |s|
      array << s.strip.gsub("\r","")
    end
    array
  end


end
