class Imes::D301hsController < ApplicationController
  before_action :set_imes_d301h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d301hs
  # GET /imes/d301hs.json
  def index
    @imes_d301hs = Imes::D301h.all
  end

  # GET /imes/d301hs/1
  # GET /imes/d301hs/1.json
  def show
  end

  # GET /imes/d301hs/new
  def new
    @imes_d301h = Imes::D301h.new
  end

  # GET /imes/d301hs/1/edit
  def edit
  end

  # POST /imes/d301hs
  # POST /imes/d301hs.json
  def create
    @imes_d301h = Imes::D301h.new(imes_d301h_params)

    respond_to do |format|
      if @imes_d301h.save
        format.html { redirect_to @imes_d301h, notice: 'D301h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d301h }
      else
        format.html { render :new }
        format.json { render json: @imes_d301h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d301hs/1
  # PATCH/PUT /imes/d301hs/1.json
  def update
    respond_to do |format|
      if @imes_d301h.update(imes_d301h_params)
        format.html { redirect_to @imes_d301h, notice: 'D301h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d301h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d301h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d301hs/1
  # DELETE /imes/d301hs/1.json
  def destroy
    @imes_d301h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d301hs_url, notice: 'D301h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d301h
      @imes_d301h = Imes::D301h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d301h_params
      params.fetch(:imes_d301h, {})
    end
end
