from modules.sql import utilities


#query count number of order in all orders by a Specified vendor
#    @params : vid
#    @return convert(: int)
def query_count_order_vendor(vid):
    return utilities.query("SELECT COUNT(*) FROM Order_Exports where V_ID='"+vid+"'")


#query count number of order in all orders by a Specified Producer
#    @params : pid
#    @return convert(: int)
def query_count_order_producer(pid):
    return utilities.query("SELECT COUNT(*) FROM Order_Imports where P_ID='"+pid+"'")

