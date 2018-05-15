class QueriesController < ApplicationController
  before_action :set_query, only: [:show, :edit, :update, :destroy]
  require 'csv'

  # GET /queries
  # GET /queries.json
  def index
    @queries = Query.all.order(:title)
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
    sql = Query.find_by_id(params[:id]).sql
    @result = DbConnectService::execute_sql(sql)
    has_header = true
    @csv_date = OutputFileService::generate_csv_from_active_record(@result, has_header)
    @header = @result.columns
  end

  # GET /queries/new
  def new
    @query = Query.new
  end

  # GET /queries/1/edit
  def edit
  end

  # POST /queries
  # POST /queries.json
  def create
    @query = Query.new(query_params)
    # update,insert文だと思われる場合は登録を禁止する。
    if DbConnectService::is_insert_or_update_sql(@query.sql)
      flash.now[:alert] =  "更新処理(UPDATE文,INSERT文)の恐れがあるため登録を禁止します."
      render :new
      return
    end

    respond_to do |format|
      if @query.save
        format.html { redirect_to @query, notice: 'Query was successfully created.' }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queries/1
  # PATCH/PUT /queries/1.json
  def update
    # update,insert文だと思われる場合は登録を禁止する。
    if DbConnectService::is_insert_or_update_sql(@query.sql)
      flash.now[:alert] =  "更新処理(UPDATE文,INSERT文)の恐れがあるため登録を禁止します."
      render :edit
      return
    end
    respond_to do |format|
      if @query.update(query_params)
        format.html { redirect_to @query, notice: 'Query was successfully updated.' }
        format.json { render :show, status: :ok, location: @query }
      else
        format.html { render :edit }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query.destroy
    respond_to do |format|
      format.html { redirect_to queries_url, notice: 'Query was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_csv
    query = Query.find_by_id(params[:id])
    result = DbConnectService::execute_sql(query.sql)
    has_header = true
    csv_data = OutputFileService::generate_csv_from_active_record(result, has_header)
    respond_to do |format|
      format.html
      format.csv { send_data csv_data, type: 'text/csv; charset=shift_jis', filename: query.title+".csv" }
    end
  end

  def download_tsv
    query = Query.find_by_id(params[:id])
    result = DbConnectService::execute_sql(query.sql)
    has_header = true
    csv_data = OutputFileService::generate_tsv_from_active_record(result, has_header)
    respond_to do |format|
      format.html
      format.csv { send_data csv_data, type: 'text/csv; charset=shift_jis', filename: query.title+".tsv" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_query
      @query = Query.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def query_params
      params.require(:query).permit(:title, :sql)
    end


end
