class Imes::D034hsController < ApplicationController
  before_action :set_imes_d034h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d034hs
  # GET /imes/d034hs.json
  def index
    if params[:sbm].present?
      @imes_d034hs = Imes::D034h
                         .where("vbeln like '%#{params[:vbeln]}%'")
                         .where("kunnr like '%#{params[:kunnr]}%'")
                         .where("matnr like '%#{params[:matnr]}%'")
                         .where("sqyh like '%#{params[:sqyh]}%'")
                         .where("audat like '%#{params[:audat]}%'")
                         .order(audat: :desc)
                         .page params[:page]
    else
      @imes_d034hs = []
    end

  end

  # GET /imes/d034hs/1
  # GET /imes/d034hs/1.json
  def show
  end

  def get_vbeln
  end

  def destroy_d034m
    imes_d034m = Imes::D034m.find(params[:uuid])
    @imes_d034h = Imes::D034h.find(imes_d034m.bdbh)
    imes_d034m.destroy
  end

  def create_d034m
    sql = "select aufnr from sapsr3.afpo where mandt='168' and aufnr=? and matnr=?"
    @aufks = Sapdb.find_by_sql([sql,params[:aufnr].rjust(12, '0'), params[:matnr]])
    if @aufks.present?
      @imes_d034h = Imes::D034h.find(params[:bdbh])
      sql = "select id from imes.d034l where vbeln=? and posnr=?"
      d034l = Imes::D034l.find_by_sql([sql, @imes_d034h.vbeln, params[:posnr]])
      Imes::D034m.create(
          d034l_id: d034l.present? ? d034l.first.id : 0,
          bdbh: @imes_d034h.bdbh,
          vbeln: @imes_d034h.vbeln,
          posnr: params[:posnr],
          aufnr: @aufks.first.aufnr,
          strdate: params[:strdate],
          duedate: params[:duedate],
          creator: current_user.email
      )
    end
  end

  def str_qhlc
    @imes_d034h = Imes::D034h.find(params[:bdbh])
    array = []
    array = array + params[:caigou].split(',') if params[:caigou].present?
    array = array + params[:shengguan].split(',') if params[:shengguan].present?
    array = array + params[:zhihui].split(',') if params[:zhihui].present?
    array = array + params[:shenhe].split(',') if params[:shenhe].present?
    array = array + params[:hezhun].split(',') if params[:hezhun].present?

    hash = User.validate_mail_id(array)
    if hash.values.include?('NG')
      list = []
      hash.keys.each do |key|
        list.append key if hash[key].eql?('NG')
      end
      @user_error = "#{list.join(',')} 審核名字不存在, 請更改!"
      render :new
    else
      @imes_d034h.str_qhlc(params)
      redirect_to @imes_d034h
    end
  end

  # GET /imes/d034hs/new
  def new
    if params[:vbeln].blank?
      redirect_to get_vbeln_imes_d034hs_path, notice: 'SO號碼不存在, 請重新輸入'
    else
      @imes_d034h = Imes::D034h.find_by_vbeln(params[:vbeln])
      if @imes_d034h.blank?
        @imes_d034h = Imes::D034h.new
        @imes_d034h.sqyh = current_user.email.split('@').first.upcase
        @imes_d034h.sqsj = Time.now
        @imes_d034h.vbeln = params[:vbeln]
        @imes_d034h.create_record
      end
      if @imes_d034h.blank? or @imes_d034h.matnr.blank?
        redirect_to get_vbeln_imes_d034hs_path, notice: 'SO號碼不存在或者狀態不對, 請重新輸入'
      else
        render :new
      end
    end
  end

  # GET /imes/d034hs/1/edit
  def edit
  end

  # POST /imes/d034hs
  # POST /imes/d034hs.json
  def create
    @imes_d034h = Imes::D034h.new(imes_d034h_params)

    respond_to do |format|
      if @imes_d034h.save
        format.html { redirect_to @imes_d034h, notice: 'D034h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d034h }
      else
        format.html { render :new }
        format.json { render json: @imes_d034h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d034hs/1
  # PATCH/PUT /imes/d034hs/1.json
  def update
    respond_to do |format|
      if @imes_d034h.update(imes_d034h_params)
        format.html { redirect_to @imes_d034h, notice: 'D034h was successfully updated.' }
        format.json { render :show, status: :ok, location: @imes_d034h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d034h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d034hs/1
  # DELETE /imes/d034hs/1.json
  def destroy
    @imes_d034h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d034hs_url, notice: 'D034h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_imes_d034h
    @imes_d034h = Imes::D034h.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def imes_d034h_params
    params.require(:imes_d034h).permit(:vbeln, :audat, :auart, :auartx, :matnr, :werks, :pwerk, :kunnr, :name1, :addr1, :bstkd, :kdmat, :inco1, :inco2, :vbsed, :quote, :waerk, :netpr, :exrate, :mat, :lab, :ovh, :mch, :profit, :sqyh, :sqsj, :qhyh, :qhsj, :bdjg, :gsdm, :bdbh, :bddm, :bdzt, :mark1, :mark2)
  end
end
