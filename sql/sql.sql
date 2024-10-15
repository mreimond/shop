#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: address
#------------------------------------------------------------

CREATE TABLE address(
        id_address  Int  Auto_increment  NOT NULL ,
        number      Varchar (50) NOT NULL ,
        street      Varchar (50) NOT NULL ,
        postal_code Varchar (50) NOT NULL ,
        city        Varchar (50) NOT NULL ,
        country     Varchar (50) NOT NULL
	,CONSTRAINT address_PK PRIMARY KEY (id_address)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id_user    Int  Auto_increment  NOT NULL ,
        first_name Varchar (50) NOT NULL ,
        last_name  Varchar (50) NOT NULL ,
        email      Varchar (60) UNIQUE NOT NULL ,
        password   Varchar (255) NOT NULL ,
        phone      Varchar (15) NOT NULL
	,CONSTRAINT user_PK PRIMARY KEY (id_user)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: role
#------------------------------------------------------------

CREATE TABLE role(
        id_role Int  Auto_increment  NOT NULL ,
        name    Varchar (50) NOT NULL
	,CONSTRAINT role_PK PRIMARY KEY (id_role)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: shop
#------------------------------------------------------------

CREATE TABLE shop(
        id_shop Int  Auto_increment  NOT NULL ,
        name    Varchar (50) NOT NULL ,
        area    Float NOT NULL
	,CONSTRAINT shop_PK PRIMARY KEY (id_shop)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: sale
#------------------------------------------------------------

CREATE TABLE sale(
        id_sale      Int  Auto_increment  NOT NULL ,
        date_sale    Date NOT NULL ,
        total_amount DECIMAL (15,3)  NOT NULL ,
        id_user      Int NOT NULL
	,CONSTRAINT sale_PK PRIMARY KEY (id_sale)

	,CONSTRAINT sale_user_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: product
#------------------------------------------------------------

CREATE TABLE product(
        id_product  Int  Auto_increment  NOT NULL ,
        name        Varchar (50) NOT NULL ,
        price       DECIMAL (15,3)  NOT NULL ,
        description Text NOT NULL ,
        quantity    Varchar (50) NOT NULL
	,CONSTRAINT product_PK PRIMARY KEY (id_product)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: product_type
#------------------------------------------------------------

CREATE TABLE product_type(
        id_product_type Int  Auto_increment  NOT NULL ,
        name            Varchar (50) NOT NULL
	,CONSTRAINT product_type_PK PRIMARY KEY (id_product_type)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user_address
#------------------------------------------------------------

CREATE TABLE user_address(
        id_user    Int NOT NULL ,
        id_address Int NOT NULL
	,CONSTRAINT user_address_PK PRIMARY KEY (id_user,id_address)

	,CONSTRAINT user_address_user_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
	,CONSTRAINT user_address_address0_FK FOREIGN KEY (id_address) REFERENCES address(id_address)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user_role
#------------------------------------------------------------

CREATE TABLE user_role(
        id_role Int NOT NULL ,
        id_user Int NOT NULL
	,CONSTRAINT user_role_PK PRIMARY KEY (id_role,id_user)

	,CONSTRAINT user_role_role_FK FOREIGN KEY (id_role) REFERENCES role(id_role)
	,CONSTRAINT user_role_user0_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: shop_address
#------------------------------------------------------------

CREATE TABLE shop_address(
        id_shop    Int NOT NULL ,
        id_address Int NOT NULL
	,CONSTRAINT shop_address_PK PRIMARY KEY (id_shop,id_address)

	,CONSTRAINT shop_address_shop_FK FOREIGN KEY (id_shop) REFERENCES shop(id_shop)
	,CONSTRAINT shop_address_address0_FK FOREIGN KEY (id_address) REFERENCES address(id_address)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user_shop
#------------------------------------------------------------

CREATE TABLE user_shop(
        id_user Int NOT NULL ,
        id_shop Int NOT NULL
	,CONSTRAINT user_shop_PK PRIMARY KEY (id_user,id_shop)

	,CONSTRAINT user_shop_user_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
	,CONSTRAINT user_shop_shop0_FK FOREIGN KEY (id_shop) REFERENCES shop(id_shop)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user_product_sale
#------------------------------------------------------------

CREATE TABLE user_product_sale(
        id_user    Int NOT NULL ,
        id_product Int NOT NULL ,
        id_sale    Int NOT NULL ,
        quantity   Varchar (50) NOT NULL
	,CONSTRAINT user_product_sale_PK PRIMARY KEY (id_user,id_product,id_sale)

	,CONSTRAINT user_product_sale_user_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
	,CONSTRAINT user_product_sale_product0_FK FOREIGN KEY (id_product) REFERENCES product(id_product)
	,CONSTRAINT user_product_sale_sale1_FK FOREIGN KEY (id_sale) REFERENCES sale(id_sale)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: product_product_type
#------------------------------------------------------------

CREATE TABLE product_product_type(
        id_product_type Int NOT NULL ,
        id_product      Int NOT NULL
	,CONSTRAINT product_product_type_PK PRIMARY KEY (id_product_type,id_product)

	,CONSTRAINT product_product_type_product_type_FK FOREIGN KEY (id_product_type) REFERENCES product_type(id_product_type)
	,CONSTRAINT product_product_type_product0_FK FOREIGN KEY (id_product) REFERENCES product(id_product)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: shop_product
#------------------------------------------------------------

CREATE TABLE shop_product(
        id_product Int NOT NULL ,
        id_shop    Int NOT NULL
	,CONSTRAINT shop_product_PK PRIMARY KEY (id_product,id_shop)

	,CONSTRAINT shop_product_product_FK FOREIGN KEY (id_product) REFERENCES product(id_product)
	,CONSTRAINT shop_product_shop0_FK FOREIGN KEY (id_shop) REFERENCES shop(id_shop)
)ENGINE=InnoDB;

-- Insertion des adresses
INSERT INTO address (number, street, postal_code, city, country) VALUES
('123', 'Main St', '75001', 'Paris', 'France'),
('456', 'Rue de la Paix', '69002', 'Lyon', 'France'),
('789', 'Avenue des Champs', '06000', 'Nice', 'France'),
('101', 'Boulevard Haussmann', '75008', 'Paris', 'France'),
('202', 'Rue du Faubourg', '75010', 'Paris', 'France'),
('303', 'Place Bellecour', '69002', 'Lyon', 'France'),
('404', 'Rue Saint-Ferréol', '13001', 'Marseille', 'France'),
('606', 'Rue de Rivoli', '75001', 'Paris', 'France'),
('707', 'Cours Saleya', '06300', 'Nice', 'France'),
('808', 'Avenue Jean Médecin', '06000', 'Nice', 'France'),
('909', 'Rue de la République', '69002', 'Lyon', 'France'),
('1010', 'La Canebière', '13001', 'Marseille', 'France');

-- Insertion des utilisateurs
INSERT INTO user (first_name, last_name, email, password, phone) VALUES
('John', 'Doe', 'john.doe@example.com', 'password123', '0600000001'),
('Jane', 'Smith', 'jane.smith@example.com', 'password456', '0600000002'),
('Tom', 'Brown', 'tom.brown@example.com', 'password789', '0600000003'),
('Alice', 'Wonder', 'alice.wonder@example.com', 'password987', '0600000004'),
('Bob', 'Builder', 'bob.builder@example.com', 'password654', '0600000005'),
('Eve', 'Hacker', 'eve.hacker@example.com', 'password321', '0600000006'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'passwordabc', '0600000007'),
('Dave', 'Gamer', 'dave.gamer@example.com', 'passwordxyz', '0600000008');

-- Insertion des rôles
INSERT INTO role (name) VALUES
("Administrateur"),
('Client'),
('Vendeur'),
('Directeur'),
('Client'),
("Assistance client");

-- Insertion des magasins
INSERT INTO shop (name, area) VALUES
('TechStore', 200.5),
('BookShop', 150.0),
('GroceryStore', 300.8),
('ElectroShop', 250.5),
('BookWorld', 170.0),
('SuperStore', 350.2),
('SuperMarché', 298.1),
('ToyLand', 300.1),
('Électronique', 390.1),
('SportShop', 400.0);

-- Insertion des ventes
INSERT INTO sale (date_sale, total_amount, id_user) VALUES
('2023-10-01', 150.50, 1),
('2024-10-02', 300.75, 2),
('2024-09-03', 450.80, 3),
('2024-10-04', 500.99, 4),
('2021-10-05', 1200.75, 5),
('2024-10-06', 800.50, 1),
('2022-10-07', 230.99, 2),
('2024-10-08', 670.25, 3);

-- Insertion des produits
INSERT INTO product (name, price, description, quantity) VALUES
('Ordinateur', 999.99, 'Ordinateur portable hautes performances', '50'),
('Smartphone', 699.99, 'Smartphone dernier modèle', '200'),
('Tablette', 299.99, 'tablette 10 pouces', '150'),
('Ecouteur', 150.75, 'Casque sans fil antibruit', '100'),
('Clavier', 49.99, 'Clavier mécanique avec rétroéclairage RVB', '200'),
('Monitor', 299.99, 'Moniteur 4K de 27 pouces', '80'),
('Souris', 25.99, 'Souris ergonomique sans fil', '300'),
('Montre intelligente', 199.99, 'Montre intelligente de suivi de la condition physique', '9');

-- Insertion des types de produits
INSERT INTO product_type (name) VALUES
('Electronics'),
('Books'),
('Groceries'),
('Accessories'),
('Wearables'),
('Gaming Equipment');

-- Liaisons utilisateurs/adresses
INSERT INTO user_address (id_user, id_address) VALUES
(1, 1),
(2, 3),
(3, 3),
(4, 4), 
(5, 5), 
(6, 1), 
(7, 2),  
(8, 3); 

-- Liaisons utilisateurs/rôles
INSERT INTO user_role (id_role, id_user) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8);

-- Liaisons magasins/adresses
INSERT INTO shop_address (id_shop, id_address) VALUES
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
(6, 11),
(7, 12),
(8, 6);

-- Liaisons utilisateurs/magasins
INSERT INTO user_shop (id_user, id_shop) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3);

-- Liaisons utilisateurs/produits/ventes
INSERT INTO user_product_sale (id_user, id_product, id_sale, quantity) VALUES
(1, 1, 1, '2'),
(2, 2, 2, '1'),
(3, 3, 3, '3'),
(4, 1, 4, '2'),
(5, 2, 5, '1'),
(6, 3, 6, '5'),
(7, 4, 7, '3'),
(8, 5, 8, '4');

-- Liaisons produits/types de produits
INSERT INTO product_product_type (id_product_type, id_product) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 3),
(1, 4),
(1, 5);

-- Liaisons magasins/produits
INSERT INTO shop_product (id_product, id_shop) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 1),
(4, 2),
(5, 3);