class FundingInfosController < ApplicationController
  before_action :set_funding_info, only: [:show, :edit, :update, :destroy]

  # GET /funding_infos
  # GET /funding_infos.json
  def index
    @funding_infos = FundingInfo.all
  end

  # GET /funding_infos/1
  # GET /funding_infos/1.json
  def show
  end

  # GET /funding_infos/new
  def new
		respond_to do |format|
			@funding_info = FundingInfo.new
			format.html
			@funding_info = FundingInfo.new(client_id: params[:client_id])
		  format.js	
		end
  end

  # GET /funding_infos/1/edit
  def edit
		respond_to do |format|
			format.html
			format.js
		end
  end

  # POST /funding_infos
  # POST /funding_infos.json
  def create
    @funding_info = FundingInfo.new(funding_info_params)

    respond_to do |format|
      if @funding_info.save
        format.html { redirect_to @funding_info, notice: 'Funding info was successfully created.' }
        format.json { render :show, status: :created, location: @funding_info }
				format.js
      else
        format.html { render :new }
        format.json { render json: @funding_info.errors, status: :unprocessable_entity }
				format.js
      end
    end
  end

  # PATCH/PUT /funding_infos/1
  # PATCH/PUT /funding_infos/1.json
  def update
    respond_to do |format|
      if @funding_info.update(funding_info_params)
        format.html { redirect_to @funding_info, notice: 'Funding info was successfully updated.' }
        format.json { render :show, status: :ok, location: @funding_info }
				format.js
      else
        format.html { render :edit }
        format.json { render json: @funding_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funding_infos/1
  # DELETE /funding_infos/1.json
  def destroy
    @funding_info.destroy
    respond_to do |format|
      format.html { redirect_to funding_infos_url, notice: 'Funding info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding_info
      @funding_info = FundingInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funding_info_params
      params.require(:funding_info).permit(:fund_code, :department_code, :program_code, :project_code, :account_code, :client_id)
    end
end
