class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :access, :all
      else
        can :access, :users, :id => user.id
        can :access, :intended_trips, :user_id => user.id
        can :read, :intended_trips
        can :create, :bus_stops
        can :read, :bus_stops
        can :edit, :bus_stops, :user_id => user.id
      end
    else
      can [:read, :create], :intended_trips
    end
    # Define abilities for the passed in (current) user. For example:
    #
    #   if user
    #     can :access, :all
    #   else
    #     can :access, :home
    #     can :create, [:users, :sessions]
    #   end
    #
    # Here if there is a user he will be able to perform any action on any controller.
    # If someone is not logged in he can only access the home, users, and sessions controllers.
    #
    # The first argument to `can` is the action the user can perform. The second argument
    # is the controller name they can perform that action on. You can pass :access and :all
    # to represent any action and controller respectively. Passing an array to either of
    # these will grant permission on each item in the array.
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
