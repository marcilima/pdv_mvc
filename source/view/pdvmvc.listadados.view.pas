unit pdvmvc.listadados.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  pdvmvc.dao.controller.interfaces, Vcl.ExtCtrls,
  pdvmvc.connection.model.interfaces,
  pdvmvc.firedac.connection.model.impl;

type
  TDadosExibir = (deProduto, deCliente, dePedido, dePedidoItens);
  TResult = array[0..1] of string;

  TFrmListaDados = class(TForm)
    dbgListaDados: TDBGrid;
    dsListaDados: TDataSource;
    Panel1: TPanel;
    btnAtualizar: TButton;
    lblListaDe: TLabel;
    pnlRodape: TPanel;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgListaDadosDblClick(Sender: TObject);
  private
    { Private declarations }
    FConexao: IConnection;
    FControllerDAO: IDAOController;
    procedure ListarPedidos;
    procedure ListarPedidoItens;
    procedure ListarClientes;
    procedure ListarProdutos;

  public
    { Public declarations }
    RegistroSelecionado: Boolean;
    class function ShowView(ADadosExibir: TDadosExibir): TResult;
  end;

implementation

uses
  pdvmvc.dao.controller.impl;
{$R *.dfm}

{ TFrmListaDados }

procedure TFrmListaDados.btnAtualizarClick(Sender: TObject);
begin
  dsListaDados.DataSet.Refresh;
end;

procedure TFrmListaDados.dbgListaDadosDblClick(Sender: TObject);
begin
  RegistroSelecionado := True;
  Close;
end;

procedure TFrmListaDados.FormCreate(Sender: TObject);
begin
  FConexao := TConnectionFiredac.New;
  FControllerDAO := TDAOController.New(FConexao);
end;

procedure TFrmListaDados.ListarClientes;
begin
    lblListaDe.Caption := 'Lista de Clientes';
  var LCliente := FControllerDAO.Entity.Cliente;
  dsListaDados.DataSet := FControllerDAO.FindByAll(LCliente);
end;

procedure TFrmListaDados.ListarPedidoItens;
begin
  lblListaDe.Caption := 'Lista de Itens do Pedido';
  var LPedidoItens := FControllerDAO.Entity.PedidoItem;
  dsListaDados.DataSet := FControllerDAO.FindByAll(LPedidoItens);
end;

procedure TFrmListaDados.ListarPedidos;
begin
  lblListaDe.Caption := 'Lista de Pedidos';
  var LPedido := FControllerDAO.Entity.Pedido;
  dsListaDados.DataSet := FControllerDAO.FindByAll(LPedido);

end;

procedure TFrmListaDados.ListarProdutos;
begin
  lblListaDe.Caption := 'Lista de Produtos';
  var LProduto := FControllerDAO.Entity.Produto;
  dsListaDados.DataSet := FControllerDAO.FindByAll(LProduto);
end;

class function TFrmListaDados.ShowView(ADadosExibir: TDadosExibir): TResult;
var
  LFrm: TFrmListaDados;
begin
  LFrm := TFrmListaDados.Create(nil);

  try

    case ADadosExibir of
      deProduto: LFrm.ListarProdutos;
      deCliente: LFrm.ListarClientes;
      dePedido:  LFrm.ListarPedidos;
      dePedidoItens: LFrm.ListarPedidoItens;
    end;

    LFrm.ShowModal;

    case ADadosExibir of
      deProduto:
        begin
          if LFrm.RegistroSelecionado then
          begin
            Result[0] := LFrm.dsListaDados.DataSet.FieldByName('CODIGO').AsString;
            Result[1] := LFrm.dsListaDados.DataSet.FieldByName('DESCRICAO').AsString;
          end;
        end;
      deCliente:
        begin
          if LFrm.RegistroSelecionado then
          begin
            Result[0] := LFrm.dsListaDados.DataSet.FieldByName('CODIGO').AsString;
            Result[1] := LFrm.dsListaDados.DataSet.FieldByName('NOME').AsString;
          end;
        end;
      dePedido:
        begin

          if LFrm.RegistroSelecionado then
          begin
            Result[0]:= LFrm.dsListaDados.DataSet.FieldByName('NUMEROPEDIDO').AsString;
            Result[1]:= LFrm.dsListaDados.DataSet.FieldByName('CODIGO_CLIENTE').AsString;
          end;
        end;
      dePedidoItens: ;
    end;

  finally
    FreeAndNil(LFrm);
  end;

end;

end.
