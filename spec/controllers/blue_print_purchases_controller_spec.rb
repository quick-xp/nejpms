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

describe BluePrintPurchasesController do

  # This should return the minimal set of attributes required to create a valid
  # BluePrintPurchase. As you add validations to BluePrintPurchase, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "type_id" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BluePrintPurchasesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all blue_print_purchases as @blue_print_purchases" do
      blue_print_purchase = BluePrintPurchase.create! valid_attributes
      get :index, {}, valid_session
      assigns(:blue_print_purchases).should eq([blue_print_purchase])
    end
  end

  describe "GET show" do
    it "assigns the requested blue_print_purchase as @blue_print_purchase" do
      blue_print_purchase = BluePrintPurchase.create! valid_attributes
      get :show, {:id => blue_print_purchase.to_param}, valid_session
      assigns(:blue_print_purchase).should eq(blue_print_purchase)
    end
  end

  describe "GET new" do
    it "assigns a new blue_print_purchase as @blue_print_purchase" do
      get :new, {}, valid_session
      assigns(:blue_print_purchase).should be_a_new(BluePrintPurchase)
    end
  end

  describe "GET edit" do
    it "assigns the requested blue_print_purchase as @blue_print_purchase" do
      blue_print_purchase = BluePrintPurchase.create! valid_attributes
      get :edit, {:id => blue_print_purchase.to_param}, valid_session
      assigns(:blue_print_purchase).should eq(blue_print_purchase)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BluePrintPurchase" do
        expect {
          post :create, {:blue_print_purchase => valid_attributes}, valid_session
        }.to change(BluePrintPurchase, :count).by(1)
      end

      it "assigns a newly created blue_print_purchase as @blue_print_purchase" do
        post :create, {:blue_print_purchase => valid_attributes}, valid_session
        assigns(:blue_print_purchase).should be_a(BluePrintPurchase)
        assigns(:blue_print_purchase).should be_persisted
      end

      it "redirects to the created blue_print_purchase" do
        post :create, {:blue_print_purchase => valid_attributes}, valid_session
        response.should redirect_to(BluePrintPurchase.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved blue_print_purchase as @blue_print_purchase" do
        # Trigger the behavior that occurs when invalid params are submitted
        BluePrintPurchase.any_instance.stub(:save).and_return(false)
        post :create, {:blue_print_purchase => { "type_id" => "invalid value" }}, valid_session
        assigns(:blue_print_purchase).should be_a_new(BluePrintPurchase)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BluePrintPurchase.any_instance.stub(:save).and_return(false)
        post :create, {:blue_print_purchase => { "type_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested blue_print_purchase" do
        blue_print_purchase = BluePrintPurchase.create! valid_attributes
        # Assuming there are no other blue_print_purchases in the database, this
        # specifies that the BluePrintPurchase created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BluePrintPurchase.any_instance.should_receive(:update_attributes).with({ "type_id" => "MyString" })
        put :update, {:id => blue_print_purchase.to_param, :blue_print_purchase => { "type_id" => "MyString" }}, valid_session
      end

      it "assigns the requested blue_print_purchase as @blue_print_purchase" do
        blue_print_purchase = BluePrintPurchase.create! valid_attributes
        put :update, {:id => blue_print_purchase.to_param, :blue_print_purchase => valid_attributes}, valid_session
        assigns(:blue_print_purchase).should eq(blue_print_purchase)
      end

      it "redirects to the blue_print_purchase" do
        blue_print_purchase = BluePrintPurchase.create! valid_attributes
        put :update, {:id => blue_print_purchase.to_param, :blue_print_purchase => valid_attributes}, valid_session
        response.should redirect_to(blue_print_purchase)
      end
    end

    describe "with invalid params" do
      it "assigns the blue_print_purchase as @blue_print_purchase" do
        blue_print_purchase = BluePrintPurchase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BluePrintPurchase.any_instance.stub(:save).and_return(false)
        put :update, {:id => blue_print_purchase.to_param, :blue_print_purchase => { "type_id" => "invalid value" }}, valid_session
        assigns(:blue_print_purchase).should eq(blue_print_purchase)
      end

      it "re-renders the 'edit' template" do
        blue_print_purchase = BluePrintPurchase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BluePrintPurchase.any_instance.stub(:save).and_return(false)
        put :update, {:id => blue_print_purchase.to_param, :blue_print_purchase => { "type_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested blue_print_purchase" do
      blue_print_purchase = BluePrintPurchase.create! valid_attributes
      expect {
        delete :destroy, {:id => blue_print_purchase.to_param}, valid_session
      }.to change(BluePrintPurchase, :count).by(-1)
    end

    it "redirects to the blue_print_purchases list" do
      blue_print_purchase = BluePrintPurchase.create! valid_attributes
      delete :destroy, {:id => blue_print_purchase.to_param}, valid_session
      response.should redirect_to(blue_print_purchases_url)
    end
  end

end
