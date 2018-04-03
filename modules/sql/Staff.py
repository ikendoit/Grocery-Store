from modules.sql import utilities


class Staff:

    # TODO: Need To Order: The update/delete queries need to be sorted to see who can do what

    # query to see a worker and their mentor
    #   @param: workerid
    #   @return: list of worker and their mentor
    def query_mentor(self):
        return utilities.query("SELECT a1.Name ASMentoree, a.Staff_ID ASMentoreeID, b1.Name ASMentor, b.Staff_ID ASMentorID "
                        "FROM Workers a, Workers b, Staff a1, Staff b1 "
                        "WHERE a.Mentor_ID = b.Staff_ID and a.Staff_ID=a1.Staff_ID and b.Staff_ID=b1.Staff_ID")

    def query_dependants(self, staffid):
        return utilities.query("SELECT * from Dependants "
                        "WHERE Staff_ID="+staffid)

    # query to change a worker's hourly wage
    #   @Params: workerid, wage
    #   @return: none
    def query_change_wage(self, workerid,wage):
        utilities.execute("UPDATE Workers SET Hourly_Rate = '"+wage+"' "
                          "WHERE Staff_ID = "+workerid)

    # query to see all workers
    #   @return convert(: list of worker )
    def query_worker(self):
        return utilities.query("select * from Workers NATURAL JOIN Staff")

    # query to see all managers
    #   @return convert(: list of manager )
    def query_manager(self):
        return utilities.query("select * from Manager NATURAL JOIN Staff")

   # query product info
    #    @params : SKU
    #    @return convert(: dict)
    def query_product_info(self, SKU):
        return utilities.query("select * from Products where SKU='" + SKU + "'")

    # query all products info
    #    @return convert(: list of dicts)
    def query_all_products_info(self):
        return utilities.query("select * from Products")

    # query to check what product a staff quantified
    #    @params : userid
    #    @retucrn : list of SKU, Name
    def query_quantify_info(self, staffid):
        return utilities.query("SELECT q.SKU, p.Product_Name FROM Quantify q, Product p where q.SKU=p.SKU and q.Staff_ID='" + staffid + "'")

    # query count number of order in all orders by a Specified vendor
    #    @params : vid
    #    @return convert(: int)
    def query_count_order_vendor(self, vid):
        return utilities.query("SELECT COUNT(*) FROM Order_Exports where V_ID='" + vid + "'")

    # query count number of order in all orders by a Specified Producer
    #    @params : pid
    #    @return convert(: int)
    def query_count_order_producer(self, pid):
        return utilities.query("SELECT COUNT(*) FROM Order_Imports where P_ID='" + pid + "'")

    # query see the amount of every item that has been ordered by all vendors (eg: popular among vendors)
    #    @return convert(: list of SKU and sum)
    def query_popular_vendor(self):
        return utilities.query(
            "SELECT SKU, SUM(Amount) FROM Export_Desc GROUP BY SKU ORDER BY SUM(Amount)")

    # query see the amount of every item that has been bought by all producer (eg: popular among producers/ most bought by us )
    #    @return convert(: list of SKU and sum)
    def query_popular_producer(self):
        return utilities.query(
            "SELECT SKU, SUM(Amount) FROM Import_Desc GROUP BY SKU ORDER BY SUM(Amount)")

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
