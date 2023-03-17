class PropertiesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.user?
      @properties = Property.where(approved: true)
    elsif current_user.admin?
      @properties = Property.all
    elsif current_user.superadmin?
      @properties = Property.all  
    end
  end

  def new
    if current_user.admin?
      @property = Property.new
    else
      redirect_to root_path , alert:"Only Admin Can Create Property"
    end
  end
    
  def create
    if current_user.admin?
        @property = current_user.properties.new(property_params)
        if @property.save
          redirect_to root_path
        else
          render :new
        end
    end
  end

  def edit
      @property = Property.find(params[:id])
  end

  def update
    # debugger
    @property = Property.find(params[:id])
    @property.update!(property_params)
    redirect_to root_path
  end

  def show
     @property = Property.find(params[:id])
     @property.approved = true
     @property.save  
  end
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to root_path
  end

  private

  def property_params
    params.require(:property).permit(:name,:location,:price,:approved,:image)
  end
  
end
