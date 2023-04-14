class AdminsController < ApplicationController
    #before_action :authenticate_admin! 
    
#     def dashboard 
#     end
    def index 
        @admin = Admin.all 
        @manager = Manager.all 
        #@executive = Executive.all
        @airport=Airport.all
    end 
#     def new
#         @admin = Admin.new
#         @admin.build_manager

#     end

#     def create
#         @admin = Admin.new(admin_params)

#         if @admin.save
#             redirect_to @admin
#          else
#             render 'new'
#         end
#     end

#     private

#         def admin_params
#             params.require(:admin).permit(:admin_name, manager_attributes: [:name],user_attributes: [:user_id])
#          end
        def index 
            @admin = Admin.all 
            @manager = Manager.all 
        end

        def new 
            @admin=Admin.new 
        end
        def edit 
            @admin=Admin.find(params[:id]) 
        end 

        def show 
            a=current_user.admin 
            id=a.id
            @admin=Admin.find(params[id]) 
        end

        def create 
            admin=current_user.admin 
            @admin=admin.build_admin(admin_params) 
            if @admin.save 
                redirect_to admin_path 
            else 
                render :new 
            end 
        end 
         
        # def update 
        #     admin=current_user.admin 
        #     if admin.update_admin(admin_params)
        #         redirect_to admin_path
        #     else 
        #         render :edit 
        #     end
        def admin_params
            params.require(:admin).permit(:admin_name) 
        end

end
