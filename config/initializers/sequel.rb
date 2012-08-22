#ci = YAML::load_file(File.join(Rails.root,"config","database.yml"))[Rails.env]
# DB = Sequel.connect("postgres://#{ci["username"]}:#{ci["password"]}@#{ci["hostname"] || "localhost"}/#{ci["database"]}") # Uses the postgres adapter
