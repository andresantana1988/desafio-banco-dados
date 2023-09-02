-- populando as tabelas
use ecommerce;
desc clients;
insert into clients(Fname,Minit,Lname,CPF,Address)
values
('Maria','F','Silva','12345678902','Rua A 336 - Lagoa Santa '),
('João','F','Silva','12345687901','Rua B 447 - Lagoa Santa'),
('Sara','F','Silva','12345678901','Rua C 957 - Lagoa Santa'),
('Bernardo','F','Silva','12215678901','Rua D 10 - Lagoa Santa'),
('Estevão','F','Silva','12333678901','Rua F 1330 - Lagoa Santa'),
('Fernanda','F','Silva','12225678901','Rua dos Ypês 13 - Lagoa Santa'),
('Júlia','F','Silva','12345674701','Rua Valle Verde - Lagoa Santa'),
('Bruno','F','Silva','12345698901','Rua H 410 - Lagoa Santa'),
('Débora','F','Silva','12345638901','Rua Ìcaro 558 - Lagoa Santa');


-- populando a tabela de produtos
-- idProduct , Pname ,classification,category ,weight ,height ,width avaliation_note 
-- o peso é em gramas
-- as dimensões são em milímetros
insert into product (Pname ,classification_kids ,category ,weight ,height ,width,avaliation_note)
values
	('Headset',false,'Eletrônicos','150','255','100','4'),
	('Mouse',false,'Eletrônicos','50','120','0','5'),
	('Cama',false,'Móveis','50000','2100','1200','4'),
	('Fogão',false,'Linha Branca','30000','1000','1200','3'),
	('Geladeira',false,'Linha Branca','100000','2200','1250','5');
    
    -- populando a tabela de tipo de pagamento
    -- idClient ,typePayment amount 
   insert into payments (idPayment ,idClient ,typePayment, amount)
   values
   ('1','1','Cash','100'),
   ('2','1','Boleto',200),
   ('3','4','Pix','500'),
   ('4','2','Debit Card','450');
-- populando a tabela depedidos

	-- idOrderClient,orderStatus,orderDescription,sendValue,orderValue 
    insert into orders (idOrderClient,idPayment,orderStatus,orderDescription,sendValue,orderValue)
    values
    ('1','1',default,'Headset','5','95'),
    ('1','2','Confirmado','Mouse','10','190'),
    ('4','3','Pendente','Cama','25','475'),
    ('2','4','Cancelado','Cama','0',450);
    
    --  populando a tabela product order
    -- idPOproduct , idPOorder poQuantity poStatus 
    

    insert into ProductOrder
    values
    ('6','1','3',default),
    ('7','2','2',default),
    ('8','3','1',default),
    ('9','4','1',default);
    
    -- populando product storage
    insert into productStorage(storageLocation ,quantity)
    values
    ('Belo HOrizonte','1000'),
    ('São Paulo','150'),
    ('Brasília','200'),
    ('Manaus','480');
    
    select * from productStorage;
    --   populando a tabela storageLocation 
    insert  into storageLocation( idLproduct,idLstorage,location)
    VALUES
    ('6','1','MG'),
    ('7','1','SP'),
    ('8','1','DF'),
    ('9','1','AM');
    
    -- populando a tabela de fornecedores
    
   insert into supplier  (SocialName,CNPJ,contact)
   values
   ('Magazine Luiza','00000000000187','11123459866'),
   ('Travassos LTDA','00000023000187','11123169866'),
   ('Almeida e Souza','00000089000187','11123459636'),
   ('Via Sul','00000044000187','31123459866');
   
   -- product supplier 
   
   insert into productSupplier(idPsSupplier,idPsProduct,quantity)
   values
   ('1','6','50'),
   ('2','7','300'),
   ('3','8','10'),
   ('4','9','7');
   
   -- vendedores
   insert into seller(SocialName,CNPJ,CPF,contact)
	values('Maria Fernada',null,'12312345678','12345678912'),
    ('Bastos LTDA','12345678901012',null,'12347678912'),
    ('João Santos',null,'12552345678','14345678912');
    
    -- product sellers
    
    insert into productsellers(idPseller,idPproduct,prodQuantity)
    values
    ('1','6','30'),
    ('2','7','20'),
    ('1','8','5'),
    ('3','9','1');


    