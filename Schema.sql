DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;
create database FootballTicketBookingSystem;
CREATE TABLE Users (
    user_id int PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) CHECK (role IN ('Ticket Manager', 'Football Fan')),
    phone_number VARCHAR(15)
);

CREATE TABLE Matches (
    match_id int PRIMARY KEY,
    fixture VARCHAR(100) NOT NULL,
    tournament_category VARCHAR(50) NOT NULL,
    base_ticket_price int NOT NULL,
    match_status VARCHAR(20) NOT NULL
        CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);
CREATE TABLE Bookings (
    booking_id int PRIMARY KEY,

    user_id int NOT NULL,
    match_id int NOT NULL,

    seat_number VARCHAR(10) NOT NULL,

    payment_status VARCHAR(20) NOT NULL
        CHECK (payment_status IN (
            'Pending',
            'Confirmed',
            'Cancelled',
            'Refunded'
        )),

    total_cost  int NOT NULL,

    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    CONSTRAINT fk_booking_match
        FOREIGN KEY (match_id)
        REFERENCES Matches(match_id)
);


