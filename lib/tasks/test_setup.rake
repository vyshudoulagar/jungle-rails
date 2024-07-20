namespace :test_setup do
    desc "Create a user for testing"
    task create_user: :environment do
        email = "john.doe@example.com"

        # Delete existing user if it exists
        User.find_by(email: email)&.destroy

        User.create!(first_name: "John", last_name: "Doe", email: "john.doe@example.com", password: "password")
        puts "User created successfully"
    end
end
  