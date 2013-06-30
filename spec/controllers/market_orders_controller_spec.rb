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

describe MarketOrdersController do

  # This should return the minimal set of attributes required to create a valid
  # MarketOrder. As you add validations to MarketOrder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "order_id" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MarketOrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all market_orders as @market_orders" do
      market_order = MarketOrder.create! valid_attributes
      get :index, {}, valid_session
      assigns(:market_orders).should eq([market_order])
    end
  end

  describe "GET show" do
    it "assigns the requested market_order as @market_order" do
      market_order = MarketOrder.create! valid_attributes
      get :show, {:id => market_order.to_param}, valid_session
      assigns(:market_order).should eq(market_order)
    end
  end

  describe "GET new" do
    it "assigns a new market_order as @market_order" do
      get :new, {}, valid_session
      assigns(:market_order).should be_a_new(MarketOrder)
    end
  end

  describe "GET edit" do
    it "assigns the requested market_order as @market_order" do
      market_order = MarketOrder.create! valid_attributes
      get :edit, {:id => market_order.to_param}, valid_session
      assigns(:market_order).should eq(market_order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MarketOrder" do
        expect {
          post :create, {:market_order => valid_attributes}, valid_session
        }.to change(MarketOrder, :count).by(1)
      end

      it "assigns a newly created market_order as @market_order" do
        post :create, {:market_order => valid_attributes}, valid_session
        assigns(:market_order).should be_a(MarketOrder)
        assigns(:market_order).should be_persisted
      end

      it "redirects to the created market_order" do
        post :create, {:market_order => valid_attributes}, valid_session
        response.should redirect_to(MarketOrder.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved market_order as @market_order" do
        # Trigger the behavior that occurs when invalid params are submitted
        MarketOrder.any_instance.stub(:save).and_return(false)
        post :create, {:market_order => { "order_id" => "invalid value" }}, valid_session
        assigns(:market_order).should be_a_new(MarketOrder)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MarketOrder.any_instance.stub(:save).and_return(false)
        post :create, {:market_order => { "order_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested market_order" do
        market_order = MarketOrder.create! valid_attributes
        # Assuming there are no other market_orders in the database, this
        # specifies that the MarketOrder created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MarketOrder.any_instance.should_receive(:update_attributes).with({ "order_id" => "" })
        put :update, {:id => market_order.to_param, :market_order => { "order_id" => "" }}, valid_session
      end

      it "assigns the requested market_order as @market_order" do
        market_order = MarketOrder.create! valid_attributes
        put :update, {:id => market_order.to_param, :market_order => valid_attributes}, valid_session
        assigns(:market_order).should eq(market_order)
      end

      it "redirects to the market_order" do
        market_order = MarketOrder.create! valid_attributes
        put :update, {:id => market_order.to_param, :market_order => valid_attributes}, valid_session
        response.should redirect_to(market_order)
      end
    end

    describe "with invalid params" do
      it "assigns the market_order as @market_order" do
        market_order = MarketOrder.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MarketOrder.any_instance.stub(:save).and_return(false)
        put :update, {:id => market_order.to_param, :market_order => { "order_id" => "invalid value" }}, valid_session
        assigns(:market_order).should eq(market_order)
      end

      it "re-renders the 'edit' template" do
        market_order = MarketOrder.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MarketOrder.any_instance.stub(:save).and_return(false)
        put :update, {:id => market_order.to_param, :market_order => { "order_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested market_order" do
      market_order = MarketOrder.create! valid_attributes
      expect {
        delete :destroy, {:id => market_order.to_param}, valid_session
      }.to change(MarketOrder, :count).by(-1)
    end

    it "redirects to the market_orders list" do
      market_order = MarketOrder.create! valid_attributes
      delete :destroy, {:id => market_order.to_param}, valid_session
      response.should redirect_to(market_orders_url)
    end
  end

end