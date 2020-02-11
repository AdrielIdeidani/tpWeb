/*EVENTOS*/
insert into evento (Fecha, Descripcion) values
('20191001', 'El mejor evento de todos'),
('20191010', 'El 2do mejor evento de todos'),
('20191020', 'El 3er mejor evento de todos'),
('20191030', 'El 4to mejor evento de todos'),
('20191110', 'El 5to mejor evento de todos'),
('20191120', 'Este es bien malo'),
('20191130', 'Eventos eran los de antes...');

/*Para ver los elementos*/
select * from evento order by Fecha desc ;

/*Para reiniciar la tabla*/
truncate evento;

