class Imes::D089hsController < ApplicationController
  before_action :set_imes_d089h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d089hs
  # GET /imes/d089hs.json
  def index
    @imes_d089hs = Imes::D089h.all
  end

  # GET /imes/d089hs/1
  # GET /imes/d089hs/1.json
  def show
  end

  # GET /imes/d089hs/new
  def new
    @imes_d089h = Imes::D089h.new
  end

  # GET /imes/d089hs/1/edit
  def edit
  end

  # POST /imes/d089hs
  # POST /imes/d089hs.json
  def create
    @imes_d089h = Imes::D089h.new(imes_d089h_params)

    respond_to do |format|
      if @imes_d089h.save
        format.html { redirect_to @imes_d089h, notice: 'D089h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d089h }
      else
        format.html { render :new }
        format.json { render json: @imes_d089h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d089hs/1
  # PATCH/PUT /imes/d089hs/1.json
  def update
    respond_to do |format|
      if @imes_d089h.update(imes_d089h_params)
        format.html { redirect_to @imes_d089h, notice: 'D089h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d089h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d089h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d089hs/1
  # DELETE /imes/d089hs/1.json
  def destroy
    @imes_d089h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d089hs_url, notice: 'D089h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_d089l
    return render js: "$('#result-#{params[:id]}').html('剔除失敗!')" if params[:dlttx].blank?
    d089l = Imes::D089l.find_by_id params[:id]
    d089l.dlttx = params[:dlttx]
    d089l.dltfg = 'Y'
    d089l.dltid = current_user.email.split('@').first.upcase
    d089l.dltdt = Time.now
    if d089l.save
      return render js: "$('#result-#{params[:id]}').html('');$('#submit-#{params[:id]}').html('已剔除');"
    else
      return render js: "$('#result-#{params[:id]}').html('剔除失敗!')"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d089h
      @imes_d089h = Imes::D089h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d089h_params
      params.fetch(:imes_d089h, {})
    end
end
