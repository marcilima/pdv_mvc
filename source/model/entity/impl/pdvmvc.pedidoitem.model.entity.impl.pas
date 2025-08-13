unit pdvmvc.pedidoitem.model.entity.impl;

interface

uses
  pdvmvc.model.entity.interfaces,
  pdvmvc.rttiatributo.utils;

type
  [Tabela('PEDIDO_ITENS')]
  TPedidoItem = class(TInterfacedObject, IPedidoItem)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;

    [Campo('NUMERO_PEDIDO')]
    FNumeroPedido: Integer;

    [Campo('CODIGO_PRODUTO')]
    FCodigoProduto: Integer;

    [Campo('QUANTIDADE')]
    FQuantidade: Integer;

    [Campo('VALORUNITARIO')]
    FValorUnitario: Currency;

    [Campo('VALORTOTAL')]
    FValorTotal: Currency;

    procedure SetCodigo(const AValue: Integer);
    function GetCodigo: Integer;

    procedure SetNumeroPedido(const AValue: Integer);
    function GetNumeroPedido: Integer;

    procedure SetCodigoProduto(const AValue: Integer);
    function GetCodigoProduto: Integer;

    procedure SetQuantidade(const AValue: Integer);
    function GetQuantidade: Integer;

    procedure SetValorUnitario(const AValue: Currency);
    function GetValorUnitario: Currency;

    procedure SetValorTotal(const AValue: Currency);
    function GetValorTotal: Currency;
  public
    class function New: IPedidoItem;

  end;

implementation

{ TPedidoItem }

function TPedidoItem.GetCodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

function TPedidoItem.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TPedidoItem.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidoItem.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

function TPedidoItem.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TPedidoItem.GetValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

class function TPedidoItem.New: IPedidoItem;
begin
  Result := Self.Create;
end;

procedure TPedidoItem.SetCodigoProduto(const AValue: Integer);
begin
  FCodigoProduto := AValue;
end;

procedure TPedidoItem.SetCodigo(const AValue: Integer);
begin
  FCodigo := AValue;
end;

procedure TPedidoItem.SetNumeroPedido(const AValue: Integer);
begin
  FNumeroPedido := AValue;
end;

procedure TPedidoItem.SetQuantidade(const AValue: Integer);
begin
  FQuantidade := AValue;
end;

procedure TPedidoItem.SetValorTotal(const AValue: Currency);
begin
  FValorTotal := AValue;
end;

procedure TPedidoItem.SetValorUnitario(const AValue: Currency);
begin
  FValorUnitario := AValue;
end;

end.
