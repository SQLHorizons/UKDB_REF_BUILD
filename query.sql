USE [master]

CREATE EVENT SESSION [tls] ON SERVER
ADD EVENT sqlsni.trace(
    ACTION(sqlserver.client_connection_id)
WHERE ([sqlserver].[like_i_sql_unicode_string]([text],N'%Handshake%')))
WITH (STARTUP_STATE=ON)
GO

ALTER EVENT SESSION [tls] ON SERVER
STATE = start;
