# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.

class SQLseed
    def self.new_db_seed
        self.seed(SQLite3::Database.new(":memory:"))
    end

    def self.seed(db)
        db.execute("CREATE TABLE guests (year INT, occupation TEXT, appearance_date TEXT, work_group TEXT, guest_name TEXT)")
        CSV.foreach("daily_show_guests.csv", headers: true){ |row|
            db.execute "INSERT INTO guests VALUES ( ?, ?, ?, ?, ? )", row.fields
        }
        db
    end
end