class Imes::D272hsController < ApplicationController
  before_action :set_imes_d272h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d272hs
  # GET /imes/d272hs.json
  def index
    @imes_d272hs = Imes::D272h.all
  end

  # GET /imes/d272hs/1
  # GET /imes/d272hs/1.json
  def show
  end

  # GET /imes/d272hs/new
  def new
    @imes_d272h = Imes::D272h.new
  end

  # GET /imes/d272hs/1/edit
  def edit
  end

  # POST /imes/d272hs
  # POST /imes/d272hs.json
  def create
    @imes_d272h = Imes::D272h.new(imes_d272h_params)

    respond_to do |format|
      if @imes_d272h.save
        format.html { redirect_to @imes_d272h, notice: 'D272h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d272h }
      else
        format.html { render :new }
        format.json { render json: @imes_d272h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d272hs/1
  # PATCH/PUT /imes/d272hs/1.json
  def update
    respond_to do |format|
      if @imes_d272h.update(imes_d272h_params)
        format.html { redirect_to @imes_d272h, notice: 'D272h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d272h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d272h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d272hs/1
  # DELETE /imes/d272hs/1.json
  def destroy
    @imes_d272h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d272hs_url, notice: 'D272h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d272h
      @imes_d272h = Imes::D272h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d272h_params
      params.fetch(:imes_d272h, {})
    end
end
