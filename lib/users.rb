class Users

    def initialize(id, username, email_address)
        @id = id
        @username = username
        @email_address = email_address
    end

    # Replace the attributes by your own columns
    attr_accessor  :id, :username, :email_address
    # where id is Primary Key
    # rest are the columnss

end


