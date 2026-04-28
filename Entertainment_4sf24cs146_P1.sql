CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE Movies (
  movie_id INT PRIMARY KEY,
  movie_name VARCHAR(100)
);

CREATE TABLE Theatres (
  theatre_id INT PRIMARY KEY,
  theatre_name VARCHAR(100),
  theatre_location VARCHAR(100)
);

CREATE TABLE Screens (
  screen_id INT PRIMARY KEY,
  theatre_id INT,
  screen_name VARCHAR(50),
  FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id)
);

CREATE TABLE Shows (
  show_id INT PRIMARY KEY,
  movie_id INT,
  screen_id INT,
  show_time TIME,
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
  FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY,
  user_id INT,
  show_id INT,
  total_price DECIMAL(10,2),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  booking_id INT,
  payment_status VARCHAR(50),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Booking_Seats (
  booking_id INT,
  seat_number VARCHAR(10),
  PRIMARY KEY (booking_id, seat_number),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

INSERT INTO Users VALUES
(1, 'Amit Sharma', 'amit@gmail.com'),
(2, 'Priya Verma', 'priya@gmail.com'),
(3, 'Rahul Kumar', 'rahul@gmail.com'),
(4, 'Sneha Iyer', 'sneha@gmail.com'),
(5, 'Vikram Rao', 'vikram@gmail.com');

-- 2. Movies
INSERT INTO Movies VALUES
(1, 'Inception'),
(2, 'Avengers'),
(3, 'Interstellar'),
(4, 'Jawan'),
(5, 'KGF Chapter 2');

-- 3. Theatres
INSERT INTO Theatres VALUES
(1, 'PVR Cinemas', 'Bangalore'),
(2, 'INOX', 'Mumbai'),
(3, 'Cinepolis', 'Delhi'),
(4, 'IMAX', 'Chennai'),
(5, 'Carnival Cinemas', 'Hyderabad');

INSERT INTO Screens VALUES
(1, 1, 'Screen A'),
(2, 1, 'Screen B'),
(3, 2, 'Screen 1'),
(4, 3, 'Screen 2'),
(5, 4, 'Screen 3');

INSERT INTO Shows VALUES
(1, 1, 1, '10:00:00'),
(2, 2, 2, '13:00:00'),
(3, 3, 3, '16:00:00'),
(4, 4, 4, '19:00:00'),
(5, 5, 5, '21:00:00');

INSERT INTO Bookings VALUES
(1, 1, 1, 300),
(2, 2, 2, 450),
(3, 3, 3, 500),
(4, 4, 4, 350),
(5, 5, 5, 600);

INSERT INTO Payments VALUES
(1, 1, 'Paid'),
(2, 2, 'Paid'),
(3, 3, 'Pending'),
(4, 4, 'Failed'),
(5, 5, 'Paid');

INSERT INTO Booking_Seats VALUES
(1, 'A1'),
(1, 'A2'),
(2, 'B1'),
(3, 'C1'),
(4, 'D1');