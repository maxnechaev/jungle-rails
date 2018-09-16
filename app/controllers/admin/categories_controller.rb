class Admin::CategoriesController < ApplicationController

  def index_category
    @categories = Category.order(id: :asc).all
  end

  def new_category
    @category = Category.new
  end

  def create_category
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
