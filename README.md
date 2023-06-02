# Restaurant_Sales_Data_Warehousing_Solution

**Introduction:**
This is an end-to-end data processing pipeline on a Mexican Restaurant sales dataset saved in Excel. The required meaningful data fields are identified and are extracted, cleansed and transformed and saved by the Python script. Next the prepared dataset is loaded in SSMS via SSIS package, where the DDLs are written to host the raw dataset. Once the raw data is loaded, the SSIS package files stored in the project makes use of the DDLs to create a Star-Schema (Dimensional Modeling) to store the data in a Data Warehouse. Hence, the relevant SSIS package files automate the process of loading the Data Warehouse in SSMS. Last, the prepared dataset is further linked to a Power BI Desktop session file for a quick glance over a few trends hidden inside the dataset. The project is containerised into the following folders' structure.

**A - RestaurantSales**
The folder contains subfolders, where the 'RestaurantSales' folder contains the Python code along with the source data and the transformed resultset. Please note that in the source data there can be many transformations performed, however, just for the purpose of the exercise I did four transformations, i.e. on lastname, email, placeOfPurchase and datePaid.

  Run the script using command (once you're in the directory):  **python restaurant_sales.py**

**B - RestaurantSales_SSIS_Package**
Second, is the 'RestaurantSales_SSIS_Package' folder, where I have used the SSIS (Microsoft's Integration Services) to load the cleansed resultset as a source data to the Database Staging table, and for the purpose of dimensional modeling, I then created and loaded the dimension tables data, and finally, I also loaded the fact table data in the same package.

**C - DataArchitecture**
Third, is the 'DataArchitecture' folder, which contains the sql queries for DDL and the jpg of the Star Schema.

**D - Power BI Dashboard**
Fourth, is the 'Power BI Dashboard' folder which contains the dashboard file where the source data is connected to the csv generated through Python's transformation process. Again, only a few visualisations are prepared just for the purpose of exercise completion.
