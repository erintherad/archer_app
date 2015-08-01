class CharactersController < ApplicationController

	def index
		@characters = Character.all
		render :index
	end

	def new
		@character = Character.new
		render :new
	end

	def create
		character_params = params.require(:character).permit(:name, :description, :photo)
        @character = Character.create(character_params)
        redirect_to @character
    end

    def show
		id = params[:id]
        @character = Character.find(id)
        render :show
	end
	def edit
            character_id = params[:id]
            @character = Character.find(character_id)
	        render :edit
    end

    def update
        character_id = params[:id]
        character = Character.find(character_id)

        # get updated data
        updated_params = params.require(:character).permit(:name, :description, :photo)
        # update the character
        character.update_attributes(updated_params)

        #redirect to show
        redirect_to "/characters/#{character_id}"
    end

    def destroy
        id = params[:id]
        character = Character.find(id).destroy
        redirect_to "/"
    end

end
