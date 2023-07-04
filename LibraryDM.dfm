object LibDataModule: TLibDataModule
  Height = 471
  Width = 1000
  PixelsPerInch = 120
  object fdmemAuthor: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 105
    object fdmemAuthorid: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'id'
    end
    object fdmemAuthorfull_name: TStringField
      DisplayLabel = 'Full Name'
      FieldName = 'full_name'
    end
    object fdmemAuthordate_of_birth: TDateField
      DisplayLabel = 'Date of Birth'
      FieldName = 'date_of_birth'
    end
  end
  object dsAuthor: TDataSource
    DataSet = fdmemAuthor
    Left = 48
    Top = 193
  end
end
