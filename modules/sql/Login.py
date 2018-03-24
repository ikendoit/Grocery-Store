from modules.sql import utilities


#return convert(user info by name and id)
# param: name : str
#        id   : int
def login_user(name_user, id_user):
    try: 
        return utilities.query("SELECT * FROM Staff LEFT JOIN Manager ON Staff.Staff_ID=Manager.Staff_ID WHERE Staff.Name='"+name_user+"' and Staff.Staff_ID="+id_user)
    except Exception as e: 
        print("error logging in: ")
        print(e)
        return ""
