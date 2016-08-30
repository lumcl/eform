class Imes::D302hsController < ApplicationController
  before_action :set_imes_d302h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d302hs
  # GET /imes/d302hs.json
  def index
    @imes_d302hs = Imes::D302h.all
  end

  # GET /imes/d302hs/1
  # GET /imes/d302hs/1.json
  def show
  end

  # GET /imes/d302hs/new
  def new
    @imes_d302h = Imes::D302h.new
  end

  # GET /imes/d302hs/1/edit
  def edit
  end

  # POST /imes/d302hs
  # POST /imes/d302hs.json
  def create
    @imes_d302h = Imes::D302h.new(imes_d302h_params)

    respond_to do |format|
      if @imes_d302h.save
        format.html { redirect_to @imes_d302h, notice: 'D302h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d302h }
      else
        format.html { render :new }
        format.json { render json: @imes_d302h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d302hs/1
  # PATCH/PUT /imes/d302hs/1.json
  def update
    respond_to do |format|
      if @imes_d302h.update(imes_d302h_params)
        format.html { redirect_to @imes_d302h, notice: 'D302h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d302h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d302h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d302hs/1
  # DELETE /imes/d302hs/1.json
  def destroy
    @imes_d302h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d302hs_url, notice: 'D302h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d302h
      @imes_d302h = Imes::D302h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d302h_params
      params.fetch(:imes_d302h, {})
    end
end
