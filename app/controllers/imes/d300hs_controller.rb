class Imes::D300hsController < ApplicationController
  before_action :set_imes_d300h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d300hs
  # GET /imes/d300hs.json
  def index
    @imes_d300hs = Imes::D300h.all
  end

  # GET /imes/d300hs/1
  # GET /imes/d300hs/1.json
  def show
  end

  # GET /imes/d300hs/new
  def new
    @imes_d300h = Imes::D300h.new
  end

  # GET /imes/d300hs/1/edit
  def edit
  end

  # POST /imes/d300hs
  # POST /imes/d300hs.json
  def create
    @imes_d300h = Imes::D300h.new(imes_d300h_params)

    respond_to do |format|
      if @imes_d300h.save
        format.html { redirect_to @imes_d300h, notice: 'D300h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d300h }
      else
        format.html { render :new }
        format.json { render json: @imes_d300h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d300hs/1
  # PATCH/PUT /imes/d300hs/1.json
  def update
    respond_to do |format|
      if @imes_d300h.update(imes_d300h_params)
        format.html { redirect_to @imes_d300h, notice: 'D300h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d300h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d300h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d300hs/1
  # DELETE /imes/d300hs/1.json
  def destroy
    @imes_d300h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d300hs_url, notice: 'D300h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d300h
      @imes_d300h = Imes::D300h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d300h_params
      params.fetch(:imes_d300h, {})
    end
end
