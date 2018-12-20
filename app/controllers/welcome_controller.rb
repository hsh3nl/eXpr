class WelcomeController < ApplicationController
    def index

        if signed_in?
            @user = current_user.first_name
            @groceries = User.find(current_user.id).groceries
            @exps = []
            @expired = []
            @groceries.each do |grocery|
                if grocery.expiring_within(3)
                    @exps << grocery
                end    
            end

            @groceries.each do |grocery|
                if grocery.expired?
                    @expired << grocery
                end
            end


        elsif current_user == nil
            render 'index_guest'    
        end
    end
    
end