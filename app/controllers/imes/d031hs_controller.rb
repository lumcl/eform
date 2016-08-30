class Imes::D031hsController < ApplicationController
  before_action :set_imes_d031h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d031hs
  # GET /imes/d031hs.json
  def index
    @imes_d031hs = Imes::D031h.all
  end

  # GET /imes/d031hs/1
  # GET /imes/d031hs/1.json
  def show
  end

  # GET /imes/d031hs/new
  def new
    @imes_d031h = Imes::D031h.new
  end

  # GET /imes/d031hs/1/edit
  def edit
  end

  # POST /imes/d031hs
  # POST /imes/d031hs.json
  def create
    @imes_d031h = Imes::D031h.new(imes_d031h_params)

    respond_to do |format|
      if @imes_d031h.save
        format.html { redirect_to @imes_d031h, notice: 'D031h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d031h }
      else
        format.html { render :new }
        format.json { render json: @imes_d031h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d031hs/1
  # PATCH/PUT /imes/d031hs/1.json
  def update
    respond_to do |format|
      if @imes_d031h.update(imes_d031h_params)
        format.html { redirect_to @imes_d031h, notice: 'D031h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d031h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d031h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d031hs/1
  # DELETE /imes/d031hs/1.json
  def destroy
    @imes_d031h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d031hs_url, notice: 'D031h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d031h
      @imes_d031h = Imes::D031h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d031h_params
      params.fetch(:imes_d031h, {})
    end
end
