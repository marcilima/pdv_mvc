object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedido de Venda'
  ClientHeight = 633
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object lblPedidoItens: TLabel
    Left = 8
    Top = 215
    Width = 144
    Height = 30
    Caption = 'Itens do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 344
    Top = 152
    Width = 62
    Height = 15
    Caption = 'Quantidade'
  end
  object Label5: TLabel
    Left = 455
    Top = 152
    Width = 71
    Height = 15
    Caption = 'Valor Unit'#225'rio'
  end
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 101
    Height = 15
    Caption = 'N'#250'mero do Pedido'
  end
  object dbgPedidoItens: TDBGrid
    Left = 8
    Top = 251
    Width = 890
    Height = 120
    DataSource = dsPedidoItens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgPedidoItensDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_PRODUTO'
        Title.Caption = 'C'#243'd. Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Caption = 'Quantidade'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORUNITARIO'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORTOTAL'
        Title.Caption = 'Valor Total'
        Width = 116
        Visible = True
      end>
  end
  object btnAdicionar: TButton
    Left = 582
    Top = 172
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 1
    OnClick = btnAdicionarClick
  end
  object edtQuantidade: TEdit
    Left = 344
    Top = 173
    Width = 105
    Height = 23
    TabOrder = 2
    Text = '1'
  end
  object edtValorUnitario: TEdit
    Left = 455
    Top = 173
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '12,50'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 154
    Width = 330
    Height = 55
    Caption = 'Produto '
    TabOrder = 4
    object edtCodigoProduto: TEdit
      Left = 3
      Top = 19
      Width = 41
      Height = 23
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeProduto: TEdit
      Left = 50
      Top = 19
      Width = 175
      Height = 23
      ReadOnly = True
      TabOrder = 1
    end
    object btnBuscarProduto: TButton
      Left = 231
      Top = 19
      Width = 86
      Height = 25
      Caption = 'Buscar Produto'
      TabOrder = 2
      OnClick = btnBuscarProdutoClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 86
    Width = 441
    Height = 60
    Caption = 'Cliente'
    TabOrder = 5
    object sbLimparCliente: TSpeedButton
      Left = 314
      Top = 18
      Width = 23
      Height = 22
      Caption = 'X'
      OnClick = sbLimparClienteClick
    end
    object edtCodigoCliente: TEdit
      Left = 3
      Top = 18
      Width = 55
      Height = 23
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      OnChange = edtCodigoClienteChange
    end
    object edtNomeCliente: TEdit
      Left = 64
      Top = 18
      Width = 249
      Height = 23
      ReadOnly = True
      TabOrder = 1
    end
    object btnBuscarCliente: TButton
      Left = 343
      Top = 19
      Width = 86
      Height = 25
      Caption = 'Buscar Cliente'
      TabOrder = 2
      OnClick = btnBuscarClienteClick
    end
  end
  object pnlAcoes: TPanel
    Left = 0
    Top = 592
    Width = 1056
    Height = 41
    Align = alBottom
    TabOrder = 6
    object btnCadastrarProduto: TButton
      Left = 904
      Top = 8
      Width = 137
      Height = 25
      Caption = 'Cadastrar Produto'
      TabOrder = 0
      OnClick = btnCadastrarProdutoClick
    end
    object btnCadastrarCliente: TButton
      Left = 761
      Top = 8
      Width = 137
      Height = 25
      Caption = 'Cadastrar Cliente'
      TabOrder = 1
      OnClick = btnCadastrarClienteClick
    end
    object btnCancelarPedido: TButton
      Left = 115
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Cancelar Pedido'
      TabOrder = 2
      OnClick = btnCancelarPedidoClick
    end
    object btnSalvarPedido: TButton
      Left = 12
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Salvar Pedido'
      TabOrder = 3
      OnClick = btnSalvarPedidoClick
    end
  end
  object edtNumeroPedido: TEdit
    Left = 8
    Top = 57
    Width = 121
    Height = 23
    ReadOnly = True
    TabOrder = 7
  end
  object btnBuscarPedido: TButton
    Left = 135
    Top = 55
    Width = 82
    Height = 25
    Caption = 'Buscar Pedido'
    TabOrder = 8
    OnClick = btnBuscarPedidoClick
  end
  object btnExcluirItem: TButton
    Left = 904
    Top = 251
    Width = 88
    Height = 25
    Caption = 'Excluir Item'
    TabOrder = 9
    OnClick = btnExcluirItemClick
  end
  object DBLabeledEdit1: TDBLabeledEdit
    Left = 777
    Top = 408
    Width = 121
    Height = 23
    DataField = 'TOTALITENS'
    DataSource = dsPedidoItens
    ReadOnly = True
    TabOrder = 10
    EditLabel.Width = 66
    EditLabel.Height = 15
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Total Pedido'
    EditLabel.ParentBiDiMode = False
  end
  object btnAlterarItem: TButton
    Left = 904
    Top = 291
    Width = 88
    Height = 25
    Caption = 'Alterar Item'
    TabOrder = 11
    OnClick = btnAlterarItemClick
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 840
    Top = 16
  end
  object dsPedidoItens: TDataSource
    DataSet = mTblItens
    Left = 632
    Top = 16
  end
  object mTblItens: TFDMemTable
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 536
    Top = 16
    object mTblItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object mTblItensNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object mTblItensCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
    object mTblItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object mTblItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object mTblItensVALORUNITARIO: TCurrencyField
      FieldName = 'VALORUNITARIO'
    end
    object mTblItensVALORTOTAL: TCurrencyField
      FieldName = 'VALORTOTAL'
    end
    object mTblItensTOTALITENS: TAggregateField
      FieldName = 'TOTALITENS'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALORTOTAL)'
    end
  end
end
