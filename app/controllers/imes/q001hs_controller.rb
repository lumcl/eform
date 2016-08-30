class Imes::Q001hsController < ApplicationController
  before_action :set_imes_q001h, only: [:show, :edit, :update, :destroy]

  # GET /imes/q001hs
  # GET /imes/q001hs.json
  def index
    @imes_q001hs = Imes::Q001h.all
  end

  # GET /imes/q001hs/1
  # GET /imes/q001hs/1.json
  def show
  end

  # GET /imes/q001hs/new
  def new
    @imes_q001h = Imes::Q001h.new
  end

  # GET /imes/q001hs/1/edit
  def edit
  end

  # POST /imes/q001hs
  # POST /imes/q001hs.json
  def create
    @imes_q001h = Imes::Q001h.new(imes_q001h_params)

    respond_to do |format|
      if @imes_q001h.save
        format.html { redirect_to @imes_q001h, notice: 'Q001h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_q001h }
      else
        format.html { render :new }
        format.json { render json: @imes_q001h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/q001hs/1
  # PATCH/PUT /imes/q001hs/1.json
  def update
    respond_to do |format|
      if @imes_q001h.update(imes_q001h_params)
        format.html { redirect_to @imes_q001h, notice: 'Q001h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_q001h }
      else
        format.html { render :edit }
        format.json { render json: @imes_q001h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/q001hs/1
  # DELETE /imes/q001hs/1.json
  def destroy
    @imes_q001h.destroy
    respond_to do |format|
      format.html { redirect_to imes_q001hs_url, notice: 'Q001h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_q001h
      @imes_q001h = Imes::Q001h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_q001h_params
      params.fetch(:imes_q001h, {})
    end
end
