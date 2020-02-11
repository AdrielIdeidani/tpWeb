/*EVENTOS*/
insert into mozo (idMozo, apellido, nombre) values
('1','Shocron','Hernan'),
('2','Sofovich','Gerardo'),
('3','Suarez','Miguel'),
('4','Del Caño','Nicolas'),
('5','Fernandez','Alberto');

/*Para ver los elementos*/
select * from mozo order by idMozo asc ;

/*Para reiniciar la tabla*/
truncate evento;