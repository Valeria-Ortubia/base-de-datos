/*Ejercitación consultas - Bases de datos
Consultas de base de datos EMarket */
# Clientes
# 1 ¿Cuántos clientes existen?
select count(ClienteID)as cant_clientes  from clientes;

# 2 ¿Cuántos clientes hay por ciudad?
select count(ClienteID) as cant_clientes, ciudad from clientes
group by ciudad;

# Facturas
# 1 ¿Cuál es el total de transporte?
select count(transporte) as total_transporte
from facturas;

# 2 ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
select count(transporte) as total_transporte
from facturas as F
inner join correos as C
on C.CorreoID = F.EnvioVia
where c.Compania like '%EnvioVia%';

# 3 Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
select count(FacturaID) as cant_facturas, ClienteID as cliente
from facturas
group by Cliente
order by cant_facturas desc;

# 4 Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
select count(FacturaID) as cant_facturas, ClienteID as cliente
from facturas
group by Cliente
order by cant_facturas desc
limit 5;
# 5 ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
select min(CiudadEnvio) menos_frecuente, count(FacturaID) as cant_facturas from facturas
group by FacturaID
limit 1;

# 6 Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?
select  e.EmpleadoID as empleado, count(FacturaID) as cant_ventas from empleados as E
inner join facturas as F 
on E.EmpleadoID = F.EmpleadoID
group by FacturaID
order by cant_ventas;

/*Factura detalle
¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
¿Cuál es el total facturado para los productos ID entre 30 y 50?
¿Cuál es el precio unitario promedio de cada producto?
¿Cuál es el precio unitario máximo?
