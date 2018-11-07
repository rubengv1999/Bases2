
GO
CREATE PROCEDURE [dbo].[total] 
AS 
BEGIN
DECLARE @IDFactura  int, @Cantidad int, @Precio int;
DECLARE cursorTabla cursor GLOBAL for SELECT IDFactura, Cantidad  FROM dbo.Factura
OPEN cursorTabla
FETCH cursorTabla INTO @IDFactura , @Cantidad
WHILE(@@fetch_status=0)
BEGIN
	SELECT @Precio = C.Precio FROM dbo.Carro C
	INNER JOIN dbo.Factura F  on F.IDCarro = C.IDCarro
	WHERE F.IDFactura = @IDFactura

    UPDATE dbo.Factura SET Total = @Cantidad * @Precio WHERE IDFactura = @IDFactura
    FETCH cursorTabla INTO @IDFactura , @Cantidad
END
CLOSE cursorTabla
DEALLOCATE cursorTabla




END 

