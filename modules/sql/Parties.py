from modules.sql import utilities

#**************************************INSERT****************************************

# insert new order import
def insert_import(email, name, phone, owner, address):
    utilities.execute("INSERT INTO Vendors value (0,'"+email+"','"+phone+"','"+name+"','"+owner+"','"+address+"')")

# Insert a new vendor
#   @param: email, name, phone, owner, address
#   @return: none
def insert_vendor(email, name, phone, owner, address):
    utilities.execute("INSERT INTO Vendors value (0,'"+email+"','"+phone+"','"+name+"','"+owner+"','"+address+"')")

# Insert a new producer
#   @param: email, name, phone, owner, address
#   @return: none
def insert_producer(email, name, phone, owner, address):
    utilities.execute("INSERT INTO Producers value (0,'"+email+"','"+phone+"','"+name+"','"+owner+"','"+address+"')")

# Insert a new product
#   @param:  sku, name, amount, section, weight
#   @return: none
def insert_product(sku, name, price, amount, section, weight):
    utilities.execute("INSERT INTO Products(SKU, Section_Num,Weight,Amount,Product_Name,Price) value ("+sku+",'"+section+"','"+weight+"','"+amount+"','"+name+"','"+price+"')")

#****************************************DELETE*****************************************

# Delete a product
#   @param:  sku
#   @return: none
def del_product(sku):
    utilities.execute("DELETE FROM Products where SKU="+sku)


# Delete a producer
#   @param:  id_party
#   @return: none
def del_producer(id_party):
    utilities.execute("DELETE FROM Producers where P_ID="+id_party)


# Delete a vendor
#   @param:  id_party
#   @return: none
def del_vendor(id_party):
    utilities.execute("DELETE FROM Vendors where V_ID="+id_party)

#***************************************MODIFY/UPDATE*********************************


# Modify a product
#   @param:  sku
#   @return: none
def mod_product(form):
    query = ""
    for info in form:
        if form[info] != "" :
            if info == "name":
                query = query+" Product_Name='"+form[info]+"' "
            if info == "price":
                query = query+" Price="+form[info]
            if info == "amount":
                query = query+" Amount="+form[info]
            if info == "section":
                query = query+" Section_Num="+form[info]
            if info == "weight":
                query = query+" Weight="+form[info]

    return utilities.execute("UPDATE Products set "+query+" where SKU="+form["sku"])


# Modify a producer
#   @param:  id_party
#   @return: none
def mod_producer(form):
    query = ""
    for info in form:
        if form[info] != "":
            if info == "name":
                query = query+" P_Name='"+form[info]+"' "
            if info == "email":
                query = query+" Email='"+form[info]+"' "
            if info == "phone":
                query = query+" PhoneNum='"+form[info]+"' "
            if info == "address":
                query = query+" Address='"+form[info]+"' "
            if info == "owner_name":
                query = query+" Owner_Name='"+form[info]+"' "

    return utilities.execute("UPDATE Producers set "+query+" where P_ID="+form["id"])


# modify a vendor
#   @param:  id_party
#   @return: none
def mod_vendor(form):
    query = ""
    for info in form:
        if form[info] != "":
            if info == "name":
                query = query+" V_Name='"+form[info]+"' "
            if info == "email":
                query = query+" Email='"+form[info]+"' "
            if info == "phone":
                query = query+" PhoneNum='"+form[info]+"' "
            if info == "address":
                query = query+" Address='"+form[info]+"' "
            if info == "owner_name":
                query = query+" Owner_Name='"+form[info]+"' "

    return utilities.execute("UPDATE Vendors set "+query+" where V_ID="+form["id"])
    

