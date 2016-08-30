class Imes::D600hsController < ApplicationController
  before_action :set_imes_d600h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d600hs
  # GET /imes/d600hs.json
  def index
    @imes_d600hs = Imes::D600h.all
  end

  # GET /imes/d600hs/1
  # GET /imes/d600hs/1.json
  def show
  end

  # GET /imes/d600hs/new
  def new
    @imes_d600h = Imes::D600h.new
  end

  # GET /imes/d600hs/1/edit
  def edit
  end

  # POST /imes/d600hs
  # POST /imes/d600hs.json
  def create
    @imes_d600h = Imes::D600h.new(imes_d600h_params)

    respond_to do |format|
      if @imes_d600h.save
        format.html { redirect_to @imes_d600h, notice: 'D600h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d600h }
      else
        format.html { render :new }
        format.json { render json: @imes_d600h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d600hs/1
  # PATCH/PUT /imes/d600hs/1.json
  def update
    respond_to do |format|
      if @imes_d600h.update(imes_d600h_params)
        format.html { redirect_to @imes_d600h, notice: 'D600h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d600h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d600h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d600hs/1
  # DELETE /imes/d600hs/1.json
  def destroy
    @imes_d600h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d600hs_url, notice: 'D600h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d600h
      @imes_d600h = Imes::D600h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d600h_params
      params.fetch(:imes_d600h, {})
    end
end
