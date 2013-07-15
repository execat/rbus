require 'dm-types'

migration 1, :create_extensions do

  up do
    execute "CREATE EXTENSION IF NOT EXISTS cube"
    execute "CREATE EXTENSION IF NOT EXISTS earthdistance"
  end

end
