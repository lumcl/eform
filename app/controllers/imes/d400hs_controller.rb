class Imes::D400hsController < ApplicationController
  before_action :set_imes_d400h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d400hs
  # GET /imes/d400hs.json
  def index
    @imes_d400hs = Imes::D400h.all
  end

  # GET /imes/d400hs/1
  # GET /imes/d400hs/1.json
  def show
  end

  # GET /imes/d400hs/new
  def new
    @imes_d400h = Imes::D400h.new
  end

  # GET /imes/d400hs/1/edit
  def edit
  end

  # POST /imes/d400hs
  # POST /imes/d400hs.json
  def create
    @imes_d400h = Imes::D400h.new(imes_d400h_params)

    respond_to do |format|
      if @imes_d400h.save
        format.html { redirect_to @imes_d400h, notice: 'D400h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d400h }
      else
        format.html { render :new }
        format.json { render json: @imes_d400h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d400hs/1
  # PATCH/PUT /imes/d400hs/1.json
  def update
    respond_to do |format|
      if @imes_d400h.update(imes_d400h_params)
        format.html { redirect_to @imes_d400h, notice: 'D400h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d400h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d400h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d400hs/1
  # DELETE /imes/d400hs/1.json
  def destroy
    @imes_d400h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d400hs_url, notice: 'D400h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d400h
      @imes_d400h = Imes::D400h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d400h_params
      params.fetch(:imes_d400h, {})
    end
end
