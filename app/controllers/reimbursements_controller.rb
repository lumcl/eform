class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: [:show, :edit, :update, :destroy]

  # GET /reimbursements
  # GET /reimbursements.json
  def index
    @reimbursements = Reimbursement.all.page(params[:page])
  end

  # GET /reimbursements/1
  # GET /reimbursements/1.json
  def show
  end

  # GET /reimbursements/new
  def new
    @reimbursement = Reimbursement.new
    @reimbursement.bukrs = current_user.company
    @reimbursement.waers = current_user.waers
    @reimbursement.owner = current_user
  end

  # GET /reimbursements/1/edit
  def edit
  end

  # POST /reimbursements
  # POST /reimbursements.json
  def create
    @reimbursement = Reimbursement.new(reimbursement_params)
    @reimbursement.budat = Time.now
    @reimbursement.bldat = Time.now
    @reimbursement.creator = current_user
    @reimbursement.creator_ip = request.ip
    @reimbursement.updater = current_user
    @reimbursement.updater_ip = request.ip
    respond_to do |format|
      if @reimbursement.save
        format.html { redirect_to @reimbursement, notice: 'Reimbursement was successfully created.' }
        format.json { render :show, status: :created, location: @reimbursement }
      else
        format.html { render :new }
        format.json { render json: @reimbursement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reimbursements/1
  # PATCH/PUT /reimbursements/1.json
  def update
    @reimbursement.updater = current_user
    @reimbursement.updater_ip = request.ip
    respond_to do |format|
      if @reimbursement.update(reimbursement_params)
        format.html { redirect_to @reimbursement, notice: 'Reimbursement was successfully updated.' }
        format.json { render :show, status: :ok, location: @reimbursement }
      else
        format.html { render :edit }
        format.json { render json: @reimbursement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reimbursements/1
  # DELETE /reimbursements/1.json
  def destroy
    @reimbursement.destroy
    respond_to do |format|
      format.html { redirect_to reimbursements_url, notice: 'Reimbursement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reimbursement
      @reimbursement = Reimbursement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reimbursement_params
      params.require(:reimbursement).permit(:name, :bukrs, :belnr, :gjahr, :blart, :budat, :bldat, :waers, :subject, :body, :approved, :status, :deleted, :owner_id, :creator_id, :updater_id, :creator_ip, :updater_ip, :uuid)
    end
end
