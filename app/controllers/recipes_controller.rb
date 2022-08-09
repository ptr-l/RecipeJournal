class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :update, :destroy, :edit]

    def index 
        @recipes = Recipe.where("user_id = ?", current_user.id).paginate(page: params[:page], per_page: 10)
    end 
    def show 
    end 

    def new 
        @recipe = Recipe.new()
    end 
    def edit 
    end 
    def update 
        if @recipe.update(recipe_params)
            flash[:notice] = "Recipe Updated!"
            redirect_to @recipe 
        else 
            flash[:alert] = "There was an error processing the update, please check your inputs and try again."
            render 'edit'
        end 
    end 

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id 
        if @recipe.save 
            flash[:notice] = "Recipe created!"
            redirect_to @recipe
        else 
            flash[:alert] = "There was an issue."
            render 'new'
        end 
    end

    def destroy 
        @recipe.destroy
        redirect_to action: "index"
    end 
    private 

    def set_recipe 
        @recipe = Recipe.find(params[:id])
    end 

    def recipe_params 
        params.require(:recipe).permit(:name, :category, :review, :ingredients, :method, :when)
    end

end
