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

describe DeliveriesController do

  # This should return the minimal set of attributes required to create a valid
  # Delivery. As you add validations to Delivery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "type_id" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DeliveriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all deliveries as @deliveries" do
      delivery = Delivery.create! valid_attributes
      get :index, {}, valid_session
      assigns(:deliveries).should eq([delivery])
    end
  end

  describe "GET show" do
    it "assigns the requested delivery as @delivery" do
      delivery = Delivery.create! valid_attributes
      get :show, {:id => delivery.to_param}, valid_session
      assigns(:delivery).should eq(delivery)
    end
  end

  describe "GET new" do
    it "assigns a new delivery as @delivery" do
      get :new, {}, valid_session
      assigns(:delivery).should be_a_new(Delivery)
    end
  end

  describe "GET edit" do
    it "assigns the requested delivery as @delivery" do
      delivery = Delivery.create! valid_attributes
      get :edit, {:id => delivery.to_param}, valid_session
      assigns(:delivery).should eq(delivery)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Delivery" do
        expect {
          post :create, {:delivery => valid_attributes}, valid_session
        }.to change(Delivery, :count).by(1)
      end

      it "assigns a newly created delivery as @delivery" do
        post :create, {:delivery => valid_attributes}, valid_session
        assigns(:delivery).should be_a(Delivery)
        assigns(:delivery).should be_persisted
      end

      it "redirects to the created delivery" do
        post :create, {:delivery => valid_attributes}, valid_session
        response.should redirect_to(Delivery.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved delivery as @delivery" do
        # Trigger the behavior that occurs when invalid params are submitted
        Delivery.any_instance.stub(:save).and_return(false)
        post :create, {:delivery => { "type_id" => "invalid value" }}, valid_session
        assigns(:delivery).should be_a_new(Delivery)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Delivery.any_instance.stub(:save).and_return(false)
        post :create, {:delivery => { "type_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested delivery" do
        delivery = Delivery.create! valid_attributes
        # Assuming there are no other deliveries in the database, this
        # specifies that the Delivery created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Delivery.any_instance.should_receive(:update_attributes).with({ "type_id" => "" })
        put :update, {:id => delivery.to_param, :delivery => { "type_id" => "" }}, valid_session
      end

      it "assigns the requested delivery as @delivery" do
        delivery = Delivery.create! valid_attributes
        put :update, {:id => delivery.to_param, :delivery => valid_attributes}, valid_session
        assigns(:delivery).should eq(delivery)
      end

      it "redirects to the delivery" do
        delivery = Delivery.create! valid_attributes
        put :update, {:id => delivery.to_param, :delivery => valid_attributes}, valid_session
        response.should redirect_to(delivery)
      end
    end

    describe "with invalid params" do
      it "assigns the delivery as @delivery" do
        delivery = Delivery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Delivery.any_instance.stub(:save).and_return(false)
        put :update, {:id => delivery.to_param, :delivery => { "type_id" => "invalid value" }}, valid_session
        assigns(:delivery).should eq(delivery)
      end

      it "re-renders the 'edit' template" do
        delivery = Delivery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Delivery.any_instance.stub(:save).and_return(false)
        put :update, {:id => delivery.to_param, :delivery => { "type_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested delivery" do
      delivery = Delivery.create! valid_attributes
      expect {
        delete :destroy, {:id => delivery.to_param}, valid_session
      }.to change(Delivery, :count).by(-1)
    end

    it "redirects to the deliveries list" do
      delivery = Delivery.create! valid_attributes
      delete :destroy, {:id => delivery.to_param}, valid_session
      response.should redirect_to(deliveries_url)
    end
  end

end
