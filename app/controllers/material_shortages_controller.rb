# coding: utf-8

class MaterialShortagesController < ApplicationController
  before_filter :setup_producible_items, only: [:index, :confirm]

  def index
    @form = Form::MaterialShortagesForm.new
  end

  def show
  end

  def confirm
    @form = Form::MaterialShortagesForm.new(material_shortages_params)
    if @form.valid?
      redirect_to material_shortage_path(id: @form.item_id, count: @form.count)
    else
      render :index
    end
  end

  private

  def material_shortages_params
    params.require(:form_material_shortages_form).permit(:item_id, :count)
  end

  def setup_producible_items
    @producible_items = InvBlueprintTypes.producible_blueprints.items
  end

end
