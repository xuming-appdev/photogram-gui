class UsersController < ApplicationController

  def index

matching_users=User.all
@list_of_users=matching_users.order({:username=>:asc})
render({:template=> "user_templates/index.html.erb"})

  end

  def show
  url_username=params.fetch("path_username")
matching_usernames=User.where({:username=>url_username})
@the_user=matching_usernames.at(0)

#if @the_user==nil
 # redirect_to("/users",status:404)
#else
  render({:template=> "user_templates/show.html.erb"})
 # end
end

def update
  the_id = params.fetch("modify_id")
  matching_users = User.where({ :id => the_id })
  the_user = matching_users.at(0)

  input_username = params.fetch("input_username")

  the_user.username = input_username
 

  the_user.save

  #render({:template=> "user_templates/update.html.erb"})
  redirect_to("/users/"+input_username.to_s)
end

def insert
  input_username=params.fetch("input_username")
 
  
  a_user=User.new
  
  a_user.username=input_username
  

  a_user.save

 # render({:template=> "user_templates/insert.html.erb"})
 redirect_to("/users/"+a_user.username)
end


end
