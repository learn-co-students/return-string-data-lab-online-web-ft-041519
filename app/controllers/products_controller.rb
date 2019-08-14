class ProductsController < ApplicationController

    def index
        @products = Product.all
    end 

    def create 
        @product = Product.create(product_params)
        redirect_to products_path
    end 

    def inventory 
        @product = Product.find_by(product_id)
        render plain: 
            if @product.inventory > 0
                true 
            else
                false 
            end 
    end

    def description 
        @product = Product.find_by(product_id)
        render plain: @product.description
    end

    def body
        #binding.pry
        @product = Product.find_by(product_id)
        render plain: @product.description
        #render plain: if @product.inventory == 0
        #    "Sold Out"
        #else 
        #    "Available"
        #end 
    end

    private 

    def product_params
        params.require(:product).permit!
    end

    def product_id
        params.permit(:id)
    end

end
