class Imes::QhBdbhsController < ApplicationController
  before_action :set_imes_qh_bdbh, only: [:show, :edit, :update, :destroy]

  # GET /imes/qh_bdbhs
  # GET /imes/qh_bdbhs.json
  def index
    @imes_qh_bdbhs = Imes::QhBdbh.all
  end

  # GET /imes/qh_bdbhs/1
  # GET /imes/qh_bdbhs/1.json
  def show
  end

  # GET /imes/qh_bdbhs/new
  def new
    @imes_qh_bdbh = Imes::QhBdbh.new
  end

  # GET /imes/qh_bdbhs/1/edit
  def edit
  end

  # POST /imes/qh_bdbhs
  # POST /imes/qh_bdbhs.json
  def create
    @imes_qh_bdbh = Imes::QhBdbh.new(imes_qh_bdbh_params)

    respond_to do |format|
      if @imes_qh_bdbh.save
        format.html { redirect_to @imes_qh_bdbh, notice: 'Qh bdbh was successfully created.' }
        format.json { render :show, status: :created, location: @imes_qh_bdbh }
      else
        format.html { render :new }
        format.json { render json: @imes_qh_bdbh.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/qh_bdbhs/1
  # PATCH/PUT /imes/qh_bdbhs/1.json
  def update
    respond_to do |format|
      if @imes_qh_bdbh.update(imes_qh_bdbh_params)
        format.html { redirect_to @imes_qh_bdbh, notice: 'Qh bdbh was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_qh_bdbh }
      else
        format.html { render :edit }
        format.json { render json: @imes_qh_bdbh.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/qh_bdbhs/1
  # DELETE /imes/qh_bdbhs/1.json
  def destroy
    @imes_qh_bdbh.destroy
    respond_to do |format|
      format.html { redirect_to imes_qh_bdbhs_url, notice: 'Qh bdbh was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_qh_bdbh
      @imes_qh_bdbh = Imes::QhBdbh.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_qh_bdbh_params
      params.require(:imes_qh_bdbh).permit(:gsdm, :bddm, :bdyr, :bdqz, :bdhm)
    end
end
