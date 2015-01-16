class SupportsController < ApplicationController


  before_action :find_support, only: [:show, :edit, :update, :destroy, :toggle]


  def new
    @ticket = Support.new

  end

  def create
    @ticket = Support.new support_params
    if @ticket.save 
      # flash[:notice] = "Question created!"
      #redirect_to question_path(@question)
      redirect_to @ticket, notice: "ticket Created"
    else
      render :new
    end  
  end

  def show
    

  end

  def index
      @ticket = Support.order(:status)
  end

  def edit
 
  end


  def update

    if @ticket.update support_params
      redirect_to @ticket, notice: "Ticket Updated"
    else
      render :edit
    end
  end


  def destroy
    
    @ticket.destroy
    redirect_to supports_path, notice: "Ticket Deleted"
  end


  def toggle
    @ticket.toggle!(:status)
    redirect_to supports_path, notice: "Ticket Completed"
  end

private

  def find_support
    @ticket = Support.find params[:id]
  end

  def support_params
    support_params = params.require(:support).permit(:name, :email, :department, :message)
  end

end

