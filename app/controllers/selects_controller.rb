class SelectsController < ApplicationController
  skip_before_filter :authenticate_user!
  autocomplete :sap_mara, :matnr, {:class_name=> 'Sap::Mara', limit: 15}

  def user
    users = []
    User.search(params[:q].split(',').last).each do |row|
      # users.append [row.mail.first.upcase, row.mail.first.upcase]
      users.append row.mail.first.split('@').first.upcase
    end
    render :json => users.sort
  end

  # def failure
  #   options = []
  #   failures = Ipqc::Failure
  #                  .where("name like '%#{params[:q]}%'")
  #                  .select(:uuid, :name, :ktext)
  #                  .order(name: :asc)
  #   failures.each do |row|
  #     options.append [row.uuid, "#{row.name} #{row.ktext}"]
  #   end
  #   render json: options.to_json
  # end


end
