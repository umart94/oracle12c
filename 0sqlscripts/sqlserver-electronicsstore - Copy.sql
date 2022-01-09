CREATE TABLE AREACITY(
AREAID  int not null identity(1,1) primary key,
AREA VARCHAR(max),
CITY VARCHAR(max)

)







CREATE TABLE SHOP(
SHOPID int not null identity(1,1) primary key,
AREAID int,
SHOPNAME VARCHAR(100),
SHOPTELEPHONENUMBER VARCHAR(100),
SHOPMOBILENUMBER VARCHAR(100),
SHOPEMAILADDRESS VARCHAR(100),
ADDRESS VARCHAR(500),
CONSTRAINT SHOPAREA_FK FOREIGN KEY (AREAID) REFERENCES AREACITY (AREAID));



CREATE TABLE DEPARTMENTS(
DNO int not null identity(1,1) primary key,
DNAME VARCHAR(100),
AREAID int,
SHOPID int,
CONSTRAINT DEPARTMENTINSHOP_FK FOREIGN KEY (SHOPID) REFERENCES SHOP (SHOPID),
CONSTRAINT DEPARTMENTINAREACITY_FK FOREIGN KEY (AREAID) REFERENCES AREACITY (AREAID));



CREATE TABLE JOBS(
JOBID int not null identity(1,1) primary key,
DNO int,
EMPJOB VARCHAR(100),
AREAID int,
SHOPID int,
CONSTRAINT JOBINAREACITY_FK FOREIGN KEY (AREAID) REFERENCES AREACITY (AREAID),
CONSTRAINT JOBINSHOP_FK FOREIGN KEY (SHOPID) REFERENCES SHOP (SHOPID)
)


CREATE TABLE EMPLOYEES(
EMPID int not null identity(1,1) primary key,
DNO int,
JOBID int,
SHOPID int,
EMPNAME VARCHAR(100),
EMPSALARY float,
MOBILENUMBER VARCHAR(100),
HIREDATE DATE,
ADDRESS VARCHAR(500),
EMPEMAILADDRESS VARCHAR(100),
TELEPHONENUMBER VARCHAR(100),
EMPUSERNAME VARCHAR(100),
EMPPASSWORD VARCHAR(64),
CONSTRAINT EMPINSHOP_FK FOREIGN KEY (SHOPID) REFERENCES SHOP (SHOPID),
CONSTRAINT EMPINDEPARTMENT_FK FOREIGN KEY (DNO) REFERENCES DEPARTMENTS (DNO),
CONSTRAINT EMPJOB_FK FOREIGN KEY (JOBID) REFERENCES JOBS (JOBID)

) 


CREATE TABLE CUSTOMERS(
CUSTOMERID int not null identity(1,1) primary key,
SHOPID int,
CUSTOMERNAME VARCHAR(100),
CUSTOMEREMAILADDRESS VARCHAR(100),
MOBILENUMBER VARCHAR(100),
ADDRESS VARCHAR(500),
CONSTRAINT CUSTOMERINSHOP_FK FOREIGN KEY (SHOPID) REFERENCES SHOP (SHOPID));



CREATE TABLE CATEGORIES(
CATEGORYID  int not null identity(1,1) primary key,
CATEGORY VARCHAR(max)

)

CREATE TABLE SUBCATEGORIES(
SUBCATEGORYID  int not null identity(1,1) primary key,
CATEGORYID int,
SUBCATEGORY VARCHAR(max),
CONSTRAINT SUBCATEGORYOFCATEGORY_FK FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES (CATEGORYID));




CREATE TABLE MANUFACTURERS(
MANUFACTURERID  int not null identity(1,1) primary key,
MANUFACTURERNAME VARCHAR(max),
MANUFACTUREREMAILADDRESS VARCHAR(max),
MANUFACTURERTELEPHONENUMBER VARCHAR(max),
MANUFACTURERADDRESS VARCHAR(max),
MANUFACTURERMOBILENUMBER VARCHAR(max)
)


CREATE TABLE PRODUCTS
   (	 PRODUCTID int not null identity(1,1) primary key,
	MANUFACTURERID int, 
	SHOPID int,
	CATEGORYID int,
	SUBCATEGORYID int,	
	PRODUCTNUMBER VARCHAR(500),
	PRODUCTNAME VARCHAR(300),
    PRODUCTDESCRIPTION VARCHAR(max), 	
	UNITPRICE FLOAT, 
	QUANTITYINSTOCK int, 
	PRODUCTSIZE VARCHAR(100), 
	PRODUCTCOLOR VARCHAR(100),
    PRODUCTWARRANTY VARCHAR(100),
	
CONSTRAINT PRODUCTOFMANUFACTURER_FK FOREIGN KEY (MANUFACTURERID) REFERENCES MANUFACTURERS (MANUFACTURERID),	
CONSTRAINT PRODUCTINSHOP_FK FOREIGN KEY (SHOPID) REFERENCES SHOP (SHOPID),
CONSTRAINT PRODUCTCATEGORY_FK FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES (CATEGORYID),
CONSTRAINT PRODUCTSUBCATEGORY_FK FOREIGN KEY (SUBCATEGORYID) REFERENCES SUBCATEGORIES (SUBCATEGORYID))



CREATE TABLE BILL(
BILLID int not null identity(1,1) primary key,
SHOPID int,
CUSTOMERID int,
BILLAMOUNT double precision,
BILLDATE varchar(max),
CONSTRAINT BILLINWHICHSHOP_FK FOREIGN KEY (SHOPID) REFERENCES SHOP (SHOPID),
CONSTRAINT BILLOFWHICHCUSTOMER_FK FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS (CUSTOMERID))




CREATE TABLE PRODUCTSBOUGHT(
PRODUCTBOUGHTID int not null identity(1,1) primary key,
BILLID int,
PRODUCTID int,
PRODUCTBOUGHTQUANTITY int,
PRODUCTCHARGES double precision,
CONSTRAINT PRODUCTBOUGHTBILL_FK FOREIGN KEY (BILLID) REFERENCES BILL (BILLID),
CONSTRAINT PRODUCTBOUGHTID_FK FOREIGN KEY (PRODUCTID) REFERENCES PRODUCTS (PRODUCTID))






























