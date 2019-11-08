# Write methods that return SQL queries for each part of the challeng here
#year INT, occupation TEXT, appearance_date TEXT, work_group TEXT, guest_name TEXT

def guest_with_most_appearances(db)
  db.execute(
    "SELECT guest_name, COUNT(appearance_date) 
    FROM guests 
    GROUP BY guest_name 
    ORDER BY COUNT(appearance_date) DESC 
    LIMIT 1")
end

def most_popular_guest_profession_by_year(db)
  db.execute(
  "SELECT year, occupation, MAX(my_count) 
  FROM 
    (SELECT guest_name, occupation, year, COUNT(occupation) AS my_count 
    FROM 
      (SELECT DISTINCT guest_name, occupation, year, occupation
      FROM guests)
    GROUP BY year, occupation 
    ORDER BY year) 
  GROUP BY year 
  ORDER BY year")
end

def most_popular_profession(db)
  db.execute(
    "SELECT occupation, COUNT(*) 
    FROM guests 
    GROUP BY occupation 
    ORDER BY COUNT(*) DESC 
    LIMIT 1"
    )
end

def first_name_bill(db)
  db.execute(
    "SELECT COUNT(guest_name)
    FROM guests
    WHERE guest_name LIKE 'Bill%'
    LIMIT 1"
  )
end

def dates_patrick_stewart_on_show(db)
  db.execute(
    "SELECT year, appearance_date 
    FROM guests
    WHERE guest_name = 'Patrick Stewart'"
  )
end

def what_year_had_most_guests(db)
  db.execute(
    "SELECT year, COUNT(guest_name)
    FROM guests
    GROUP BY year
    ORDER BY COUNT(guest_name) DESC
    LIMIT 1"
  )
end

def most_popular_work_group_by_year(db)
  db.execute(
    "SELECT year, work_group, MAX(my_count) 
    FROM 
      (SELECT guest_name, work_group, year, COUNT(work_group) AS my_count 
      FROM 
        (SELECT DISTINCT guest_name, work_group, year, work_group
        FROM guests)
      GROUP BY year, work_group 
      ORDER BY year) 
    GROUP BY year 
    ORDER BY year"
  )
end




