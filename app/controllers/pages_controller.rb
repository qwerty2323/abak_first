class PagesController < ApplicationController
  before_filter :set_page, only: [:show, :create, :edit, :update]

  def index
    @pages = Page.roots
  end

  def show
    @pages = @page.children
  end

  def new
    @page = Page.new(parent_id: Page.find_id_by_names(params[:names]))
  end

  def new_root
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to page_path(@page.names)
    else
      render 'new'
    end
  end

  def create_root
    @page = Page.new(params[:page])

    if @page.save
      redirect_to page_path(@page.names)
    else
      render 'new_root'
    end
  end

  def edit; end

  def update
    if @page.update_attributes(params[:page])
      redirect_to page_path(@page.names)
    else
      render 'edit'
    end
  end

private

  def set_page
    @page = Page.find_by_names(params[:names])
  end

end
