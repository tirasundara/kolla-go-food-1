require 'rails_helper'

describe CartsController do

  # This should return the minimal set of attributes required to create a valid
  # Cart. As you add validations to Cart, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CartsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all carts as @carts" do
      cart = Cart.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:carts)).to eq([cart])
    end
  end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create! valid_attributes
      get :show, {:id => cart.to_param}, valid_session
      expect(assigns(:cart)).to eq(cart)
    end

    it "displays its line_items" do
      cart = create(:cart)
      
      food1 = create(:food)
      line_item1 = create(:line_item, food: food1, cart: cart)

      food2 = create(:food)
      line_item2 = create(:line_item, food: food2, cart: cart)

      get :show, params: { id: cart }
      expect(assigns(:cart).line_items).to match_array([line_item1, line_item2])
    end
  end

  describe "GET new" do
    it "assigns a new cart as @cart" do
      get :new, {}, valid_session
      expect(assigns(:cart)).to be_a_new(Cart)
    end
  end

  describe "GET edit" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create! valid_attributes
      get :edit, {:id => cart.to_param}, valid_session
      expect(assigns(:cart)).to eq(cart)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cart" do
        expect {
          post :create, {:cart => valid_attributes}, valid_session
        }.to change(Cart, :count).by(1)
      end

      it "assigns a newly created cart as @cart" do
        post :create, {:cart => valid_attributes}, valid_session
        expect(assigns(:cart)).to be_a(Cart)
        expect(assigns(:cart)).to be_persisted
      end

      it "redirects to the created cart" do
        post :create, {:cart => valid_attributes}, valid_session
        expect(response).to redirect_to(Cart.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cart as @cart" do
        post :create, {:cart => invalid_attributes}, valid_session
        expect(assigns(:cart)).to be_a_new(Cart)
      end

      it "re-renders the 'new' template" do
        post :create, {:cart => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cart" do
        cart = Cart.create! valid_attributes
        put :update, {:id => cart.to_param, :cart => new_attributes}, valid_session
        cart.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested cart as @cart" do
        cart = Cart.create! valid_attributes
        put :update, {:id => cart.to_param, :cart => valid_attributes}, valid_session
        expect(assigns(:cart)).to eq(cart)
      end

      it "redirects to the cart" do
        cart = Cart.create! valid_attributes
        put :update, {:id => cart.to_param, :cart => valid_attributes}, valid_session
        expect(response).to redirect_to(cart)
      end
    end

    describe "with invalid params" do
      it "assigns the cart as @cart" do
        cart = Cart.create! valid_attributes
        put :update, {:id => cart.to_param, :cart => invalid_attributes}, valid_session
        expect(assigns(:cart)).to eq(cart)
      end

      it "re-renders the 'edit' template" do
        cart = Cart.create! valid_attributes
        put :update, {:id => cart.to_param, :cart => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cart" do
      cart = Cart.create! valid_attributes
      expect {
        delete :destroy, {:id => cart.to_param}, valid_session
      }.to change(Cart, :count).by(-1)
    end

    it "redirects to the carts list" do
      cart = Cart.create! valid_attributes
      delete :destroy, {:id => cart.to_param}, valid_session
      expect(response).to redirect_to(carts_url)
    end
  end

end
