insert into producto (idProducto, nombreProducto, cantidadProducto, precioProducto, idEvento) values
('1','Coca Cola 1,25L','3000','78.5','1'),
('2','Pizza','1800','55','1'),
('3','Fideos con salsa','900','70','1'),
('4','Seven Up 1,25L','2000','75','1'),
('5','Hamburguesa','1800','85','2');

/*Para ver los elementos*/
select * from producto order by idProducto asc ;

/*Para reiniciar la tabla*/
truncate producto;