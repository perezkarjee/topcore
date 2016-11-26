class TopsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_top, only: [:show, :edit, :update, :destroy]

  # GET /tops
  # GET /tops.json
  def index
    @tops = Top.all
  end

  # GET /tops/1
  # GET /tops/1.json
  def show
  end

  # GET /tops/new
  def new
    @top = Top.new
  end

  # GET /tops/1/edit
  def edit
  end

  # POST /tops
  # POST /tops.json
  def create
    @top = Top.new(top_params)
    @top.user = current_user

    respond_to do |format|
      if @top.save
        format.html { redirect_to @top, notice: 'Top was successfully created.' }
        format.json { render :show, status: :created, location: @top }
      else
        format.html { render :new }
        format.json { render json: @top.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tops/1
  # PATCH/PUT /tops/1.json
  def update
    respond_to do |format|
      if @top.update(top_params)
        format.html { redirect_to @top, notice: 'Top was successfully updated.' }
        format.json { render :show, status: :ok, location: @top }
      else
        format.html { render :edit }
        format.json { render json: @top.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tops/1
  # DELETE /tops/1.json
  def destroy
    @top.destroy
    respond_to do |format|
      format.html { redirect_to tops_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @top.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top
      @top = Top.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_params
      params.require(:top).permit(:top1, :desc1, :top2, :desc2, :top3, :desc3, :top4, :desc4, :top5, :desc5, :ispublic, :iscategory, :user_id, :sources)
    end
end
