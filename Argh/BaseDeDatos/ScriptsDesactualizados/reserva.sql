insert into reserva (idReserva, cantidadPersonas, nombreReserva, hora) values
('1','3','Manuel Perez','203000'),
('2','5','Gabriel Marquez','213000'),
('3','8','Sofía Pachano','210000'),
('4','7','Mercedes Benz','223000'),
('5','5','Joaquín Echeverría','203000');

/*Para ver los elementos*/
select * from reserva order by idReserva asc ;

/*Para reiniciar la tabla*/
truncate reserva;