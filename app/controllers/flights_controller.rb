class FlightsController < ApplicationController
    #before_action :set_flight, only: [:show, :edit, :update, :destroy]
   # before_action :port_params
    
    def index 
        #@airport = Airport.find(params[:airport_id]) 
        @flight = Flight.all 
    end 

    def show 
        @flight= Flight.find(params[:id])
    end 

    def edit 
        @flight=Flight.find(params[:id])
    end 

    def new 
        #@airport = Airport.find(params[:id])
        @flight=Flight.new
    end


    def create 
        #@port = Port.find(params[:port_id])
        # id=cookies[:airport_info]
        # airport=Airport.find(id)
        # port=Port.find(id)
       
        airport=Airport.first
        @flight = airport.flights.create(flight_params) 
        #@flight = Flights.create(flight_params) 
        
        if @flight.save 
            redirect_to flight_path(@flight) 
        else 
            render 'new' 
        end  
    end 


    def update 
        #@port = Port.find(params[:port_id])
        @flight = Flight.find(params[:id]) 
        if @flight.update(flight_params)
            redirect_to flight_path(@flight)
        else 
            render 'edit'
        end 
    end
     
    def destroy 
        @flight= Flight.find(params[:id])
        if @flight.destroy 
            redirect_to airports_path(@airport)
        end
    end
    # def land_flight
    #     @port=Port.find(params[:id])
    #     if @port.avilable? 
    #         @port.land_flight(@flight)
    #         redirect_to @flight, notice:"Flight can land successfully"
    #     else
    #         redirect_to @flight, alert: 'Port is not avilable'
    #     end
    

    private 
        def flight_params 
            params.require(:flight).permit(:flight_name, :flight_number, :arrival_time, :departure_time)
            #params.permit(article:[ :title, :text], tags: [:name])
        end 

        def set_flight 
            @flight=Flight.find(params[:id])
        end
        # def port_params
        #     params.require(:port).permit(:port_number,:port_id)
        # end
end
