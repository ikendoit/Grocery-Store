from modules.sql import utilities
import datetime
import json


# query product info
#    @params : SKU 
#    @return convert( : dict
def query_product_info(sku):
    return utilities.query("SELECT * from Products "
                           "WHERE SKU='"+sku+"'")

#projection query:
def query_props(req):
    #parse POST REQUEST
    req = json.loads(req);

    #craft query
    query = "SELECT ";
    fields = "";

    #fill in query
    for key,value in req.items():
        if key != "SKU" :   
            if value == True: 
                fields = fields+key+", "
            
    fields = fields+"SKU "

    query = query + fields + "FROM Products WHERE SKU='" +req["SKU"]+"'";

    return utilities.query(query);

# query all products info
#    @return convert( : list of dicts
def query_all_products_info():
    query = "SELECT * from Products ORDER BY LENGTH(SKU)"
    # query = "SELECT * from Products ORDER BY SKU"
    return utilities.query(query)


# query to check what product a staff quantified
#    @params : none
#    @retucrn : list of SKU, Name, StaffID, Date 
def query_quantify_info():
    return utilities.query("SELECT q.SKU, p.Product_Name, q.Date_info, q.Staff_ID "
                           "FROM Quantify q, Products p "
                           "WHERE q.SKU=p.SKU")


# query to check what product a staff modified
#    @params : none
#    @retucrn : list of SKU, Name, staffID, none
def query_modify_info():
    return utilities.query("SELECT q.SKU, p.Product_Name, q.Date_info, q.Staff_ID "
                           "FROM Modify q, Products p "
                           "WHERE q.SKU=p.SKU")


# delete product
#   @param: SKU 
#   @return convert(: none
def query_delete_product(sku):
    utilities.execute("DELETE FROM Products "
                      "WHERE SKU='"+sku+"'")


# **********************************UPDATE PRODUCT******************************

def insert_modify(sku, staffid):
    now = datetime.datetime.now()
    utilities.execute("INSERT INTO Modify(SKU,Date_info, Staff_ID) values('"+str(sku)+"','"+str(now.year)+"/"+str(now.month)+"/"+str(now.day)+"','"+str(staffid)+"')")


def insert_quantify(sku, staffid):
    now = datetime.datetime.now()
    utilities.execute("INSERT INTO Quantify(SKU,Date_info, Staff_ID) values('"+str(sku)+"','"+str(now.year)+"/"+str(now.month)+"/"+str(now.day)+"','"+str(staffid)+"')")


# Update price of a product
#    @params : sku, price 
#    @return convert( : none
def query_price_update(sku, price):
    utilities.execute("UPDATE Products "
                      "SET Product_Price='"+price+"' "
                      "WHERE SKU='"+sku+"'")
