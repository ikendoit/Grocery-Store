from modules.sql import utilities


# query to see all current producers
#   @params: none
#   @return: list of all producers objects
def query_producer():
    return utilities.query("SELECT * FROM Producers")


# query to see sum of revenue spent from all producers
#   @params: none
#   @return: list of P_ID, sum in decending order
def query_max_producer():
    return utilities.query("SELECT p.P_ID,SUM(p.Revenue) as sum "
                           "FROM (SELECT SUM(Total_Price) AS Revenue, P_ID FROM Order_Imports GROUP BY P_ID) p GROUP BY P_ID "
                           "ORDER BY SUM(Revenue) DESC")


# query to see all order import and their description
#   @return (list)
def query_imports():
    return utilities.query("SELECT * "
                           "FROM Import_Desc LEFT JOIN Order_Imports on Import_Desc.Import_ID=Order_Imports.Import_ID")


# query count number of order in all orders by a Specified Producer
#    @params : pid
#    @return convert(: int)
def query_count_order_producer(pid):
    return utilities.query("SELECT COUNT(*) FROM Order_Imports "
                           "WHERE P_ID='"+pid+"'")


# query see the amount of every item that has been bought by all producer (eg: popular among producers/ most bought by us )
#    @return convert(: list of SKU and sum)
def query_popular_producer():
    return utilities.query("SELECT SKU, SUM(Quantity) "
                           "FROM (SELECT SKU, Quantity FROM Imports_Desc GROUP BY SKU) GROUP BY SKU) "
                           "ORDER BY SUM(Quantity)")


# --------------------------Inserts--------------------------


# Insert a new producer
#   @param: email, name, phone, owner, address
#   @return: none
def insert_producer(email, name, phone, owner, address):
    utilities.execute("INSERT INTO Producers values (0,'"+email+"','"+phone+"','"+name+"','"+owner+"','"+address+"')")
