from modules.sql import utilities


#query to see all current vendors
#   @params: none
#   @return: list of all vendor objects
def query_vendor():
    return utilities.query("SELECT * FROM Vendors")


#query to see sum of revenue from all vendors
#   @params: none
#   @return: list of: V_ID, sum in decending order
def query_max_vendor():
    return utilities.query("SELECT p.V_ID,SUM(p.Revenue) as sum FROM (SELECT SUM(Total_Price) AS Revenue, V_ID FROM Order_Exports GROUP BY V_ID) p GROUP BY V_ID ORDER BY sum DESC")


#query to see all order import and their description
#   @return (list)
def query_exports():
    return utilities.query("select * from Export_Desc LEFT JOIN Order_Exports on Export_Desc.Export_ID=Order_Exports.Export_ID")


#query count number of order in all orders by a Specified vendor
#    @params : vid
#    @return convert(: int)
def query_count_order_vendor(vid):
    return utilities.query("SELECT COUNT(*) FROM Order_Exports where V_ID='"+vid+"'")


#query see the amount of every item that has been ordered by all vendors (eg: popular among vendors)
#    @return convert(: list of SKU and sum)
def query_popular_vendor():
    return utilities.query("SELECT SKU, SUM(Quantity) FROM (SELECT SKU, Quantity FROM Exports_Desc GROUP BY SKU) GROUP BY SKU) ORDER BY SUM(Quantity)")


# -----------------------------INSERTS-------------------------------

#Insert a new vendor
#   @param: email, name, phone, owner, address
#   @return: none
def insert_vendor(email, name, phone, owner, address):
    utilities.execute("INSERT INTO Vendors value (0,'"+email+"','"+phone+"','"+name+"','"+owner+"','"+address+"')")


#insert new order import
def insert_import(email, name, phone, owner, address):
    utilities.execute("INSERT INTO Vendors value (0,'"+email+"','"+phone+"','"+name+"','"+owner+"','"+address+"')")


# ---------------------------DELETE----------------------------------

#Delete a vendor
#   @param:  id_party
#   @return: none
def del_vendor(id_party):
    utilities.execute("DELETE FROM Vendors where V_ID="+id_party)