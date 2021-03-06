require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe InventoryClearancesController do

  # This should return the minimal set of attributes required to create a valid
  # InventoryClearance. As you add validations to InventoryClearance, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "type_id" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InventoryClearancesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all inventory_clearances as @inventory_clearances" do
      inventory_clearance = InventoryClearance.create! valid_attributes
      get :index, {}, valid_session
      assigns(:inventory_clearances).should eq([inventory_clearance])
    end
  end

  describe "GET show" do
    it "assigns the requested inventory_clearance as @inventory_clearance" do
      inventory_clearance = InventoryClearance.create! valid_attributes
      get :show, {:id => inventory_clearance.to_param}, valid_session
      assigns(:inventory_clearance).should eq(inventory_clearance)
    end
  end

  describe "GET new" do
    it "assigns a new inventory_clearance as @inventory_clearance" do
      get :new, {}, valid_session
      assigns(:inventory_clearance).should be_a_new(InventoryClearance)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventory_clearance as @inventory_clearance" do
      inventory_clearance = InventoryClearance.create! valid_attributes
      get :edit, {:id => inventory_clearance.to_param}, valid_session
      assigns(:inventory_clearance).should eq(inventory_clearance)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new InventoryClearance" do
        expect {
          post :create, {:inventory_clearance => valid_attributes}, valid_session
        }.to change(InventoryClearance, :count).by(1)
      end

      it "assigns a newly created inventory_clearance as @inventory_clearance" do
        post :create, {:inventory_clearance => valid_attributes}, valid_session
        assigns(:inventory_clearance).should be_a(InventoryClearance)
        assigns(:inventory_clearance).should be_persisted
      end

      it "redirects to the created inventory_clearance" do
        post :create, {:inventory_clearance => valid_attributes}, valid_session
        response.should redirect_to(InventoryClearance.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inventory_clearance as @inventory_clearance" do
        # Trigger the behavior that occurs when invalid params are submitted
        InventoryClearance.any_instance.stub(:save).and_return(false)
        post :create, {:inventory_clearance => { "type_id" => "invalid value" }}, valid_session
        assigns(:inventory_clearance).should be_a_new(InventoryClearance)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        InventoryClearance.any_instance.stub(:save).and_return(false)
        post :create, {:inventory_clearance => { "type_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested inventory_clearance" do
        inventory_clearance = InventoryClearance.create! valid_attributes
        # Assuming there are no other inventory_clearances in the database, this
        # specifies that the InventoryClearance created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        InventoryClearance.any_instance.should_receive(:update_attributes).with({ "type_id" => "" })
        put :update, {:id => inventory_clearance.to_param, :inventory_clearance => { "type_id" => "" }}, valid_session
      end

      it "assigns the requested inventory_clearance as @inventory_clearance" do
        inventory_clearance = InventoryClearance.create! valid_attributes
        put :update, {:id => inventory_clearance.to_param, :inventory_clearance => valid_attributes}, valid_session
        assigns(:inventory_clearance).should eq(inventory_clearance)
      end

      it "redirects to the inventory_clearance" do
        inventory_clearance = InventoryClearance.create! valid_attributes
        put :update, {:id => inventory_clearance.to_param, :inventory_clearance => valid_attributes}, valid_session
        response.should redirect_to(inventory_clearance)
      end
    end

    describe "with invalid params" do
      it "assigns the inventory_clearance as @inventory_clearance" do
        inventory_clearance = InventoryClearance.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        InventoryClearance.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventory_clearance.to_param, :inventory_clearance => { "type_id" => "invalid value" }}, valid_session
        assigns(:inventory_clearance).should eq(inventory_clearance)
      end

      it "re-renders the 'edit' template" do
        inventory_clearance = InventoryClearance.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        InventoryClearance.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventory_clearance.to_param, :inventory_clearance => { "type_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inventory_clearance" do
      inventory_clearance = InventoryClearance.create! valid_attributes
      expect {
        delete :destroy, {:id => inventory_clearance.to_param}, valid_session
      }.to change(InventoryClearance, :count).by(-1)
    end

    it "redirects to the inventory_clearances list" do
      inventory_clearance = InventoryClearance.create! valid_attributes
      delete :destroy, {:id => inventory_clearance.to_param}, valid_session
      response.should redirect_to(inventory_clearances_url)
    end
  end

end
