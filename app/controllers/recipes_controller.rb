class RecipesController < ApplicationController
  require "open-uri"


  def index
    @blueberry_maple_title = "foo"
    @mushroom_title = "bar"
    @thai_title = "baz"
    @twilio_client.account.sms.messages.create(
        :from => '3018304179',
        :to => '3018012521',
        :body => "#{@blueberry_maple_title}, #{@mushroom_title}, and #{@thai_title} recipes added with SimplyRecipes content."
      )
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      redirect_to "/recipes/index"
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(params[:recipe])
      redirect_to "/recipes/index"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to "/recipes/index"
  end
end
