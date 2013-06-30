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

describe ManagementAccountsController do

  # This should return the minimal set of attributes required to create a valid
  # ManagementAccount. As you add validations to ManagementAccount, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "purchase_amount" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ManagementAccountsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all management_accounts as @management_accounts" do
      management_account = ManagementAccount.create! valid_attributes
      get :index, {}, valid_session
      assigns(:management_accounts).should eq([management_account])
    end
  end

  describe "GET show" do
    it "assigns the requested management_account as @management_account" do
      management_account = ManagementAccount.create! valid_attributes
      get :show, {:id => management_account.to_param}, valid_session
      assigns(:management_account).should eq(management_account)
    end
  end

  describe "GET new" do
    it "assigns a new management_account as @management_account" do
      get :new, {}, valid_session
      assigns(:management_account).should be_a_new(ManagementAccount)
    end
  end

  describe "GET edit" do
    it "assigns the requested management_account as @management_account" do
      management_account = ManagementAccount.create! valid_attributes
      get :edit, {:id => management_account.to_param}, valid_session
      assigns(:management_account).should eq(management_account)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ManagementAccount" do
        expect {
          post :create, {:management_account => valid_attributes}, valid_session
        }.to change(ManagementAccount, :count).by(1)
      end

      it "assigns a newly created management_account as @management_account" do
        post :create, {:management_account => valid_attributes}, valid_session
        assigns(:management_account).should be_a(ManagementAccount)
        assigns(:management_account).should be_persisted
      end

      it "redirects to the created management_account" do
        post :create, {:management_account => valid_attributes}, valid_session
        response.should redirect_to(ManagementAccount.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved management_account as @management_account" do
        # Trigger the behavior that occurs when invalid params are submitted
        ManagementAccount.any_instance.stub(:save).and_return(false)
        post :create, {:management_account => { "purchase_amount" => "invalid value" }}, valid_session
        assigns(:management_account).should be_a_new(ManagementAccount)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ManagementAccount.any_instance.stub(:save).and_return(false)
        post :create, {:management_account => { "purchase_amount" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested management_account" do
        management_account = ManagementAccount.create! valid_attributes
        # Assuming there are no other management_accounts in the database, this
        # specifies that the ManagementAccount created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ManagementAccount.any_instance.should_receive(:update_attributes).with({ "purchase_amount" => "" })
        put :update, {:id => management_account.to_param, :management_account => { "purchase_amount" => "" }}, valid_session
      end

      it "assigns the requested management_account as @management_account" do
        management_account = ManagementAccount.create! valid_attributes
        put :update, {:id => management_account.to_param, :management_account => valid_attributes}, valid_session
        assigns(:management_account).should eq(management_account)
      end

      it "redirects to the management_account" do
        management_account = ManagementAccount.create! valid_attributes
        put :update, {:id => management_account.to_param, :management_account => valid_attributes}, valid_session
        response.should redirect_to(management_account)
      end
    end

    describe "with invalid params" do
      it "assigns the management_account as @management_account" do
        management_account = ManagementAccount.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ManagementAccount.any_instance.stub(:save).and_return(false)
        put :update, {:id => management_account.to_param, :management_account => { "purchase_amount" => "invalid value" }}, valid_session
        assigns(:management_account).should eq(management_account)
      end

      it "re-renders the 'edit' template" do
        management_account = ManagementAccount.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ManagementAccount.any_instance.stub(:save).and_return(false)
        put :update, {:id => management_account.to_param, :management_account => { "purchase_amount" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested management_account" do
      management_account = ManagementAccount.create! valid_attributes
      expect {
        delete :destroy, {:id => management_account.to_param}, valid_session
      }.to change(ManagementAccount, :count).by(-1)
    end

    it "redirects to the management_accounts list" do
      management_account = ManagementAccount.create! valid_attributes
      delete :destroy, {:id => management_account.to_param}, valid_session
      response.should redirect_to(management_accounts_url)
    end
  end

end
