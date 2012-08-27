class StepsController < ApplicationController

  respond_to :html

  def index
    @steps = Step.all
    respond_with @steps
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(params[:step])
    if @step.save
      flash[:message] = "Step saved successfully"
      respond_with @step
    else
      respond_with @step
    end
  end

  def edit
    @step = Step.find(params[:id])
    respond_with @step
  end

  def update
    @step = Step.find(params[:id])
    if @step.update_attributes(params[:step])
      flash[:message] = "Step updated successfully"
    end
    respond_with @step
  end

  def destroy
    Step.find(params[:id]).delete
    redirect_to :action => 'index'
  end

  def show
    @step = Step.find(params[:id])
    respond_with @step
  end

end
