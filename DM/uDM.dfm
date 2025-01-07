object DM: TDM
  Height = 111
  Width = 90
  object Conn: TFDConnection
    Params.Strings = (
      'Database=C:\GAMA\GAMA.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 24
    Top = 24
  end
end
