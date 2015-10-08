class NodeResultsController < ApplicationController
  before_action :set_node_result, only: [:show, :edit, :update, :destroy]

  # GET /node_results
  # GET /node_results.json
  def index
    @node_results = NodeResult.all
  end

  # GET /node_results/1
  # GET /node_results/1.json
  def show
  end

  # GET /node_results/new
  def new
    @node_result = NodeResult.new
  end

  # GET /node_results/1/edit
  def edit
  end

  # POST /node_results
  # POST /node_results.json
  def create
    @node_result = NodeResult.new(node_result_params)

    respond_to do |format|
      if @node_result.save
        format.html { redirect_to @node_result, notice: 'Node result was successfully created.' }
        format.json { render :show, status: :created, location: @node_result }
      else
        format.html { render :new }
        format.json { render json: @node_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /node_results/1
  # PATCH/PUT /node_results/1.json
  def update
    respond_to do |format|
      if @node_result.update(node_result_params)
        format.html { redirect_to @node_result, notice: 'Node result was successfully updated.' }
        format.json { render :show, status: :ok, location: @node_result }
      else
        format.html { render :edit }
        format.json { render json: @node_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /node_results/1
  # DELETE /node_results/1.json
  def destroy
    @node_result.destroy
    respond_to do |format|
      format.html { redirect_to node_results_url, notice: 'Node result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node_result
      @node_result = NodeResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_result_params
      params.require(:node_result).permit(:node_id, :mac, :singal_db, :firsttime, :lasttime)
    end
end
