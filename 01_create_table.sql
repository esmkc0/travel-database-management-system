
-- =====================================================
-- TRAVEL DATABASE MANAGEMENT SYSTEM
-- DATABASE TABLE CREATION
-- Oracle SQL
-- =====================================================


-- =====================================================
-- 1. APP USER
-- =====================================================

CREATE TABLE app_user (
    user_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150)
);


-- =====================================================
-- 2. COUNTRY
-- =====================================================

CREATE TABLE country (
    country_id NUMBER PRIMARY KEY,
    country_name VARCHAR2(100) NOT NULL
);


-- =====================================================
-- 3. CITY
-- =====================================================

CREATE TABLE city (
    city_id NUMBER PRIMARY KEY,
    country_id NUMBER NOT NULL,
    city_name VARCHAR2(100) NOT NULL,

    CONSTRAINT fk_city_country
        FOREIGN KEY (country_id)
        REFERENCES country(country_id)
);


-- =====================================================
-- 4. TRIP
-- =====================================================

CREATE TABLE trip (
    trip_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    trip_name VARCHAR2(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    description VARCHAR2(200),

    CONSTRAINT fk_trip_user
        FOREIGN KEY (user_id)
        REFERENCES app_user(user_id),

    CONSTRAINT chk_trip_dates
        CHECK (
            start_date IS NULL
            OR end_date IS NULL
            OR end_date >= start_date
        )
);


-- =====================================================
-- 5. TRIP CITY
-- =====================================================

CREATE TABLE trip_city (
    trip_id NUMBER NOT NULL,
    city_id NUMBER NOT NULL,

    CONSTRAINT pk_trip_city
        PRIMARY KEY (trip_id, city_id),

    CONSTRAINT fk_trip_city_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id),

    CONSTRAINT fk_trip_city_city
        FOREIGN KEY (city_id)
        REFERENCES city(city_id)
);


-- =====================================================
-- 6. PLACE
-- =====================================================

CREATE TABLE place (
    place_id NUMBER PRIMARY KEY,
    city_id NUMBER NOT NULL,
    place_name VARCHAR2(150) NOT NULL,
    place_type VARCHAR2(50),

    CONSTRAINT fk_place_city
        FOREIGN KEY (city_id)
        REFERENCES city(city_id)
);


-- =====================================================
-- 7. TRIP PLACE
-- =====================================================

CREATE TABLE trip_place (
    trip_place_id NUMBER PRIMARY KEY,
    trip_id NUMBER NOT NULL,
    place_id NUMBER NOT NULL,
    visit_date DATE,
    rating NUMBER,
    comment_text VARCHAR2(500),

    CONSTRAINT fk_trip_place_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id),

    CONSTRAINT fk_trip_place_place
        FOREIGN KEY (place_id)
        REFERENCES place(place_id),

    CONSTRAINT chk_trip_place_rating
        CHECK (rating BETWEEN 1 AND 5)
);


-- =====================================================
-- 8. DAILY NOTE
-- =====================================================

CREATE TABLE daily_note (
    note_id NUMBER PRIMARY KEY,
    trip_id NUMBER NOT NULL,
    note_date DATE,
    note_text VARCHAR2(100),

    CONSTRAINT fk_daily_note_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id)
);


-- =====================================================
-- 9. PHOTO
-- =====================================================

CREATE TABLE photo (
    photo_id NUMBER PRIMARY KEY,
    trip_id NUMBER NOT NULL,
    trip_place_id NUMBER,
    photo_url VARCHAR2(300),
    upload_date DATE,
    description VARCHAR2(500),

    CONSTRAINT fk_photo_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id),

    CONSTRAINT fk_photo_trip_place
        FOREIGN KEY (trip_place_id)
        REFERENCES trip_place(trip_place_id)
);


-- =====================================================
-- 10. ACCOMMODATION
-- =====================================================

CREATE TABLE accommodation (
    accommodation_id NUMBER PRIMARY KEY,
    trip_id NUMBER NOT NULL,
    city_id NUMBER NOT NULL,
    name VARCHAR2(150),
    address VARCHAR2(300),
    check_in_date DATE,
    check_out_date DATE,

    CONSTRAINT fk_accommodation_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id),

    CONSTRAINT fk_accommodation_city
        FOREIGN KEY (city_id)
        REFERENCES city(city_id),

    CONSTRAINT chk_accommodation_dates
        CHECK (
            check_in_date IS NULL
            OR check_out_date IS NULL
            OR check_out_date >= check_in_date
        )
);


-- =====================================================
-- 11. TRANSPORTATION
-- =====================================================

CREATE TABLE transportation (
    transportation_id NUMBER PRIMARY KEY,
    trip_id NUMBER NOT NULL,
    from_city_id NUMBER,
    to_city_id NUMBER,
    transportation_type VARCHAR2(50),
    departure_date DATE,
    arrival_date DATE,

    CONSTRAINT fk_transportation_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id),

    CONSTRAINT fk_transport_from_city
        FOREIGN KEY (from_city_id)
        REFERENCES city(city_id),

    CONSTRAINT fk_transport_to_city
        FOREIGN KEY (to_city_id)
        REFERENCES city(city_id),

    CONSTRAINT chk_transportation_dates
        CHECK (
            departure_date IS NULL
            OR arrival_date IS NULL
            OR arrival_date >= departure_date
        )
);


-- =====================================================
-- 12. EXPENSE
-- =====================================================

CREATE TABLE expense (
    expense_id NUMBER PRIMARY KEY,
    trip_id NUMBER NOT NULL,
    expense_date DATE,
    category VARCHAR2(50),
    amount NUMBER(10,2),
    currency VARCHAR2(10),
    description VARCHAR2(300),

    CONSTRAINT fk_expense_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id),

    CONSTRAINT chk_expense_amount
        CHECK (amount >= 0)
);


-- =====================================================
-- 13. COMPANION
-- =====================================================

CREATE TABLE companion (
    companion_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(150)
);


-- =====================================================
-- 14. TRIP COMPANION
-- =====================================================

CREATE TABLE trip_companion (
    trip_id NUMBER NOT NULL,
    companion_id NUMBER NOT NULL,

    CONSTRAINT pk_trip_companion
        PRIMARY KEY (trip_id, companion_id),

    CONSTRAINT fk_trip_companion_trip
        FOREIGN KEY (trip_id)
        REFERENCES trip(trip_id),

    CONSTRAINT fk_trip_companion_companion
        FOREIGN KEY (companion_id)
        REFERENCES companion(companion_id)
);
