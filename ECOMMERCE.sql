-- criação do banco de dados para o cenário de E-commerce
create schema ecommerce;
use ecommerce;

-- criar tabela cliente
create table  clients(
	idClient int auto_increment primary key,
	Fname varchar (10),
	Minit char(3),
	Lname varchar(20),
	CPF char(11) not null,
	Address varchar(45),
	constraint unique_cpf_client unique(CPF)
);

alter table clients auto_increment = 1;
-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
	Pname varchar(10),
	classification_kids boolean,
	category varchar(20),
	-- peso do produto, considerando a embalagem
	weight float,
	-- dimensoes do produto em milimetros
	height float,
	width float,
	avaliation_note float default 0,
	constraint  pk_idProduct unique(idProduct)
);

alter table product auto_increment = 1;
-- criar tabela de meio de pagamento
create table payments(
	idPayment int,
    idClient int,
    typePayment enum('Cash','Credit Card','Boleto','Pix','Debit Card') not null,
    amount float,
    constraint pk_payment_method primary key(idPayment,idClient)
 
    
    
);
alter table product auto_increment = 1;
-- criar tabela produto
create table orders (
	idOrder int auto_increment primary key,
	idOrderClient int,
    idPayment int,
    orderStatus enum('Cancelado','Confirmado','Pendente','Em processamento','Concluido') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float,
    orderValue Float,
    constraint fk_order_cliente foreign key (idOrderClient) references clients(idClient),
    constraint fk_order_payment foreign key (idPayment) references payments(idPayment),
    -- o valor da venda deve ser maior que zero
	check (orderValue >0),
    -- há a possibilidade de frete grátis
    check (sendValue >=0)

);
alter table orders auto_increment = 1;

-- criar tabela estoque

create table productStorage(
	idProdStorage int not null auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
       
);

alter table productStorage auto_increment = 1;
-- criar tabela cnpj
create table supplier
(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(14) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment = 1;
-- criar tabela de vendedor
create table seller(
	idSeller int auto_increment primary key,
	SocialName varchar(255) not null,
    CNPJ char(14),
    CPF char(11) ,
    contact char(11) not null,
    constraint unique_supplier_CNPJ unique (CNPJ),
    constraint unique_supplier_CPF unique (CPf)
    
);


alter table seller auto_increment = 1;
-- criar relação produto vendedor
create table productsellers(
idPseller int ,
idPproduct int,
prodQuantity int default 1,
constraint primary key(idPseller,idPproduct),
constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
constraint fk_product_product foreign key(idPproduct) references product(idProduct)

);

-- criar relação produto-vendas
create table ProductOrder(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponível','Sem estoque') default 'Disponível',
primary key (idPOproduct,idPOorder),
constraint fk_product_order_seller foreign key(idPOproduct) references product(idProduct),
constraint fk_product_order_product foreign key(idPOorder) references orders(idOrder)
);

create table storageLocation(
idLproduct int,
idLstorage int,
location varchar(255) not null,
constraint fk_product_storage_location_product foreign key(idLproduct) references product(idProduct),
constraint fk_product_storage foreign key(idLstorage) references productStorage(idProdStorage)

);

create table productSupplier(
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key(idPsSupplier,idPsProduct),
constraint fk_product_supplier_supplier foreign key(idPsSupplier) references supplier(idSupplier),
constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)
);

