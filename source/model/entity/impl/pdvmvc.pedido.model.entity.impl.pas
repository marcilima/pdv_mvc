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

    procedure AdicionarItem(AItem: IPedidoItem);
    procedure RemoverItem(AItem: IPedidoItem);
    //procedure PreencherDataSetItens(ADataSet: TDataSet);

    function GetItens: TList<IPedidoItem>;
  end;

implementation

{ TPedido }

procedure TPedido.AdicionarItem(AItem: IPedidoItem);
begin

  if not (AItem.CodigoProduto > 0) then
    raise Exception.Create('Informe o código do produto');

  if not (AItem.Quantidade > 0) then
    raise Exception.Create('Informe a quantidade do produto maior que zero');

  if not (AItem.ValorUnitario > 0) then
    raise Exception.Create('Informe a ValorUnitario do produto maior que zero');

  AItem.ValorTotal := AItem.Quantidade * AItem.ValorUnitario;

  FValorTotal := FValorTotal + AItem.ValorTotal;
  FItens.Add(AItem);
end;

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

function TPedido.GetItens: TList<IPedidoItem>;
begin

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

procedure TPedido.RemoverItem(AItem: IPedidoItem);
begin
  FValorTotal := FValorTotal - AItem.ValorTotal;

  FItens.Remove(AItem);
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
