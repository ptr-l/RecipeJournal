class RecipesController < ApplicationController

    def index 
        @recipes = Recipe.paginate(page: params[:page], per_page: 10)
    end 
    def show 
    end 

    def new 
        @recipe = Recipe.new 
    end 

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save 
            flash[:notice] = "Recipe created!"
            redirect_to @recipe
        else 
            flash[:alert] = "There was an issue."
            render 'new'
        end 
    end
    private 

    def set_recipe 
        @recipe = Recipe.find(params[:id])
    end 

    def recipe_params 
        params.require(:recipe).permit(:name, :category, :made, :review, :ingredients, :method, :when)
    end

end
