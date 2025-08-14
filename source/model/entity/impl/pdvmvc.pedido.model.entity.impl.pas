unit pdvmvc.pedido.model.entity.impl;

interface

uses
  pdvmvc.model.entity.interfaces,
  pdvmvc.rttiatributo.utils, System.Generics.Collections, System.SysUtils;

type
  [Tabela('PEDIDO')]
  TPedido = class(TInterfacedObject, IPedido)
  private

    [Campo('NUMEROPEDIDO'), PK]
    FNumeroPedido: Integer;

    [Campo('CODIGO_CLIENTE')]
    FCodigoCliente: Integer;

    [Campo('DATAEMISSAO')]
    FDataEmissao: TDateTime;

    [Campo('VALORTOTAL')]
    FValorTotal: Currency;

    FItens: TList<IPedidoItem>;

    procedure SetNumeroPedido(const AValue: Integer);
    function GetNumeroPedido: Integer;

    procedure SetDataEmissao(const AValue: TDateTime);
    function GetDataEmissao: TDateTime;

    procedure SetCodigoCliente(const AValue: Integer);
    function GetCodigoCliente: Integer;

    procedure SetValorTotal(const AValue: Currency);
    function GetValorTotal: Currency;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: IPedido;

  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  FItens := TList<IPedidoItem>.Create;
end;

destructor TPedido.Destroy;
begin
  FItens.Free;
  inherited;
end;

function TPedido.GetCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedido.GetDataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

function TPedido.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedido.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

class function TPedido.New: IPedido;
begin
  Result := Self.Create;
end;

procedure TPedido.SetCodigoCliente(const AValue: Integer);
begin
  FCodigoCliente := AValue;
end;

procedure TPedido.SetDataEmissao(const AValue: TDateTime);
begin
  FDataEmissao := AValue;
end;

procedure TPedido.SetNumeroPedido(const AValue: Integer);
begin
  FNumeroPedido := AValue;
end;

procedure TPedido.SetValorTotal(const AValue: Currency);
begin
  FValorTotal := AValue;
end;

end.
