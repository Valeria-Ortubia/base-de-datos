# CONSULTAS QUERIES ML - PARTE 1 
# categorías y productos
# 1 un listado de todas las categorías
select * from categorias;
# 2 obtener un listado de categoriaNombre y descripcion
select CategoriaNombre, Descripcion from categorias;
# 3 obtener un listado de productos
select ProductoNombre from productos;
# 4 existen productos discontinuados? (discontinuado = 1)
select discontinuado from productos
where discontinuado like 1;
# 5 para el viernes hay que reunirse con el proveedor 8 . Que productos son los que provee?
select ProductoNombre from productos
where ProveedorID like 8;
# 6 queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22
select ProductoNombre from productos
where PrecioUnitario between 10 and 22;
# 7 se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. Hay productos por solicitar?
select ProductoNombre from productos
where UnidadesStock < NivelReorden;
# 8 se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero
select ProductoNombre from productos
where UnidadesStock < NivelReorden and UnidadesPedidas like 0;

# Clientes
SELECT * from productos 
where UnidadesStock < NivelReorden and UnidadesPedidas = 0;

#Clientes
#Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT Contacto, Compania, Titulo, Pais from clientes ORDER BY pais;

#Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT * from clientes where titulo = "Owner";

#El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT * from clientes where Contacto like "C%";

#Facturas
#Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT * from facturas ORDER BY FechaFactura;

#Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
SELECT * from facturas where PaisEnvio like "USA" and EnvioVia != 3;

#¿El cliente 'GOURL' realizó algún pedido?
SELECT * from facturas WHERE ClienteID = 'gourl';

#Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT * from facturas WHERE EmpleadoID in (2, 3, 5, 8, 9);

# CONSULTAS QUERIES ML PARTE 2
# PRODUCTOS
# 1 obtener el listado de todos los productos ordenados descendentemente por precio unitario 
select ProductoNombre from productos
order by PrecioUnitario desc;
# 2 obtener el listado de top 5 de productos cuyo precio es el más caro
select ProductoNombre  from productos
order by PrecioUnitario desc
limit 5;
# 3 obtener un top 10 de los productos con más unidades en stock
select  ProductoNombre from productos
order by UnidadesStock desc
limit 10;

# FacturaDetalle
# 1 obtener un listado de FacturaID, ProductoID, Cantidad
select FacturaID, ProductoID, Cantidad from facturadetalle;
# 2 ordenar el listado anterior por cantidad descendente
select FacturaID, ProductoID, Cantidad from facturadetalle
order by Cantidad desc;
# 3 filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100
select FacturaID, ProductoID, Cantidad from facturadetalle
where Cantidad between 50 and 100;
# 4 En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).
select P.ProductoID as producto, count(P.PrecioUnitario) as cantidad ,F.FacturaID NroFactura from productos as P
inner join facturadetalle as FD
on P.ProductoID = FD.ProductoID
inner join facturas as F
on FD.FacturaID = F.FacturaID
group by P.ProductoID,F.FacturaID ;