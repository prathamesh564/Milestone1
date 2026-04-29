CREATE TABLE Cities (
  city_id INT PRIMARY KEY,
  name VARCHAR(100),
  state VARCHAR(100),
  zip_code VARCHAR(20)
);

CREATE TABLE Theatres (
  theatre_id INT PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(255),
  city_id INT,
  FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);

CREATE TABLE Screens (
  screen_id INT PRIMARY KEY,
  theatre_id INT,
  screen_number INT,
  total_seats INT,
  FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id)
);

CREATE TABLE Movies (
  movie_id INT PRIMARY KEY,
  title VARCHAR(200),
  duration_mins INT,
  release_date DATE,
  description TEXT
);

CREATE TABLE Genres (
  genre_id INT PRIMARY KEY,
  genre_name VARCHAR(100)
);

CREATE TABLE Movie_Genres (
  movie_id INT,
  genre_id INT,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Shows (
  show_id INT PRIMARY KEY,
  movie_id INT,
  screen_id INT,
  start_time TIME,
  end_time TIME,
  date DATE,
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
  FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

CREATE TABLE Seats (
  seat_id INT PRIMARY KEY,
  screen_id INT,
  seat_number VARCHAR(10),
  row_label VARCHAR(5),
  seat_type VARCHAR(20),
  FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

CREATE TABLE Show_Seats (
  show_seat_id INT PRIMARY KEY,
  show_id INT,
  seat_id INT,
  price DECIMAL(10,2),
  status VARCHAR(20),
  FOREIGN KEY (show_id) REFERENCES Shows(show_id),
  FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);

CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  password_hash VARCHAR(255),
  phone VARCHAR(20)
);

CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY,
  user_id INT,
  show_id INT,
  booking_time DATETIME,
  total_amount DECIMAL(10,2),
  status VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

CREATE TABLE Booking_Seats (
  booking_id INT,
  show_seat_id INT,
  PRIMARY KEY (booking_id, show_seat_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (show_seat_id) REFERENCES Show_Seats(show_seat_id)
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  booking_id INT,
  amount DECIMAL(10,2),
  payment_method VARCHAR(50),
  transaction_id VARCHAR(100),
  status VARCHAR(20),
  timestamp DATETIME,
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY,
  show_id INT,
  booking_time DATETIME,
  total_amount DECIMAL(10,2),
  status VARCHAR(20),
  FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);
CREATE TABLE Booking_Users (
  booking_id INT,
  user_id INT,
  PRIMARY KEY (booking_id, user_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Booking_Seats (
  booking_id INT,
  user_id INT,
  show_seat_id INT,
  PRIMARY KEY (booking_id, user_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (show_seat_id) REFERENCES Show_Seats(show_seat_id)
);
CREATE TABLE Booking_Seats (
  booking_id INT,
  user_id INT,
  show_seat_id INT,
  PRIMARY KEY (booking_id, user_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (show_seat_id) REFERENCES Show_Seats(show_seat_id)
);
CREATE TABLE Seat_User_Mapping (
  booking_id INT,
  show_seat_id INT,
  user_id INT,
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (show_seat_id) REFERENCES Show_Seats(show_seat_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Cities VALUES
(1, 'Bangalore', 'Karnataka', '560001'),
(2, 'Mysore', 'Karnataka', '570001'),
(3, 'Mangalore', 'Karnataka', '575001');

INSERT INTO Theatres VALUES
(1, 'PVR Orion', 'Rajajinagar', 1),
(2, 'INOX Forum', 'Forum Mall', 1),
(3, 'Cinepolis', 'Garuda Mall', 2);

INSERT INTO Screens VALUES
(1, 1, 1, 150),
(2, 1, 2, 120),
(3, 2, 1, 100);

INSERT INTO Movies VALUES
(1, 'KGF', 150, '2022-04-14', 'Action movie'),
(2, 'RRR', 180, '2022-03-25', 'Epic drama'),
(3, 'Kantara', 160, '2022-09-30', 'Thriller');

INSERT INTO Genres VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Thriller');

INSERT INTO Movie_Genres VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Shows VALUES
(1, 1, 1, '10:00:00', '13:00:00', '2026-05-01'),
(2, 2, 2, '14:00:00', '17:00:00', '2026-05-01'),
(3, 3, 3, '18:00:00', '21:00:00', '2026-05-01');

INSERT INTO Seats VALUES
(1, 1, 'A1', 'A', 'Gold'),
(2, 1, 'A2', 'A', 'Gold'),
(3, 2, 'B1', 'B', 'Silver');

INSERT INTO Show_Seats VALUES
(1, 1, 1, 250.00, 'Available'),
(2, 1, 2, 250.00, 'Booked'),
(3, 2, 3, 200.00, 'Available');

INSERT INTO Users VALUES
(1, 'Rahul', 'rahul@gmail.com', 'hash1', '9876543210'),
(2, 'Anita', 'anita@gmail.com', 'hash2', '9123456780'),
(3, 'Vikram', 'vikram@gmail.com', 'hash3', '9988776655');

INSERT INTO Bookings VALUES
(1, 1, '2026-05-01 09:00:00', 500.00, 'Confirmed'),
(2, 2, '2026-05-01 12:00:00', 200.00, 'Pending'),
(3, 3, '2026-05-01 18:00:00', 300.00, 'Confirmed');

INSERT INTO Booking_Users VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Booking_Seats VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2);

INSERT INTO Seat_User_Mapping VALUES
(1, 1, 1),
(2, 3, 2),
(3, 2, 3);
