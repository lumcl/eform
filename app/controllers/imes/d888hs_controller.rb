class Imes::D888hsController < ApplicationController
  before_action :set_imes_d888h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d888hs
  # GET /imes/d888hs.json
  def index
    @imes_d888hs = Imes::D888h.all
  end

  # GET /imes/d888hs/1
  # GET /imes/d888hs/1.json
  def show
  end

  # GET /imes/d888hs/new
  def new
    @imes_d888h = Imes::D888h.new
  end

  # GET /imes/d888hs/1/edit
  def edit
  end

  # POST /imes/d888hs
  # POST /imes/d888hs.json
  def create
    @imes_d888h = Imes::D888h.new(imes_d888h_params)

    respond_to do |format|
      if @imes_d888h.save
        format.html { redirect_to @imes_d888h, notice: 'D888h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d888h }
      else
        format.html { render :new }
        format.json { render json: @imes_d888h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d888hs/1
  # PATCH/PUT /imes/d888hs/1.json
  def update
    respond_to do |format|
      if @imes_d888h.update(imes_d888h_params)
        format.html { redirect_to @imes_d888h, notice: 'D888h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d888h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d888h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d888hs/1
  # DELETE /imes/d888hs/1.json
  def destroy
    @imes_d888h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d888hs_url, notice: 'D888h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d888h
      @imes_d888h = Imes::D888h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d888h_params
      params.fetch(:imes_d888h, {})
    end
end
