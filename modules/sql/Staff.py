from modules.sql import utilities


class Staff:

    # TODO: Need To Order: The update/delete queries need to be sorted to see who can do what

    # query to see all workers
    #   @return convert(: list of worker )
    def query_worker(self):
        utilities.query("SELECT * from Workers")

    # query to see a worker and their mentor
    #   @param: workerid
    #   @return: list of worker and their mentor
    def query_mentor(self):
        utilities.query("SELECT a1.Name ASMentoree, a.Staff_ID ASMentoreeID, b1.Name ASMentor, b.Staff_ID ASMentorID "
                        "FROM Worker a, Worker b, Staff a1, Staff b1 "
                        "WHERE a.Mentor_ID = b.Staff_ID and a.Staff_ID=a1.Staff_ID and b.Staff_ID=b1.Staff_ID")

    def query_dependants(self, staffid):
        utilities.query("SELECT * from Dependants "
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
        utilities.query("select * from Workers")

    # query to see all managers
    #   @return convert(: list of manager )
    def query_manager(self):
        utilities.query("select * from Manager")

    # query to see a worker and their mentor
    #   @param: workerid
    #   @return: list of worker and their mentor
    def query_mentor(self):
        utilities.query(
            "select a1.Name AS Mentoree, a.Staff_ID AS MentoreeID, b1.Name as Mentor, b.Staff_ID AS MentorID FROM Worker a, Worker b, Staff a1, Staff b1 where a.Mentor_ID = b.Staff_ID and a.Staff_ID=a1.Staff_ID and b.Staff_ID=b1.Staff_ID")

    # query product info
    #    @params : SKU
    #    @return convert(: dict)
    def query_product_info(self, SKU):
        utilities.query("select * from products where SKU='" + SKU + "'")

    # query all products info
    #    @return convert(: list of dicts)
    def query_all_products_info(self):
        utilities.query("select * from product")

    # query to check what product a staff quantified
    #    @params : userid
    #    @retucrn : list of SKU, Name
    def query_quantify_info(self, staffid):
        utilities.query(
            "SELECT q.SKU, p.Product_Name FROM Quantify q, Product p where q.SKU=p.SKU and q.Staff_ID='" + staffid + "'")

    # query count number of order in all orders by a Specified vendor
    #    @params : vid
    #    @return convert(: int)
    def query_count_order_vendor(self, vid):
        utilities.query("SELECT COUNT(*) FROM Order_Exports where V_ID='" + vid + "'")

    # query count number of order in all orders by a Specified Producer
    #    @params : pid
    #    @return convert(: int)
    def query_count_order_producer(self, pid):
        utilities.query("SELECT COUNT(*) FROM Order_Imports where P_ID='" + pid + "'")

    # query see the amount of every item that has been ordered by all vendors (eg: popular among vendors)
    #    @return convert(: list of SKU and sum)
    def query_popular_vendor(self):
        utilities.query(
            "SELECT SKU, SUM(Quantity) FROM (SELECT SKU, Quantity FROM Exports_Desc GROUP BY SKU) GROUP BY SKU) ORDER BY SUM(Quantity)")

    # query see the amount of every item that has been bought by all producer (eg: popular among producers/ most bought by us )
    #    @return convert(: list of SKU and sum)
    def query_popular_producer(self):
        utilities.query(
            "SELECT SKU, SUM(Quantity) FROM (SELECT SKU, Quantity FROM Imports_Desc GROUP BY SKU) GROUP BY SKU) ORDER BY SUM(Quantity)")
