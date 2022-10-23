# Create a user with email "admin@domain.com" and password "12345678"
User.where(email: "admin@domain.com")
    .first_or_create(password: "12345678", role: :moderator)
