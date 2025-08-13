object FrmProduto: TFrmProduto
  Left = 0
  Top = 0
  Caption = 'FrmProduto'
  ClientHeight = 239
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 51
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel
    Left = 8
    Top = 109
    Width = 65
    Height = 15
    Caption = 'Preco Venda'
  end
  object edtCodigo: TEdit
    Left = 79
    Top = 48
    Width = 121
    Height = 23
    ReadOnly = True
    TabOrder = 0
  end
  object edtDescricao: TEdit
    Left = 79
    Top = 77
    Width = 121
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edtPrecoVenda: TEdit
    Left = 79
    Top = 106
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object btnSalvar: TButton
    Left = 125
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 44
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
end
