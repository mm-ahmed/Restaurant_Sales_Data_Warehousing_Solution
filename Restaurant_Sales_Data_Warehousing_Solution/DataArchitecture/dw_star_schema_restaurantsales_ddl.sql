USE	DW_OpenSourceProjectsDB;

DROP TABLE IF EXISTS dimCustomer_rs;
CREATE TABLE dimCustomer_rs (
	customer_number_business_key			INT	NOT NULL
	, first_name							VARCHAR(50)
	, last_name								VARCHAR(50)
	, full_name								VARCHAR(100)
	, email									VARCHAR(75)
	, age									INT

	CONSTRAINT pk_customer_id_rs			PRIMARY KEY (customer_number_business_key)
);

DROP TABLE IF EXISTS dimProduct_rs;
CREATE TABLE dimProduct_rs (
	product_business_key					INT NOT NULL
	, product_purchased						VARCHAR(100)
	, place_of_purchase						VARCHAR(100)

	CONSTRAINT pk_product_id_rs				PRIMARY KEY (product_business_key)
);

DROP TABLE IF EXISTS dimSourceDevice_rs;
CREATE TABLE dimSourceDevice_rs (
	device_business_key						INT NOT NULL
	, order_placing_source_device			VARCHAR(20)

	CONSTRAINT pk_device_id_rs				PRIMARY KEY (device_business_key)
);

DROP TABLE IF EXISTS dimRestaurant_rs;
CREATE TABLE dimRestaurant_rs (
	restaurant_business_key					INT NOT NULL
	, restaurant_name						VARCHAR(100)

	CONSTRAINT pk_restaurant_id_rs			PRIMARY KEY (restaurant_business_key)
);

DROP TABLE IF EXISTS dimState_rs;
CREATE TABLE dimState_rs (
	state_business_key						INT NOT NULL
	, state									VARCHAR(50)
	, postcode								VARCHAR(10)

	CONSTRAINT pk_state_id_rs				PRIMARY KEY (state_business_key)
);

DROP TABLE IF EXISTS dimDate_rs;
CREATE TABLE dimDate_rs (
	date_business_key						INT NOT NULL
	, date_of_purchase						DATE

	CONSTRAINT pk_date_id_rs				PRIMARY KEY (date_business_key)
);

DROP TABLE IF EXISTS factRestaurantSales_rs;
CREATE TABLE factRestaurantSales_rs (
	customer_id								INT FOREIGN KEY REFERENCES dimCustomer_rs(customer_number_business_key)
	, product_id							INT FOREIGN KEY REFERENCES dimProduct_rs(product_business_key)
	, source_device_id						INT FOREIGN KEY REFERENCES dimSourceDevice_rs(device_business_key)
	, restaurant_id							INT FOREIGN KEY REFERENCES dimRestaurant_rs(restaurant_business_key)
	, state_id								INT FOREIGN KEY REFERENCES dimState_rs(state_business_key)
	, date_id								INT FOREIGN KEY REFERENCES dimDate_rs(date_business_key)
	, payout_amount							FLOAT
	, number_of_times_product_purchased		INT
	, product_purchased_quantity			INT
	
	CONSTRAINT pk_fact_restaurant_sales_rs	PRIMARY KEY
	(
		customer_id
		, product_id
		, source_device_id
		, restaurant_id
		, state_id
		, date_id
	)
);