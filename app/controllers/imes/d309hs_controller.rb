class Imes::D309hsController < ApplicationController
  before_action :set_imes_d309h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d309hs
  # GET /imes/d309hs.json
  def index
    @imes_d309hs = Imes::D309h.all
  end

  # GET /imes/d309hs/1
  # GET /imes/d309hs/1.json
  def show
  end

  # GET /imes/d309hs/new
  def new
    @imes_d309h = Imes::D309h.new
  end

  # GET /imes/d309hs/1/edit
  def edit
  end

  # POST /imes/d309hs
  # POST /imes/d309hs.json
  def create
    @imes_d309h = Imes::D309h.new(imes_d309h_params)

    respond_to do |format|
      if @imes_d309h.save
        format.html { redirect_to @imes_d309h, notice: 'D309h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d309h }
      else
        format.html { render :new }
        format.json { render json: @imes_d309h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d309hs/1
  # PATCH/PUT /imes/d309hs/1.json
  def update
    respond_to do |format|
      if @imes_d309h.update(imes_d309h_params)
        format.html { redirect_to @imes_d309h, notice: 'D309h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d309h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d309h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d309hs/1
  # DELETE /imes/d309hs/1.json
  def destroy
    @imes_d309h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d309hs_url, notice: 'D309h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d309h
      @imes_d309h = Imes::D309h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d309h_params
      params.fetch(:imes_d309h, {})
    end
end
