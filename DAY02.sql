/*======================================================================================
               
    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
​
    UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  
​
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)
​
    FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 
​
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir şartı sağlamasını garanti eder. 
​
    DEFAULT - Herhangi bir değer atanamadığında Başlangıç değerinin atanmasını sağlar.
 ========================================================================================*/
    CREATE TABLE calisanlar
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yılmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', '', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-04-18'); 
    INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '12-04-19');
    
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    
    DELETE calisanlar
    WHERE id='10001';
    
    
    
    
    ----------------------------------------------
    -- alternatif prmiary tanımlama yöntemi
    
    CREATE TABLE calisanlar
    (
        id CHAR(5), 
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT id_pk PRIMARY KEY(id) 
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yılmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '14-04-18');
    
      
    CREATE TABLE adresler
    (
        adres_id CHAR(5),     -- REFERENCES calisanlar(id),
        sokak VARCHAR2(50),
        cadde VARCHAR2(30),
        sehir VARCHAR2(15),
        CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
    );
    
    INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
    INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
    INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','Ağa Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','Ağa Sok', '30.Cad.','Antep');
    
    -- Parent ta olmatyan bir id ye chiled da ekleme yapılamz.
   -- INSERT INTO adresler VALUES('10004','Gel Sok', '60.Cad.','Van');
    
    SELECT * FROM adresler;
    SELECT * FROM calisanlar;
    
    SELECT * FROM calisanlar,  adresler
    WHERE id = '10001'; 
    
    DROP TABLE calisanlar;
    DROP TABLE adresler;







