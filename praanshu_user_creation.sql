-- Creates the login AbolrousHazem with password '340$Uuxwp7Mcxo7Khy'.  
CREATE LOGIN Praanshu
    WITH PASSWORD = 'Grover@123';
GO

-- Creates a database user for the login created above.
CREATE USER Praanshu FOR LOGIN Praanshu;
GO