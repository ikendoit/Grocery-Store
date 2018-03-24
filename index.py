from flask import Flask, render_template, request, url_for, session, redirect, jsonify
from flask_cors import CORS
from modules.sql import Login, Manager, Vendors, Producers, Products, Staff, Parties

app = Flask(__name__)
app.secret_key = "CPSC 3332 << 1"

CORS(app)

manager = Manager.Manager()

# ********************USER PAGES********************************************


@app.route("/")
def index(user=None):
    return render_template("index.html",
                           user=(session["info"] if "info" in session else None))


@app.route("/profile/", methods=["GET"])
def profile():
    return render_template("profile.html",
                           user=(session["info"] if "info" in session else None))


@app.route("/contact/")
def contact():
    return render_template("contact.html",
                           user=(session["info"] if "info" in session else None))


@app.route("/about/")
def about():
    return render_template("about.html",
                           user=(session["info"] if "info" in session else None))


@app.route("/login/")
def login():
    return render_template("login.html")


@app.route("/signup/")
def signup():
    return render_template("signup.html")

#***************************BUSINESS PROCESSES************************************


@app.route("/products/", methods=["GET", "POST"])
def products():
    try: 
        product_list = Products.query_all_products_info()
    except Exception as e:
        product_list = ["error loading products"]
        print(e)
    return render_template("products.html",
                           user=(session["info"] if "info" in session else None),
                           products=product_list)


@app.route("/producers/", methods=["GET", "POST"])
def producers():
    try:
        producers = Producers.query_producer()
        imports = Producers.query_imports()
        stat = Producers.query_max_producer()
    except Exception as e:
        print("error 51")
        print(e)
    return render_template("producers.html",
                           user=(session["info"] if "info" in session else None),
                           list_party=producers,
                           list_order=imports,
                           stat=stat)


@app.route("/vendors/", methods=["GET", "POST"])
def vendors():
    try:
        vendors = Vendors.query_vendor()
        exports = Vendors.query_exports()
        stat = Vendors.query_max_vendor()
    except Exception as e:
        print("error 60")
        print(e)
    return render_template("vendors.html",
                           user=(session["info"] if "info" in session else None),
                           list_party=vendors,
                           list_order=exports,
                           stat=stat)


@app.route("/admin/")
def admin():
    try:
        users = manager.query_all_employee()
        modify = Products.query_modify_info()
        quantify = Products.query_quantify_info()
    except Exception as e:
        print(e)

    return render_template("admin.html",
                           user=(session["info"] if "info" in session else None),
                           people=users,
                           modify=modify,
                           quantify=quantify)

#******************AUTHENTICATION*************************************************


@app.route("/login", methods=["POST"])
def loginPOST():
    # authenticate user
    if request.form["name"] != "" and request.form["id"] != "":

        info = Login.login_user(request.form["name"], request.form["id"])

        #set user session
        if len(info) > 0:
            session["user"] = request.form["name"]
            session["info"] = info[0]
            return redirect(url_for("index"))

    return render_template("login.html",
                           message="Invalid Name or ID")
    

@app.route("/logout", methods=["POST"])
def logout():
    session.pop("info",None);
    return redirect(url_for("login"));


#***********************INSERT OPERATIONS**********************************************

#insert new product
@app.route("/addproduct", methods=["POST"])
def add_product():
    form = request.form
    try:
        result= Parties.insert_product(form["sku"], form["name"], form["price"], form["amount"], form["section"], form["weight"])
    except Exception as e:
        print(e)

    return redirect(url_for("products")) 


#insert new vendor
@app.route("/addvendors", methods=["POST"])
def add_vendors():
    form = request.form
    try:
        result= Vendors.insert_vendor(form["email"], form["name"], form["phone"], form["owner_name"], form["address"], )
    except Exception as e:
        print(e)

    return redirect(url_for("vendors")) 


#Insert New Producers
@app.route("/addproducers", methods=["POST"])
def add_producers():
    form = request.form
    try:
        result= Producers.insert_producer(form["email"], form["name"], form["phone"], form["owner_name"], form["address"], )
    except Exception as e:
        print(e)

    return redirect(url_for("producers")) 


@app.route("/addstaff", methods=["POST"])
def add_staff():
    form = request.form
    try: 
        manager.add_staff(form)
    except Exception as e:
        print(e)

    return redirect(url_for("admin")) 

#*****************************DELETE OPERATION**************************************


@app.route("/delproduct", methods=["POST"])
def del_product():
    form = request.form
    try:
        Parties.del_product(form["sku"])
    except Exception as e:
        print(e)

    return redirect(url_for("products")) 


@app.route("/delproducer", methods=["POST"])
def del_producer():
    form = request.form
    try:
        Parties.del_producer(form["p_id"])
    except Exception as e:
        print(e)

    return redirect(url_for("producers")) 


@app.route("/delvendor", methods=["POST"])
def del_vendor():
    form = request.form
    try:
        Parties.del_vendor(form["v_id"])
    except Exception as e:
        print(e)

    return redirect(url_for("vendors")) 


@app.route("/delstaff", methods=["POST"])
def del_staff():
    form = request.form
    try: 
        Parties.del_staff(form)
    except Exception as e : 
        print(e)

    return redirect(url_for("admin")) 


#**********************************MODIFY******************************************

@app.route("/modproduct", methods=["POST"])
def mod_product():
    form = request.form
    try:
        Parties.mod_product(form)
        Products.insert_modify(form["sku"], session["info"]["Staff_ID"])
    except Exception as e:
        print(e)

    return redirect(url_for("products")) 


@app.route("/modproducers", methods=["POST"])
def mod_producer():
    form = request.form
    try:
        Parties.mod_producer(form)
    except Exception as e:
        print(e)

    return redirect(url_for("producers")) 


@app.route("/modvendors", methods=["POST"])
def mod_vendor():
    form = request.form
    try:
        Parties.mod_vendor(form)
    except Exception as e:
        print(e)

    return redirect(url_for("vendors")) 


@app.route("/modstaff", methods=["POST"])
def mod_staff():
    form = request.form
    try: 
        Manager.mod_staff(form)
    except Exception as e : 
        print(e)

    return redirect(url_for("admin")) 

#**************************************APIS*******************************************


@app.route("/api/products/<sku>", methods=["GET"])
def api_products(sku):
    print(request);
    a = Products.query_product_info(sku);
    return jsonify(a);

@app.route("/api/producers/<pid>", methods=["GET"])
def api_producers(pid):
    a = Parties.query_count_order_producer(pid)
    return jsonify(a)


@app.route("/api/vendors/<vid>", methods=["GET"])
def api_vendors(vid):
    a = Parties.query_count_order_vendor(vid)
    return jsonify(a)


@app.route("/api/staffs/<sid>", methods=["GET"])
def api_staffs(sid):
    a = Staff.query_dependants(sid)
    return jsonify(a)


# auto updates without needing to manually update again
if __name__ == '__main__':
    app.run(debug=True)
