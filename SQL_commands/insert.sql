INSERT INTO Staff VALUES(
1, 'Ken N', '143430346', '3913 Cates Landing Way', '1998/3/1', 6047191600, 'virginman101@gmail.com', '5520033435035168', '2017/9/6'
);
INSERT INTO Staff VALUES(
2, 'Gary Y', '138347950', '3988 Alness Street', '1912/3/1', 6047206029, 'mthurn@live.com', '5137403916368732', '2017/9/1'
);
INSERT INTO Staff VALUES(
3, 'Parm B', '164791279', '700 184th Street', '1913/3/1', 6043666528, 'fangorn@hotmail.com', '5127175163174482', '2017/9/2'
);
INSERT INTO Staff VALUES(
4, 'Bradley P', '082191289', '1738 St. John Street', '1992/3/1', 6044425489, 'euice@outlook.com', '5221226689506908', '2017/9/5'
);
INSERT INTO Staff VALUES(
5, 'Diane J', '482518123', '1190 Fourth Avenue', '1991/3/1', 7789898303, 'rgarcia@optonline.net', '5404374921536637', '2016/9/6'
);
INSERT INTO Staff VALUES(
6, 'Albert M', '093507382', '2472 St. John Street', '1991/3/1', 6042801947, 'webdragon@comcast.net', '5324206172373343', '2016/1/6'
);
INSERT INTO Staff VALUES(
7, 'Ken W', '452091192', '2318 Tycos Dr', '1989/3/1', 6049234929, 'mxiao@yahoo.com', '5177433405186197', '2016/2/6'
);
INSERT INTO Staff VALUES(
8, 'Ruby M', '255165425', '127 Sheppard Ave', '1991/1/1', 6047343929, 'drezet@me.com', '5289002117773645', '2016/12/6'
);
INSERT INTO Staff VALUES(
9, 'David R', '507959773', '1756 Wellington Ave', '1991/3/1', 6047310740, 'miyop@icloud.com', '5324205940851432', '2016/5/6'
);
INSERT INTO Staff VALUES(
10, 'Francis L', '350231072', '1381 MacLaren Street', '1991/12/1', 6046481365, 'sakusha@yahoo.ca', '5177430140201414', '2016/7/6'
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
1, 'tenoid@gmail.com', 11111112222, 'tenoid', 'Leonora C Golden', '4033 Robson St'
);
INSERT INTO Producers VALUES(
2, 'homonix@gmail.com', 12211112222, 'homonix', 'Jose J Avery', '3367 Hardy Street'
);
INSERT INTO Producers VALUES(
3, 'biomm@gmail.com', 11111113333, 'biomm', 'Joseph M Yim', '4240 Nootka Street'
);
INSERT INTO Producers VALUES(
4, 'redel@gmail.com', 11111114444, 'redel', 'Georgie M Cornelison', '2912 Hastings Street'
);
INSERT INTO Producers VALUES(
5, 'telente@gmail.com', 11111115555, 'telente', 'Keith A Williamson', '1344 Robson St'
);


INSERT INTO Products VALUES(
1, 10, 3, 110, 'MP3', 19
);
INSERT INTO Products VALUES(
2, 21, 4, 112, 'Shirts', 20
);
INSERT INTO Products VALUES(
3, 16, 6, 113, 'Small Toy Bear', 23
);
INSERT INTO Products VALUES(
4, 44, 14, 14, 'Dumbell', 24
);
INSERT INTO Products VALUES(
5, 25, 5, 115, 'Package of Paper', 35
);


INSERT INTO Vendors VALUES(
1, 'mistita@gmail.com', 1111111111, 'mistita', 'Andrew K Coleman', '1706 Robson St'
);
INSERT INTO Vendors VALUES(
2, 'dezz@gmail.com', 2211111111, 'dezz', 'Iris A Twilley', '2636 rue Levy'
);
INSERT INTO Vendors VALUES(
3, 'conore@gmail.com', 3311111111, 'conore', 'David M Hines', '4626 St Marys Rd'
);
INSERT INTO Vendors VALUES(
4, 'dure@gmail.com', 4411111111, 'dure', 'Nicole W Rodriguez', '2846 Weston Rd'
);
INSERT INTO Vendors VALUES(
5, 'supent@gmail.com', 5511111111, 'supent', 'Antonio E Wells', '4624 Exmouth Street'
);


INSERT INTO Dependants VALUES(
1, 073345928, 'Hilario N', '1967/3/1'
);
INSERT INTO Dependants VALUES(
2, 667107619, 'Brian Y', '1992/3/1'
);
INSERT INTO Dependants VALUES(
3, 594750267, 'Tracie B', '1963/3/1'
);
INSERT INTO Dependants VALUES(
4, 479766180, 'Donna P', '1964/3/1'
);
INSERT INTO Dependants VALUES(
5, 311901268, 'Joseph J', '1965/3/1'
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
