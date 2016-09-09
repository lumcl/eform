class Imes::D238hsController < ApplicationController
  before_action :set_imes_d238h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d238hs
  # GET /imes/d238hs.json
  def index
    @imes_d238hs = Imes::D238h.all
  end

  # GET /imes/d238hs/1
  # GET /imes/d238hs/1.json
  def show
  end

  # GET /imes/d238hs/new
  def new
    @imes_d238h = Imes::D238h.new
    @imes_d238h.apply_date = Time.now
    @imes_d238h.bdrq = Time.now
    @imes_d238h.bddm = 'D238'
    @imes_d238h.applicant = current_user.email.split('@').first.upcase
  end

  def tooling
  end

  # GET /imes/d238hs/1/edit
  def edit
  end

  # POST /imes/d238hs
  # POST /imes/d238hs.json
  def create
    @imes_d238h = Imes::D238h.new(imes_d238h_params)
    respond_to do |format|
      if @imes_d238h.save
        format.html { redirect_to @imes_d238h, notice: 'D238h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d238h }
      else
        format.html { render :new }
        format.json { render json: @imes_d238h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d238hs/1
  # PATCH/PUT /imes/d238hs/1.json
  def update
    respond_to do |format|
      if @imes_d238h.update(imes_d238h_params)
        format.html { redirect_to @imes_d238h, notice: 'D238h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d238h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d238h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d238hs/1
  # DELETE /imes/d238hs/1.json
  def destroy
    @imes_d238h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d238hs_url, notice: 'D238h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d238h
      @imes_d238h = Imes::D238h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d238h_params
      params.require(:imes_d238h).permit(:company_site, :required_department, :applicant, :sro_no, :customer_name, :customer_id, :lei_design_no, :asset_code, :apply_date, :beneficiary, :charge_code, :electronic_engineer, :electronic_engineer_ext, :mechanical_engineer, :mechanical_engineer_ext, :cavity_quantity, :tooling_life, :ee_spec, :power_application, :currency, :target_price, :est_qty, :est_product_life, :est_cost, :gross_profit, :lei_drawing, :tooling_schedule, :tooling_drawing, :approval_record, :est_delivery_date, :required_sample_amount, :required_sample_color, :new_tooling_proposal, :apply_item, :tooling_category, :ac_pin, :payment_provider, :est_tooling_charge, :est_safty_charge, :est_profit_after_1st_year, :verification_requirement, :m_e_department, :specified_material, :attachment, :purchasing_department, :supplier, :reason, :attachment01, :tooling_material, :min_life_cycle_tooling, :related_cost, :tooling_cost, :unit_price, :est_tooling_schedule, :t1, :ppr, :mp, :execution_requirement, :me_en_department, :open_tooling_date, :verification_status, :fail_reason_desc, :attachment11, :lei_p_n, :c_e_department, :approval_date, :attachment1, :verification_status, :fail_reason, :component_approval_code, :purchasing_department, :approval_date, :attachment21, :approval_schedule, :sales_department, :est_payment_date, :est, :payment1, :actual_payment_receipt_date, :actual, :payment2, :est_forecasted_demand, :actual_demand, :cus_pay_amount, :cus_pay_accrued_into, :lei_pay_amount, :lei_pay_accrued_into, :gsdm, :bddm, :bdbh, :bdrq, :bdzt, :qhyh, :qhsj, :yxsj, :jlyh, :jlsj, :gxyh, :gxsj, :bdjg, :bdfd, {:production_site => []})
    end
end
