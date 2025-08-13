object FrmListaDados: TFrmListaDados
  Left = 0
  Top = 0
  Caption = 'FrmListaDados'
  ClientHeight = 335
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object dbgListaDados: TDBGrid
    Left = 0
    Top = 49
    Width = 733
    Height = 245
    Align = alClient
    DataSource = dsListaDados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgListaDadosDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 49
    Align = alTop
    TabOrder = 1
    object lblListaDe: TLabel
      Left = 16
      Top = 6
      Width = 94
      Height = 32
      Caption = 'Lista de '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAtualizar: TButton
      Left = 640
      Top = 13
      Width = 81
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = btnAtualizarClick
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 294
    Width = 733
    Height = 41
    Align = alBottom
    Caption = '**Para selecionar o Registro Clique duas Vezes no Grid**'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object dsListaDados: TDataSource
    Left = 200
    Top = 168
  end
end
