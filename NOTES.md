# Sinatra Travel CRUD App Project

    This is a travel journal app. A user can keep track of their destinations and write notes on it.

# Users will:
    - Log in, sign up, and log out
# User can:
    - create a travel journal entry
    - be able to see all destinations and journals
    - edit their destination and journals
    - delete thier destinations journals

# WireFraming

## Models
    - User
        - Attributes
            - name
            - email
            - password_digest (bcrypt)
        - has_many :destinations
    - Destinations
        - Attributes
            - destination
            - journal
            - user_id
        - belongs_to :user

# MVP
    - User can signup, log in, log out, create destinations, edit their destinations, and view all their entries