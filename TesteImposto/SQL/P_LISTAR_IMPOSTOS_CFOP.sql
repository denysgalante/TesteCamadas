USE [Teste]
GO
IF OBJECT_ID('dbo.P_LISTAR_IMPOSTOS_CFOP') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.P_LISTAR_IMPOSTOS_CFOP
    IF OBJECT_ID('dbo.P_LISTAR_IMPOSTOS_CFOP') IS NOT NULL
        PRINT '<<< FALHA APAGANDO A PROCEDURE dbo.P_LISTAR_IMPOSTOS_CFOP >>>'
    ELSE
        PRINT '<<< PROCEDURE dbo.P_LISTAR_IMPOSTOS_CFOP APAGADA >>>'
END
go
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON 
GO 
CREATE PROCEDURE P_LISTAR_IMPOSTOS_CFOP
AS
BEGIN
	SELECT 
		[CFOP], 
		SUM([BaseIcms]) 'Valor Total da Base de ICMS', 
		SUM([ValorIcms]) 'Valor Total do ICMS', 
		SUM([BaseIpi]) 'Valor Total da Base de IPI', 
		SUM([ValorIpi]) 'Valor Total do IPI'
	FROM 
		[dbo].[NotaFiscalItem] 
	GROUP BY 
		[CFOP] 
END
GO
GRANT EXECUTE ON dbo.P_LISTAR_IMPOSTOS_CFOP TO [public]
go
IF OBJECT_ID('dbo.P_LISTAR_IMPOSTOS_CFOP') IS NOT NULL
    PRINT '<<< PROCEDURE dbo.P_LISTAR_IMPOSTOS_CFOP CRIADA >>>'
ELSE
    PRINT '<<< FALHA NA CRIACAO DA PROCEDURE dbo.P_LISTAR_IMPOSTOS_CFOP >>>'
go