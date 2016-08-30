class Imes::D189hsController < ApplicationController
  before_action :set_imes_d189h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d189hs
  # GET /imes/d189hs.json
  def index
    @imes_d189hs = Imes::D189h.all
  end

  # GET /imes/d189hs/1
  # GET /imes/d189hs/1.json
  def show
  end

  # GET /imes/d189hs/new
  def new
    @imes_d189h = Imes::D189h.new
  end

  # GET /imes/d189hs/1/edit
  def edit
  end

  # POST /imes/d189hs
  # POST /imes/d189hs.json
  def create
    @imes_d189h = Imes::D189h.new(imes_d189h_params)

    respond_to do |format|
      if @imes_d189h.save
        format.html { redirect_to @imes_d189h, notice: 'D189h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d189h }
      else
        format.html { render :new }
        format.json { render json: @imes_d189h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d189hs/1
  # PATCH/PUT /imes/d189hs/1.json
  def update
    respond_to do |format|
      if @imes_d189h.update(imes_d189h_params)
        format.html { redirect_to @imes_d189h, notice: 'D189h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d189h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d189h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d189hs/1
  # DELETE /imes/d189hs/1.json
  def destroy
    @imes_d189h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d189hs_url, notice: 'D189h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d189h
      @imes_d189h = Imes::D189h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d189h_params
      params.fetch(:imes_d189h, {})
    end
end
