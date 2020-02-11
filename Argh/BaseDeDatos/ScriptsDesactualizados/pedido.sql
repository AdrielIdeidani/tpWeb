/*EVENTOS*/
insert into pedido (nroPedido, estadoPedido, totalPedido, nroMesa) values
('1','COBRADO','327.5','3'),
('2','ENTREGADO','486.7','4'),
('3','LISTO','534.5','7'),
('4','PENDIENTE','110098.6','10'),
('5','PENDIENTE','12000','12');

/*Para ver los elementos*/
select * from pedido order by nroPedido asc ;

/*Para ver los pedidos que faltan cobrar*/
select * from pedido p where p.estado != 'COBRADO' order by nroPedido asc ;

/*Para reiniciar la tabla*/
truncate pedido;