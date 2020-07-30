INSERT INTO Cars
          (VIN, Manufacturer, Model, Year, Colour)
         VALUES(222222456, 'Volkswagen', 'Tiguan', 2019, 'Blue'),
         (678554456, 'Peugeot', 'Rifter', 2019, 'Red'),
         (235667878, 'Volvo', 'V60 Cross Country', 2019, 'Gray'),
         
INSERT INTO Customers
         (Customer_ID, Name,Email, Address, City, State_Province,ZIP_code)
         VALUES (10001, 'Pablo Picasso','-', 'Paseo de la Chopera 14', 'Madrid', 'Madrid', 28045), (20001, 'Abraham Lincoln', '-',	'120 SW 8th St', 'Miami', 'Florida', 33130), (30001, 'Napoléon Bonaparte', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France','75008');

INSERT INTO Salespersons
        (Employee_ID, Name, Store)
        VALUES (00001, 'Petey Cruiser', 'Madrid'), (00002, 'Anna Sthesia', 'Barcelona'), (00003, 'Paul Molive', 'Berlin'), (00004, 'Gail Forcewind', 'Paris'), (00005, 'Paige Turner', 'Miami'), (00006, 'Bob Frapples', 'Mexico City'), (00007, 'Walter Melon', 'Amsterdam'), (00008, 'Shonda Leer', 'São Paulo');
   
INSERT INTO Invoices
      (Invoice_Nr, Date, Car, Customer, Salesperson)
      VALUES (852399038, '2018-08-22', 0, 1, 3), (731166526, '2018-12-31', 3, 0, 5), (271135104, '2019-01-22', 2, 2, 7);

# perfect
