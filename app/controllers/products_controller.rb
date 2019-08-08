class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        redirect_to products_path
    end

    def description
        product = Product.find_by_id(params[:id])
        render plain: product.description
    end

    def inventory
        product = Product.find_by_id(params[:id])
        if product.inventory == 0 || product.inventory.nil?
            render plain: "false"
        else
            render plain: "true"
        end
    end

    private 

    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end
end
