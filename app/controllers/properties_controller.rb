class PropertiesController < ApplicationController
  before_action :set_property, only: [:update, :destroy]

  def index
    if current_user.present?
      @properties = current_user.properties 
    else
      redirect_to homes_path
    end
  end

  def show
    @property = current_user.properties.where(id: params[:id]).last if current_user.present?
    if @property.nil?
      flash[:alert] = "No estas autorizado para ver la propiedad"
      redirect_to properties_path
    end
  end

  def new
    @property = Property.new
  end

  def edit
    @property = current_user.properties.where(id: params[:id]).last if current_user.present?
    if @property.nil?
      flash[:alert] = "No estas autorizado para ver la propiedad"
      redirect_to properties_path
    end
  end

  def create
    @property = current_user.properties.new(property_params)

    if @property.save
      redirect_to @property, notice: 'Propiedad Creada correctamente!'
    else
      redirect_to new_property_path,  alert: 'No se pudo crear la propiedad' 
    end
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      redirect_to edit_property_path(@property),  alert: 'No se pudo actualizar la propiedad' 
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Se ha eliminado correctamente'
  end

  def export_xlsx
    @properties = current_user.properties
    respond_to do |format|
      format.xlsx { render xlsx: 'export_xlsx', filename: "reporte_propiedades.xlsx"}
    end
  end

  def export_pdf
  end

  private

  def set_property 
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:operation, :property_type, :price, :currency_type, :commune, :address, :area, :bedrooms, :bathrooms, :user_id, images: [])
  end
end
