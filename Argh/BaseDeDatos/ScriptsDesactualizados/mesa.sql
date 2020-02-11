/*MESAS*/
insert into mesa (nroMesa, cantidadPersonas) values
('1', '4'),
('2', '4'),
('3', '6'),
('4', '6'),
('5', '4'),
('6', '4'),
('7', '8');

/*Para ver los elementos*/
select * from mesa order by nroMesa asc ;

/*Para reiniciar la tabla*/
truncate mesa;