require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET #show" do
    let(:page) { create(:page, :with_two_children) }
    before(:each) { get :show, names: page.names }

    it "assigns the requested page to page" do
      expect(assigns(:page)).to eq(page)
    end

    it "render the show template" do
      expect(response).to render_template(:show)
    end

    it "assigns the children pages" do
      expect(assigns(:pages)).to eq(page.children)
    end
  end

  describe "GET #index" do
    let(:page) { create(:page, :with_two_children) }
    before(:each) { get :index }

    it "populates an array of all root pages" do
      expect(assigns(:pages)).to eq(Page.roots)
    end

    it "render the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new_root" do
    let(:page) { create(:page, :with_two_children) }
    before(:each) { get :new_root }

    it "assigns a new Page object to page" do
      expect(assigns(:page)).to be_a_new(Page)
    end

    it "renders the new_root template" do
      expect(response).to render_template(:new_root)
    end
  end

  describe "GET #new" do
    let(:page) { create(:page, :with_two_children) }
    before(:each) { get :new, names: page.names }

    it "assigns a new Page object to page" do
      expect(assigns(:page)).to be_a_new(Page)
    end

    it "has parent id" do
      expect(assigns(:page).parent_id).to eql(page.id)
    end
  end

  describe "GET #edit" do
    let(:page) { create(:page, :with_two_children) }
    before(:each) { get :edit, names: page.names }

    it "assigns the requested page to page" do
      expect(assigns(:page)).to eq(page)
    end

    it "render the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before(:each) { @page = create(:page) }

    it "saves the new page to db" do
      expect {
        post :create, names: @page.names, page: attributes_for(:page)
      }.to change(Page, :count).by(1)
    end

    it "redirects to pages#show" do
      post :create, names: @page.names, page: attributes_for(:page)
      expect(response).to redirect_to page_path(names: assigns(:page).names)
    end
  end

  describe "POST #create_root" do
    it "saves the new page to db" do
      expect {
        post :create_root, page: attributes_for(:page)
      }.to change(Page, :count).by(1)
    end

    it "redirects to pages#show" do
      post :create_root, page: attributes_for(:page)
      expect(response).to redirect_to page_path(names: assigns(:page).names)
    end
  end

  describe "PUT #update" do
    let(:page) { create(:page) }

    context "with valid attributes" do
      it "located the requested page" do
        put :update, names: page.names, page: attributes_for(:page)
        expect(assigns(:page)).to eq(page)
      end

      it "changes @page attributes" do
        put :update, names: page.names, page: attributes_for(:page, title: "Test page")
        page.reload
        expect(page.title).to eql("Test page")
      end

      it "redirects to page" do
        put :update, names: page.names, page: attributes_for(:page, title: "Test page")
        expect(response).to redirect_to page_path(names: assigns(:page).names)
      end
    end

    context "with invalid attributes" do
      it "changes @page attributes" do
        put :update, names: page.names, page: attributes_for(:page, title: "")
        page.reload
        expect(page.title).not_to eql("Test page")
      end

      it "render edit template" do
        put :update, names: page.names, page: attributes_for(:page, title: "")
        expect(response).to render_template(:edit)
      end
    end
  end
end
