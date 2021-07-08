# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances(database)
  database.execute(
    'SELECT name, COUNT(name) 
    FROM guests 
    GROUP BY name 
    ORDER BY COUNT(name) DESC 
    LIMIT 1'
  )
end

def most_popular_profession_per_year(db)
  db.execute(
    'SELECT year, occupation, MAX(occupation_count)
     FROM ( 
          SELECT year, occupation, COUNT(occupation) as occupation_count 
          FROM guests 
          GROUP BY year, occupation
          ORDER BY occupation_count DESC
    )GROUP BY year
     ORDER BY year ASC'
  )
end

def profession_appeared_most_overall(db)
  db.execute('SELECT occupation, COUNT(occupation) 
              FROM guests 
              GROUP BY occupation 
              ORDER BY COUNT(occupation) DESC 
              LIMIT 1')
end

def guests_named_bill(db)
  db.execute("SELECT count(name) 
              FROM guests
              WHERE name LIKE 'Bill%'
              ")
end

def patrick_stewart_dates(db)
  db.execute("SELECT date
              FROM guests
              WHERE name = 'Patrick Stewart'")
end

def year_with_most_guests(db)
  db.execute("SELECT year, COUNT(year)
              FROM guests
              GROUP BY year 
              ORDER BY count(name) DESC
              LIMIT 1
  ")
end

def most_popular_group_per_year(db)
  db.execute(
    'SELECT year, genre, MAX(genre_count)
     FROM ( 
          SELECT year, genre, COUNT(genre) as genre_count 
          FROM guests 
          GROUP BY year, genre
          ORDER BY genre_count DESC
    )GROUP BY year
     ORDER BY year ASC'
  )
end
