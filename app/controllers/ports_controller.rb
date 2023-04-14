class PortsController < ApplicationController
    def index 
        #@airport = Airport.find(params[:airport_id])
        @ports=Port.all
    end 

    def show 
        #@airport = Airport.find(params[:airport_id])
       @port= Port.find(params[:id])
    #    id=cookies[:airport_info]
    #    airport=Airport.find(id)      
    #    @port = Port.find(params[:airport])
    end 

    def new 
        #@airport = Airport.find(params[:airport_id]) 
        @port=Port.new
    end 


    def edit 
       # @airport = Airport.find(params[:airport_id])
       id=cookies[:airport_info]
       airport=Airport.find(id)      
       @port = Port.find(params[:id])
    end 

    def create 
        id=cookies[:airport_info]
        airport=Airport.find(id)
        @port = airport.ports.create(port_params) 
        if @port.save 
            cookies[:port_info]=@port.id

            redirect_to port_path(@port) 
        else 
            render 'new'
        end
    end


    def update 
        id=cookies[:airport_info]
        airport=Airport.find(id)
        #@airport = Airport.find(params[:airport_id]) 
        @port=Port.find(params[:id])
        #if airport.ports.update(port_params)
        if @port.update(port_params)
            redirect_to port_path(@port)
        else 
            render 'edit'
        end 
    end 


    def destroy 
        #@airport = Airport.find(params[:airport_id])
        @port=Port.find(params[:id])
        if @port.destroy 
            redirect_to ports_path(@airport) 

        end
    end 

    private 
        def port_params 
            params.require(:port).permit(:airport_id,:port_number)
        end
        def set_port 
            @port=Port.find(params[:id])
        end





end
