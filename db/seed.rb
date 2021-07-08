# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
class DBSeed 

    @@db = nil

    def self.initialize_db
        @@db  = self.seed_db(SQLite3::Database.new(':memory:'))
    end 

    def self.seed_db(database)
        database.execute('CREATE TABLE guests (year INTEGER, occupation TEXT, date INTEGER, genre TEXT, name TEXT)')

        CSV.foreach("./daily_show_guests.csv", headers: true) do |row|
            database.execute("INSERT INTO guests VALUES ( ?, ?, ?, ?, ? )", row.fields)
        end
        database
    end

    def self.db
        !@@db ? self.initialize_db : @@db
    end

end