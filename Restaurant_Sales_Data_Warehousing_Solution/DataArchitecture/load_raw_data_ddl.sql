DROP TABLE IF EXISTS RestaurantSales;

CREATE TABLE RestaurantSales (

	customer_number_business_key			INT
	, product_business_key					INT
	, device_business_key					INT
	, restaurant_business_key				INT
	, state_business_key					INT
	, date_business_key						INT
	, promotion_id							INT
	, product_purchased						VARCHAR(100)
	, number_of_times_product_purchased		INT
	, place_of_purchase						VARCHAR(100)
	, product_purchased_quantity			INT
	, date_of_purchase						DATE
	, payment_type							VARCHAR(20)
	, payout_amount							FLOAT
	, first_name							VARCHAR(50)
	, last_name								VARCHAR(50)
	, email									VARCHAR(75)
	, age									INT
	, postcode								VARCHAR(10)
	, state									VARCHAR(50)
	, status								VARCHAR(20)
	, device								VARCHAR(20)
	, date_paid								DATE

	CONSTRAINT pk_customer_number			PRIMARY KEY (customer_number_business_key)

);