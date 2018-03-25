# Simple Warehouse
Web Service to manage a Warehouse System:

 - Import Products from Producers
 
 - Export Products to Vendors
 
 - Manage Products (Quantify products, modify, insert/delete)

 - Manage Producers (Add/Delete/Modify)

 - Manage Vendors (Add/Delete/Modify)

 - Manage Staffs 

    - Insert/modify/delete

    - Change wage/salary 

 - Keeps a Log user, that keeps track of every product modification made (using SQL trigger)


Teamates: 
	Ging Sing: Gary Yue 
	ikendoit: Ken Nguyen
	pboparai01: Parm Boparai
	BryanJDaniel: Bryan Daniel

hosted on an Amazon Instance: http://35.182.249.219:5000/

login: 
Ken W -- 7  (manager account)
Ken N -- 1 (normal staff)

Guide: make sure: 
	export FLASK_APP=index.py
	export FLASK_DEBUG=1

	python -m flask run 

then: check localhost:5000

Technology stack: 

Python 3 : Flask Frame Work 

JinJa 2 templating engine 

MySQL 5.7

javascript:  SweetAlert 2, functions to make API call for ajax

HTML5, CSS
