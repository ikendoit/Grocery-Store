INSERT INTO Staff VALUES(
1, 'Ken N', '1020302827181', '3913 Cates Landing Way', '1998/3/1', 6043669692, 'virginman101@gmail.com', '111222131112', '2017/9/6'
);
INSERT INTO Staff VALUES(
2, 'Gary Y', '1123211127181', '323 something Vancouver', '1912/3/1', '6043569692', 'thisemail2@gmail.com', '155222131112', '2017/9/1'
);
INSERT INTO Staff VALUES(
3, 'Parm B', '1220302827181', '313 VC', '1913/3/1', 6043269692, 'thisemail3@gmail.com', '144222131112', '2017/9/2'
);
INSERT INTO Staff VALUES(
4, 'Ken F', '1320302827181', '391 Cates Landing Way', '1992/3/1', 6043619692, 'thisemail4@gmail.com', '133222131555', '2017/9/5'
);
INSERT INTO Staff VALUES(
5, 'Ken W', '1420302827281', 'add 52', '1991/3/1', 6003629692, 'thisemail5@gmail.com', '122222333112', '2016/9/6'
);
INSERT INTO Staff VALUES(
6, 'Ken Q', '20302827181', 'add 50', '1991/3/1', 6033629692, 'thisemail@gmail.com', '12333112', '2016/1/6'
);
INSERT INTO Staff VALUES(
7, 'Ken W', '1420302827181', 'add 39', '1989/3/1', 6043629692, 'thisemail10@gmail.com', '129999933112', '2016/2/6'
);
INSERT INTO Staff VALUES(
8, 'Ken WC', '7720302827181', 'add 12', '1991/1/1', 6013629692, 'thisemail11@gmail.com', '9999933112', '2016/12/6'
);
INSERT INTO Staff VALUES(
9, 'Ken WB', '6520302827181', 'add 13', '1991/3/1', 6023629322, 'thisemail12@gmail.com', '219933112', '2016/5/6'
);
INSERT INTO Staff VALUES(
10, 'Logger', '5820302827181', 'add 14', '1991/12/1', 603362962, 'thisemail13@gmail.com', '12933112', '2016/7/6'
); 


INSERT INTO Workers (Staff_ID, Role, Mentor_ID) VALUES(
1, 'Quality Assurance', 2
);
INSERT INTO Workers (Staff_ID, Role, Mentor_ID) VALUES(
2, 'Quality Assurance', NULL
);
INSERT INTO Workers (Staff_ID, Role, Mentor_ID) VALUES(
3, 'Loader/Unloader', 2
);
INSERT INTO Workers (Staff_ID, Role, Mentor_ID) VALUES(
4, 'Loader/Unloader', NULL
);
INSERT INTO Workers (Staff_ID, Role, Mentor_ID) VALUES(
5, 'Stocker', 4
);


INSERT INTO Manager VALUES(
6, 100000, '1929/3/2'
);
INSERT INTO Manager VALUES(
7, 100000, '1929/3/1'
);
INSERT INTO Manager VALUES(
8, 199999, '1929/1/30'
);
INSERT INTO Manager VALUES(
9, 99999, '1929/1/29'
);
INSERT INTO Manager VALUES(
10, 172000, '1929/1/28'
);


INSERT INTO Producers VALUES(
1, 'prod1@gmail.com', 11111112222, 'prod1name', 'Prod1_owner', '111 vancouver'
);
INSERT INTO Producers VALUES(
2, 'prod2@gmail.com', 12211112222, 'prod2name', 'Prod2_owner', '122 vancouver'
);
INSERT INTO Producers VALUES(
3, 'prod3@gmail.com', 11111113333, 'prod3name', 'Prod3_owner', '133 vancouver'
);
INSERT INTO Producers VALUES(
4, 'prod4@gmail.com', 11111114444, 'prod4name', 'Prod4_owner', '144 vancouver'
);
INSERT INTO Producers VALUES(
5, 'prod5@gmail.com', 11111115555, 'prod5name', 'Prod5_owner', '155 vancouver'
);


INSERT INTO Products VALUES(
1, 10, 3, 110, 'Cake 1', 19
);
INSERT INTO Products VALUES(
2, 21, 4, 112, 'Cake 2', 20
);
INSERT INTO Products VALUES(
3, 16, 6, 113, 'Cake 3', 23
);
INSERT INTO Products VALUES(
4, 44, 14, 14, 'Cake 4', 24
);
INSERT INTO Products VALUES(
5, 25, 5, 115, 'Cake 5', 35
);


INSERT INTO Vendors VALUES(
1, 'Vend1@gmail.com', 1111111111, 'Vendor 1 Name', 'Vendor 1 Owner', 'Ven1 Address'
);
INSERT INTO Vendors VALUES(
2, 'Vend2@gmail.com', 2211111111, 'Vendor 2 Name', 'Vendor 2 Owner', 'Ven2 Address'
);
INSERT INTO Vendors VALUES(
3, 'Vend3@gmail.com', 3311111111, 'Vendor 3 Name', 'Vendor 3 Owner', 'Ven3 Address'
);
INSERT INTO Vendors VALUES(
4, 'Vend4@gmail.com', 4411111111, 'Vendor 4 Name', 'Vendor 4 Owner', 'Ven4 Address'
);
INSERT INTO Vendors VALUES(
5, 'Vend5@gmail.com', 5511111111, 'Vendor 5 Name', 'Vendor 5 Owner', 'Ven5 Address'
);


INSERT INTO Dependants VALUES(
1, 110124111, 'Dep 1', '1967/3/1'
);
INSERT INTO Dependants VALUES(
2, 220112111, 'Dep 2', '1992/3/1'
);
INSERT INTO Dependants VALUES(
3, 330212111, 'Dep 3', '1963/3/1'
);
INSERT INTO Dependants VALUES(
4, 443312111, 'Dep 4', '1964/3/1'
);
INSERT INTO Dependants VALUES(
5, 551211221, 'Dep 5', '1965/3/1'
);


INSERT INTO Order_Imports VALUES(
1, 1, '2017/5/1', 18000.110
);
INSERT INTO Order_Imports VALUES(
2, 3, '2017/5/2', 18002.220
);
INSERT INTO Order_Imports VALUES(
3, 4, '2017/5/3', 18030.130
);
INSERT INTO Order_Imports VALUES(
4, 5, '2017/5/4', 48000.410
);
INSERT INTO Order_Imports VALUES(
5, 2, '2017/5/5', 15000.510
);


INSERT INTO Import_Desc VALUES(
1, 3, 11
);
INSERT INTO Import_Desc VALUES(
2, 4, 12
);
INSERT INTO Import_Desc VALUES(
3, 1, 11
);
INSERT INTO Import_Desc VALUES(
4, 5, 21
);
INSERT INTO Import_Desc VALUES(
5, 3, 11
);


INSERT INTO Order_Exports VALUES(
1, 1, '2016/4/3', 23000.233
);
INSERT INTO Order_Exports VALUES(
2, 2, '2017/4/2', 23000.233
);
INSERT INTO Order_Exports VALUES(
3, 1, '2016/4/5', 24000.233
);
INSERT INTO Order_Exports VALUES(
4, 1,'2016/4/6', 26000.233
);
INSERT INTO Order_Exports VALUES(
5, 1, '2016/4/7', 23000.233
);


INSERT INTO Export_Desc VALUES(
1, 2, 20
);
INSERT INTO Export_Desc VALUES(
2, 2, 20
);
INSERT INTO Export_Desc VALUES(
3, 3, 24
);
INSERT INTO Export_Desc VALUES(
4, 3, 70
);
INSERT INTO Export_Desc VALUES(
5, 3, 70
);


INSERT INTO Quantify VALUES(
1, '2017/3/1', 1
);
INSERT INTO Quantify VALUES(
2, '2017/3/1', 3
);
INSERT INTO Quantify VALUES(
3, '2017/3/1', 2
);
INSERT INTO Quantify VALUES(
4, '2017/3/1', 4
);
INSERT INTO Quantify VALUES(
5,'2017/3/1', 5
);


INSERT INTO Modify VALUES(
'2017/2/1', 1, 6
);
INSERT INTO Modify VALUES(
'2017/2/2', 1, 7
);
INSERT INTO Modify VALUES(
'2017/2/1', 3, 8
);
INSERT INTO Modify VALUES(
'2017/2/1', 4, 9 
);
INSERT INTO Modify VALUES(
'2017/2/1', 5, 10
);


INSERT INTO Oversees_Import VALUES(
2, 1, 3, 1
);
INSERT INTO Oversees_Import VALUES(
2, 3, 4, 0
);
INSERT INTO Oversees_Import VALUES(
3, 1, 2, 0
);
INSERT INTO Oversees_Import VALUES(
4, 2, 1, 1
);
INSERT INTO Oversees_Import VALUES(
5, 1, 5, 1
);


INSERT INTO Oversees_Export VALUES(
1, 1, 1, 1
);
INSERT INTO Oversees_Export VALUES(
2, 2, 3, 1 
);
INSERT INTO Oversees_Export VALUES(
1, 3, 4, 1
);
INSERT INTO Oversees_Export VALUES(
3, 4, 2, 0
);
INSERT INTO Oversees_Export VALUES(
4, 5, 5, 0
);
