
GO
CREATE PROCEDURE [dbo].[insertFactura] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Factura.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDCliente int, IDCarro int, Fecha DateTime, Cantidad int, Total money)
INSERT INTO @xmlTable SELECT IDCliente, IDCarro, Fecha, Cantidad, Total 
FROM OPENXML(@hDoc, 'dataset/Factura')
WITH 
(
IDCliente [int] '@IDCliente',
IDCarro [int] '@IDCarro',
Fecha [DateTime] '@Fecha',
Cantidad [int] '@Cantidad',
Total [money] '@Total'
);

DECLARE @IDCliente int, @IDCarro int, @Fecha DateTime, @Cantidad int, @Total money
DECLARE cursorTabla cursor GLOBAL for SELECT IDCliente, IDCarro, Fecha, Cantidad, Total  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDCliente, @IDCarro, @Fecha, @Cantidad, @Total 
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Factura WHERE IDCarro = @IDCarro AND IDCliente = @IDCliente) 
    BEGIN
        INSERT INTO dbo.Factura VALUES (@IDCliente, @IDCarro, @Fecha, @Cantidad, @Total)
    END
	
    FETCH cursorTabla INTO @IDCliente, @IDCarro, @Fecha, @Cantidad, @Total 
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

