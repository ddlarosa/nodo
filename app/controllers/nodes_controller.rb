class NodesController < ApplicationController
  before_action :set_node, only: [:show, :edit, :update, :destroy, :statistics, :statisticshour]
  before_action :get_date, only: [:statisticshour] 

  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.all
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
  end

  # GET /nodes/new
  def new
    @node = Node.new
  end

  # GET /nodes/1/edit
  def edit
  end

  # GET /nodes/1/statistics
  def statistics 
    @statistics_per_week=@node.get_statistics_per_week
  end

  def statisticshour
    t = Time.now
    t=t.change(:year   => @year)
    t=t.change(:month  => @month)
    t=t.change(:day    => @day)
    t=t.change(:hour    => 0)
    t=t.change(:minute    => 0)
    t=t.change(:second   => 0)    

    @statistics_per_hour={}
      (0..23).each do |i|
        @statistics_per_hour[t.midnight.hour+i]=NodeResult.where(node:@node.id,created_at: t.midnight+i.hour..t.midnight+(i+1).hour).distinct.count(:mac)
    end
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(node_params)

    respond_to do |format|
      if @node.save
        format.html { redirect_to @node, notice: 'Node was successfully created.' }
        format.json { render :show, status: :created, location: @node }
      else
        format.html { render :new }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nodes/1
  # PATCH/PUT /nodes/1.json
  def update
    respond_to do |format|
      if @node.update(node_params)
        format.html { redirect_to @node, notice: 'Node was successfully updated.' }
        format.json { render :show, status: :ok, location: @node }
      else
        format.html { render :edit }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node.destroy
    respond_to do |format|
      format.html { redirect_to nodes_url, notice: 'Node was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find(params[:id])
    end
  
    def get_date
      date = params[:date]
      @year=date[0..3].to_i
      @month=date[4..5].to_i
      @day=date[6..7].to_i
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_params
      params.require(:node).permit(:mac, :name, :location)
    end
end
