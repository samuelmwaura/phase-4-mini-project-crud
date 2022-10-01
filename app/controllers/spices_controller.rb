class SpicesController < ApplicationController
    #GET /spices
    def index
        render json: Spice.all
    end

    #POST /spices
    def create
       spice = Spice.create(spice_params)
       render json: spice, status: :created
    end

    #PATCH /spices/:id
    def update
        spice = find_a_spice
        spice.update(spice_params)
        render json: spice
    end

    #DELETE /spices/:id
    def destroy
        spice = find_a_spice
        spice.destroy
        head :no_content
    end

    private

    #finding one spice
    def find_a_spice
        spice = Spice.find(params[:id])
    end

    #sending an error
    def send_error
        render json: {error: "The spice is not found!"},status: :not_found
    end

    #Cleaning up the permittd params
    def spice_params
        params.permit(:title,:image,:description,:notes,:rating)
    end
end
