from modules.sql import utilities
from modules.sql.Staff import Staff
import datetime


class Manager(Staff):

    # TODO: Need To Order: The update/delete queries need to be sorted to see who can do what

    # delete product
    #   @param: SKU
    #   @return: none
    def query_delete_product(self, sku):
        utilities.execute("DELETE FROM Product where SKU='" + sku + "'")

    # Update price of a product
    #    @params : sku, price
    #    @return convert(: none)
    def query_user_info(self, sku, price):
        utilities.execute("UPDATE Product SET Product_Price='" + price + "' WHERE SKU='" + sku + "'")

    # query users info
    #    @params : userid
    #    @return convert(: list of objects)
    def query_user_info(self, userid):
        utilities.query("select * from users where User_ID='" + userid + "'")

    # query to see all current vendors
    #   @params: none
    #   @return: list of all vendor objects
    def query_vendor(self):
        utilities.query("SELECT * FROM Vendors")

    # query to see all current producers
    #   @params: none
    #   @return: list of all producers objects
    def query_producer(self):
        utilities.query("SELECT * FROM Producers")

    # query to see highest revenue generating vendor
    #   @params: none
    #   @return: vendor object
    #def query_max_vendor(self):
    #    utilities.query(
    #        "SELECT V_ID,MAX(Revenue) FROM (SELECT SUM(Total_Price) AS Revenue, V_ID FROM Order_Exports GROUP BY V_ID)")
    #    # may need to fix

    ## query to see highest revenue consuming producer
    ##   @params: none
    ##   @return: producer object
    #def query_max_producer(self):
    #    utilities.query(
    #        "SELECT P_ID,MAX(Revenue) FROM (SELECT SUM(Total_Price) AS Revenue, P_ID FROM Order_Imports GROUP BY P_ID)")
    #    # had a [0]

    # query to remove a worker
    #   @Params: workerID
    #   @return: none
    def query_delete_worker(self, workerid):
        utilities.execute("DELETE FROM Staff WHERE Staff_ID = " + workerid)

    # query to change a worker's hourly wagr :
    #   @Params: workerid, wage
    #   @return: none
    def query_change_wage(self, workerid, wage):
        utilities.execute("UPDATE Workers SET Hourly_Rate = '" + wage + "' WHERE Staff_ID = " + workerid)

    # query to change a manager's salary :
    #   @Params: managerid, salary
    #   @return: none
    def query_change_salary(self, managerid, salary):
        utilities.execute("UPDATE Managers SET Salary = '" + salary + "' WHERE Staff_ID = " + managerid)


    # -----queries-----

    # query to see all employees
    def query_all_employee(self):
        return utilities.query("SELECT * FROM Staff")

    # -----inserts-----

    # insert a staff
    def add_staff(self, form):
        now = datetime.datetime.now()
        print(form)
        utilities.execute(
            "INSERT INTO Staff(Staff_ID, Name, sSin, Address, Birthdate, PhoneNum, Email, Bank_Info, Date_info_Start) "
            "VALUES('0', '" + form["name"] + "','" + str(form["sin"]) + "','" + form["address"] + "','" + str(
                form["birthdate"]) + "','" + str(form["phone"]) + "','" + form["email"] + "','" + str(
                form["bank"]) + "','" + str(now.year) + "/" + str(now.month) + "/" + str(now.day) + "')")

    # -----updates-----

    # change a manager's salary:
    #   @Params: managerid, salary
    #   @return: none
    def change_salary(self, managerid, salary):
        utilities.execute("UPDATE Managers SET Salary = '" + salary + "' WHERE Staff_ID = " + managerid)

    # Modify a product
    #   @param:  sku
    #   @return: none
    def mod_product(self, form):
        query = ""
        for info in form:
            if form[info] != "" :
                if info == "name":
                    query = query + " Product_Name='" + form[info] + "' "
                if info == "price":
                    query = query + " Price=" + form[info]
                if info == "amount":
                    query = query + " Amount=" + form[info]
                if info == "section":
                    query = query + " Section_Num=" + form[info]
                if info == "weight":
                    query = query + " Weight=" + form[info]

        return utilities.execute("UPDATE Products set " + query + " where SKU=" + form["sku"])

    # Modify a producer
    #   @param:  id_party
    #   @return: none
    def mod_producer(self, form):
        query = ""
        for info in form:
            if form[info] != "":
                if info == "name":
                    query = query + " P_Name='" + form[info] + "' "
                if info == "email":
                    query = query + " Email='" + form[info] + "' "
                if info == "phone":
                    query = query + " PhoneNum='" + form[info] + "' "
                if info == "address":
                    query = query + " Address='" + form[info] + "' "
                if info == "owner_name":
                    query = query + " Owner_Name='" + form[info] + "' "

        return utilities.execute("UPDATE Producers set " + query + " where P_ID=" + form["id"])

    # modify a vendor
    #   @param:  id_party
    #   @return: none
    def mod_vendor(self, form):
        query = ""
        for info in form:
            if form[info] != "":
                if info == "name":
                    query = query + " V_Name='" + form[info] + "' "
                if info == "email":
                    query = query + " Email='" + form[info] + "' "
                if info == "phone":
                    query = query + " PhoneNum='" + form[info] + "' "
                if info == "address":
                    query = query + " Address='" + form[info] + "' "
                if info == "owner_name":
                    query = query + " Owner_Name='" + form[info] + "' "

        return utilities.execute("UPDATE Vendors set " + query + " where V_ID=" + form["id"])

    def mod_profile(self, form):
        query = ""
        for info in form:
            if form[info] != "" :
                if info == "Staff_ID":
                    query = query + " Staff_ID ='" + form[info] + "' "
                if info == "Name":
                    query = query + " Name=" + form[info]
                if info == "Address":
                    query = query + " Address=" + form[info]
                if info == "PhoneNum":
                    query = query + " PhoneNum=" + form[info]
        return utilities.execute("UPDATE Staff set " + query + " where Staff_ID=" + form["Staff_ID"])

# CREATE TABLE Staff (
# Staff_ID int AUTO_INCREMENT, 
# Name varchar(50) NOT NULL, 
# sSin varchar(20) NOT NULL UNIQUE, 
# Address varchar(50) NOT NULL, 
# Birthdate date NOT NULL, 
# PhoneNum varchar(15) NOT NULL UNIQUE, 
# Email varchar(30) NOT NULL UNIQUE, 
# Bank_Info varchar(30) NOT NULL UNIQUE,
# Date_info_Start date NOT NULL, 
# PRIMARY KEY(Staff_ID)
# );

