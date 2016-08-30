class Imes::QhBdlcsController < ApplicationController
  before_action :set_imes_qh_bdlc, only: [:show, :edit, :update, :destroy]

  # GET /imes/qh_bdlcs
  # GET /imes/qh_bdlcs.json
  def index
    @imes_qh_bdlcs = Imes::QhBdlc.where(qhzt: '2', ysyh: current_user.email.split('@').first.upcase).order(yjsj: :desc)
  end

  # GET /imes/qh_bdlcs/1
  # GET /imes/qh_bdlcs/1.json
  def show
  end

  # GET /imes/qh_bdlcs/new
  def new
    @imes_qh_bdlc = Imes::QhBdlc.new
  end

  # GET /imes/qh_bdlcs/1/edit
  def edit
  end

  # POST /imes/qh_bdlcs
  # POST /imes/qh_bdlcs.json
  def create
    @imes_qh_bdlc = Imes::QhBdlc.new(imes_qh_bdlc_params)

    respond_to do |format|
      if @imes_qh_bdlc.save
        format.html { redirect_to @imes_qh_bdlc, notice: 'Qh bdlc was successfully created.' }
        format.json { render :show, status: :created, location: @imes_qh_bdlc }
      else
        format.html { render :new }
        format.json { render json: @imes_qh_bdlc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/qh_bdlcs/1
  # PATCH/PUT /imes/qh_bdlcs/1.json
  def update

    @imes_qh_bdlc.qhyh = current_user.email.split('@').first.upcase
    @imes_qh_bdlc.qhsj = Time.now
    @imes_qh_bdlc.qhjg = params[:qhjg]
    if params[:qhnr].present?
      @imes_qh_bdlc.qhnr = params[:qhnr]
    else
      @imes_qh_bdlc.qhnr = '同意' if params[:qhjg].eql?('Y')
      @imes_qh_bdlc.qhnr = '退件' if params[:qhjg].eql?('N')
      @imes_qh_bdlc.qhnr = '會簽' if params[:qhjg].eql?('H')
    end

    @imes_qh_bdlc.qhzt = '3'
    @imes_qh_bdlc.create_hui_qian(params[:email]) if params[:email].present?

    respond_to do |format|
      if @imes_qh_bdlc.save
        if params[:file].present?
          url = "http://172.31.4.177:8080/iMes/FileUploader?action=QianHe&GSDM=#{@imes_qh_bdlc.gsdm}&BDBH=#{@imes_qh_bdlc.bdbh}&BDDM=#{@imes_qh_bdlc.bddm}&BZDM=#{@imes_qh_bdlc.bzdm}"
          Timeout::timeout(30) do
            RestClient.post url, {file: params[:file]}
          end
        end
        classname = "Imes::#{@imes_qh_bdlc.bddm}h"
        if @imes_qh_bdlc.qhlx.eql?('A') and Object.const_defined?(classname)
          if @imes_qh_bdlc.qhjg.eql?('Y')
            klass = Object.const_get(classname)
            if klass.instance_methods.include?(:after_approved)
              object = klass.find(@imes_qh_bdlc.bdbh)
              object.after_approved
            end
          elsif @imes_qh_bdlc.qhjg.eql?('N')
            klass = Object.const_get(classname)
            if klass.instance_methods.include?(:after_rejected)
              object = klass.find(@imes_qh_bdlc.bdbh)
              object.after_rejected
            end
          end
        end
        format.html { redirect_to root_url }
        format.json { render :show, status: :ok, location: @imes_qh_bdlc }
      else
        format.html { redirect_to root_url }
        format.json { render json: @imes_qh_bdlc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/qh_bdlcs/1
  # DELETE /imes/qh_bdlcs/1.json
  def destroy
    @imes_qh_bdlc.destroy
    respond_to do |format|
      format.html { redirect_to imes_qh_bdlcs_url, notice: 'Qh bdlc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_imes_qh_bdlc
    @imes_qh_bdlc = Imes::QhBdlc.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def imes_qh_bdlc_params
    params.fetch(:imes_qh_bdlc, {})
  end
end
