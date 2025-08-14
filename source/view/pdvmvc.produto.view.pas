unit pdvmvc.produto.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, pdvmvc.dao.controller.impl;

type
  TFrmProduto = class(TForm)
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtPrecoVenda: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SalvarProduto;
  public
    { Public declarations }
    class procedure ShowView;
  end;

implementation

uses
  pdvmvc.connection.model.interfaces,
  pdvmvc.firedac.connection.model.impl;

{$R *.dfm}

{ TFrmProduto }

procedure TFrmProduto.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProduto.btnSalvarClick(Sender: TObject);
begin
  SalvarProduto;
end;

procedure TFrmProduto.SalvarProduto;
var
  LConexao: IConnection;
begin
  LConexao := TConnectionFiredac.New;

  var LController := TDAOController.New(LConexao);
  var LProduto := LController.Entity.Produto;

  LProduto.Descricao := edtDescricao.Text;
  LProduto.PrecoVenda := StrToCurrDef(edtPrecoVenda.Text, 0);

  LProduto.Codigo := LController.Salvar(LProduto).GetId;

  edtCodigo.Text := IntToStr(LProduto.Codigo);
end;

class procedure TFrmProduto.ShowView;
var
  LFrm: TFrmProduto;
begin
  LFrm := TFrmProduto.Create(nil);

  try
    LFrm.ShowModal;
  finally
    FreeAndNil(LFrm);
  end;

end;

end.
