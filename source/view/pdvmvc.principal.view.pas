unit pdvmvc.principal.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, pdvmvc.cliente.model.entity.impl,
  pdvmvc.query.utils.impl, pdvmvc.controller.impl, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  Vcl.ExtCtrls,
  pdvmvc.controller.interfaces,
  pdvmvc.model.entity.interfaces, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    dbgPedidoItens: TDBGrid;
    lblPedidoItens: TLabel;
    btnAdicionar: TButton;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    edtQuantidade: TEdit;
    Label4: TLabel;
    edtValorUnitario: TEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    edtCodigoProduto: TEdit;
    edtNomeProduto: TEdit;
    GroupBox2: TGroupBox;
    edtCodigoCliente: TEdit;
    edtNomeCliente: TEdit;
    pnlAcoes: TPanel;
    btnCadastrarProduto: TButton;
    btnCadastrarCliente: TButton;
    btnCancelarPedido: TButton;
    btnSalvarPedido: TButton;
    edtNumeroPedido: TEdit;
    Label1: TLabel;
    btnBuscarPedido: TButton;
    btnBuscarCliente: TButton;
    btnBuscarProduto: TButton;
    btnExcluirItem: TButton;
    dsPedidoItens: TDataSource;
    mTblItens: TFDMemTable;
    mTblItensCODIGO_PRODUTO: TIntegerField;
    mTblItensDESCRICAO: TStringField;
    mTblItensQUANTIDADE: TIntegerField;
    mTblItensVALORUNITARIO: TCurrencyField;
    mTblItensVALORTOTAL: TCurrencyField;
    mTblItensCODIGO: TIntegerField;
    mTblItensNUMERO_PEDIDO: TIntegerField;
    DBLabeledEdit1: TDBLabeledEdit;
    mTblItensTOTALITENS: TAggregateField;
    btnAlterarItem: TButton;
    sbLimparCliente: TSpeedButton;
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnCadastrarProdutoClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnBuscarPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure btnBuscarProdutoClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarItemClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure sbLimparClienteClick(Sender: TObject);
  private
    { Private declarations }
    FPedido: IPedido;
    FRecnoItem: Integer;
    procedure PreencherDSPedidoItens(ADS: TDataSet);
    procedure GravarItensPedido;
    procedure LimparDadosPedido;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  pdvmvc.cliente.view,
  pdvmvc.produto.view,
  pdvmvc.listadados.view,
  pdvmvc.pedido.model.entity.impl;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
var
  LDSProdutos: TDataSet;
  LDescricaoProduto: string;
begin

  btnAdicionar.Caption := 'Adicionar';
  var LControllerDAO := TDAOController.New;
  var LProduto := LControllerDAO.Entity.Produto;
  LDSProdutos := TDAOController.New.FindByAll(LProduto);

  if LDSProdutos.Locate('CODIGO', StrToIntDef(edtCodigoProduto.Text, 0), []) then
      LDescricaoProduto := LDSProdutos.FieldByName('DESCRICAO').AsString;

  if FRecnoItem > 0 then
  begin
    mTblItens.RecNo := FRecnoItem;
    mTblItens.Edit;
  end
  else
    mTblItens.Append;

  mTblItens.FieldByName('CODIGO_PRODUTO').AsInteger := StrToIntDef(edtCodigoProduto.Text, 0);
  mTblItens.FieldByName('DESCRICAO').AsString := LDescricaoProduto;
  mTblItens.FieldByName('NUMERO_PEDIDO').AsInteger := StrToIntDef(edtNumeroPedido.Text, 0);
  mTblItens.FieldByName('QUANTIDADE').AsInteger := StrToIntDef(edtQuantidade.Text, 0);
  mTblItens.FieldByName('VALORUNITARIO').AsCurrency := StrToCurrDef(edtValorUnitario.Text, 0);
  mTblItens.FieldByName('VALORTOTAL').AsCurrency := mTblItens.FieldByName('QUANTIDADE').AsInteger * mTblItens.FieldByName('VALORUNITARIO').AsCurrency;
  mTblItens.Post;

  FRecnoItem := 0;

  {var LPedidoItem: IPedidoItem;
  LPedidoItem := FControllerDAO.Entity.PedidoItem;

  LPedidoItem.CodigoProduto := StrToIntDef(edtCodigoProduto.Text, 0);
  LPedidoItem.Quantidade := StrToIntDef(edtQuantidade.Text, 0);
  LPedidoItem.ValorUnitario := StrToCurrDef(edtValorUnitario.Text, 0);
  LPedidoItem.ValorTotal := LPedidoItem.Quantidade * LPedidoItem.ValorUnitario;
  try
    FPedido.AdicionarItem(LPedidoItem);

  except
    on e: Exception do
      Application.MessageBox(PChar(e.Message), 'Atenção', 48);
    
  end; }

end;

procedure TfrmPrincipal.btnAlterarItemClick(Sender: TObject);
begin
  FRecnoItem := mTblItens.RecNo;

  edtCodigoProduto.Text := mTblItens.FieldByName('CODIGO_PRODUTO').AsString;
  edtNomeProduto.Text := mTblItens.FieldByName('DESCRICAO').AsString;
  edtQuantidade.Text := mTblItens.FieldByName('QUANTIDADE').AsString;
  edtValorUnitario.Text := mTblItens.FieldByName('VALORUNITARIO').AsString;
  edtQuantidade.SetFocus;
  btnAdicionar.Caption := 'Salvar Item';
end;

procedure TfrmPrincipal.btnBuscarClienteClick(Sender: TObject);
begin
  var LRetorno := TFrmListaDados.ShowView(deCliente);

  edtCodigoCliente.Text := LRetorno[0];
  edtNomeCliente.Text := LRetorno[1];

  btnCancelarPedido.Visible := False;
end;

procedure TfrmPrincipal.btnBuscarPedidoClick(Sender: TObject);
var
  LDataSet, LDataSetCliente: TDataSet;
begin
  var LRetorno := TFrmListaDados.ShowView(dePedido);

  if LRetorno[0].IsEmpty then
    Exit;

  edtNumeroPedido.Text := LRetorno[0];
  edtCodigoCliente.Text := LRetorno[1];

  FPedido.NumeroPedido := StrToIntDef(edtNumeroPedido.Text, 0);
  FPedido.CodigoCliente := StrToIntDef(edtCodigoCliente.Text, 0);

  var LDaoController := TDAOController.New;
  var LCliente := LDaoController.Entity.Cliente;
  LDataSetCliente := LDaoController.FindByAll(LCliente);
  if LDataSetCliente.Locate('CODIGO', FPedido.CodigoCliente, []) then
    edtNomeCliente.Text := LDataSetCliente.FieldByName('NOME').AsString;


  var LControllerDAO := TDAOController.New;

  var LPedidoItens := LControllerDAO.Entity.PedidoItem;
  LDataSet := LControllerDAO.FindByAll(LPedidoItens);

  PreencherDSPedidoItens(LDataSet);

end;

procedure TfrmPrincipal.btnBuscarProdutoClick(Sender: TObject);
begin

  var LRetorno := TFrmListaDados.ShowView(deProduto);

  edtCodigoProduto.Text := LRetorno[0];
  edtNomeProduto.Text := LRetorno[1];

end;

procedure TfrmPrincipal.btnCadastrarClienteClick(Sender: TObject);
begin
  TFrmCliente.ShowView;
end;

procedure TfrmPrincipal.btnCadastrarProdutoClick(Sender: TObject);
begin
  TFrmProduto.ShowView;
end;

procedure TfrmPrincipal.btnCancelarPedidoClick(Sender: TObject);
begin


  if not (MessageDlg('Deseja Cancelar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Exit;

  mTblItens.First;
  while not mTblItens.Eof do
  begin
    var LControllerDAO :=  TDAOController.New;
    var LItem := LControllerDAO.Entity.PedidoItem;
    LItem.Codigo := mTblItens.FieldByName('CODIGO').AsInteger;

    if LItem.Codigo > 0 then
      LControllerDAO.Excluir(LItem);

     mTblItens.Next;
  end;

  var LControllerDAO :=  TDAOController.New;
  LControllerDAO.Excluir(FPedido);

  LimparDadosPedido;

  FPedido := TPedido.New;

end;

procedure TfrmPrincipal.btnExcluirItemClick(Sender: TObject);
var
  LControllerDAO: IControllerDAO;
begin
  if not (MessageDlg('Deseja Excluir o item do pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Exit;

  LControllerDAO :=  TDAOController.New;
  var LItem := LControllerDAO.Entity.PedidoItem;
  LItem.Codigo := mTblItens.FieldByName('CODIGO').AsInteger;

  if LItem.Codigo > 0 then
    LControllerDAO.Excluir(LItem);

  mTblItens.Delete;

end;

procedure TfrmPrincipal.btnSalvarPedidoClick(Sender: TObject);
begin
  var LControllerDAO := TDAOController.New;

  FPedido.CodigoCliente := StrToIntDef(edtCodigoCliente.Text, 0);
  FPedido.ValorTotal := StrToCurrDef(mTblItens.FieldByName('TOTALITENS').AsString, 0);

  if not (FPedido.NumeroPedido > 0) then
  begin
    FPedido.DataEmissao := Now;
    FPedido.NumeroPedido := LControllerDAO.Salvar(FPedido).GetId;
    edtNumeroPedido.Text := IntToStr(FPedido.NumeroPedido);
  end
  else
    LControllerDAO.Salvar(FPedido).GetId;

  GravarItensPedido;

  ShowMessage('Pedido Salvo com Sucesso!');
end;

procedure TfrmPrincipal.edtCodigoClienteChange(Sender: TObject);
begin
  if edtCodigoCliente.Text <> '' then
    btnCancelarPedido.Visible := False
  else
    btnCancelarPedido.Visible := True;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FPedido := TPedido.New;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  mTblItens.Open;
  mTblItens.EmptyDataSet;
end;

procedure TfrmPrincipal.GravarItensPedido;
var
  LId: Integer;
begin
  mTblItens.First;


  while not mTblItens.Eof do
  begin
    var LControllerDAO := TDAOController.New;
    var LItem := LControllerDAO.Entity.PedidoItem;

    LItem.Codigo := mTblItens.FieldByName('CODIGO').AsInteger;
    LItem.CodigoProduto := mTblItens.FieldByName('CODIGO_PRODUTO').AsInteger;

    LItem.NumeroPedido := FPedido.NumeroPedido;
    LItem.Quantidade := mTblItens.FieldByName('QUANTIDADE').AsInteger;
    LItem.ValorUnitario := mTblItens.FieldByName('VALORUNITARIO').AsCurrency;
    LItem.ValorTotal := mTblItens.FieldByName('VALORTOTAL').AsCurrency;
    
    LId := LControllerDAO.Salvar(LItem).GetId;

    if not (LItem.Codigo > 0) then
    begin
      mTblItens.Edit;
      mTblItens.FieldByName('CODIGO').AsInteger := LId;
      mTblItens.Post;
    end;

    mTblItens.Next;
  end;
end;

procedure TfrmPrincipal.LimparDadosPedido;
begin
  FPedido := TPedido.New;
  edtNumeroPedido.Clear;

  edtCodigoCliente.Clear;
  edtNomeCliente.Clear;

  edtCodigoProduto.Clear;
  edtNomeProduto.Clear;


  mTblItens.EmptyDataSet;
end;

procedure TfrmPrincipal.PreencherDSPedidoItens(ADS: TDataSet);
var
  LDSProdutos: TDataSet;
  LDescricaoProduto: string;

begin
  mTblItens.EmptyDataSet;
  var LControllerDAO := TDAOController.New;

  var LProduto := LControllerDAO.Entity.Produto;
  LDSProdutos := TDAOController.New.FindByAll(LProduto);

  while not ADS.Eof do
  begin


    if ADS.FieldByName('NUMERO_PEDIDO').AsInteger <> FPedido.NumeroPedido then
    begin
      ADS.Next;
      Continue;
    end;

    if LDSProdutos.Locate('CODIGO', ADS.FieldByName('CODIGO_PRODUTO').AsInteger, []) then
      LDescricaoProduto := LDSProdutos.FieldByName('DESCRICAO').AsString;

    mTblItens.Append;
    mTblItens.FieldByName('CODIGO').AsInteger := ADS.FieldByName('CODIGO').AsInteger;
    mTblItens.FieldByName('CODIGO_PRODUTO').AsInteger := ADS.FieldByName('CODIGO_PRODUTO').AsInteger;
    mTblItens.FieldByName('DESCRICAO').AsString := LDescricaoProduto;
    mTblItens.FieldByName('NUMERO_PEDIDO').AsInteger := ADS.FieldByName('NUMERO_PEDIDO').AsInteger;
    mTblItens.FieldByName('QUANTIDADE').AsInteger := ADS.FieldByName('QUANTIDADE').AsInteger;
    mTblItens.FieldByName('VALORUNITARIO').AsCurrency := ADS.FieldByName('VALORUNITARIO').AsCurrency;
    mTblItens.FieldByName('VALORTOTAL').AsCurrency := ADS.FieldByName('VALORTOTAL').AsCurrency;
    mTblItens.Post;

    ADS.Next;
  end;
end;

procedure TfrmPrincipal.sbLimparClienteClick(Sender: TObject);
begin
  edtCodigoCliente.Clear;
  edtNomeCliente.Clear;

  FPedido.CodigoCliente := 0;
end;

end.
