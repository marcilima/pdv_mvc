object FrmCliente: TFrmCliente
  Left = 0
  Top = 0
  Caption = 'FrmCliente'
  ClientHeight = 206
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 11
    Top = 83
    Width = 37
    Height = 15
    Caption = 'Cidade'
  end
  object Label2: TLabel
    Left = 360
    Top = 83
    Width = 14
    Height = 15
    Caption = 'UF'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 24
    Width = 401
    Height = 49
    Caption = 'Cliente'
    TabOrder = 0
    object edtCodigoCliente: TEdit
      Left = 3
      Top = 16
      Width = 65
      Height = 23
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeCliente: TEdit
      Left = 74
      Top = 16
      Width = 311
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  object edtCidade: TEdit
    Left = 11
    Top = 104
    Width = 343
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edtUF: TEdit
    Left = 360
    Top = 104
    Width = 49
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object btnCancelar: TButton
    Left = 253
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
  end
  object btnSalvar: TButton
    Left = 334
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
end
