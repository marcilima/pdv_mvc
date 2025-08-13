unit pdvmvc.produto.model.entity.impl;

interface

uses
  pdvmvc.model.entity.interfaces,
  pdvmvc.rttiatributo.utils;

type
  [Tabela('PRODUTO')]
  TProduto = class(TInterfacedObject, IProduto)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;

    [Campo('DESCRICAO')]
    FDescricao: string;

    [Campo('PRECOVENDA')]
    FPrecoVenda: Currency;

    procedure SetCodigo(const AValue: Integer);
    function GetCodigo: Integer;

    procedure SetDescricao(const AValue: string);
    function GetDescricao: string;

    procedure SetPrecoVenda(const AValue: Currency);
    function GetPrecoVenda: Currency;

  public
    class function New: IProduto;
  end;
implementation

{ TProduto }

function TProduto.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProduto.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TProduto.GetPrecoVenda: Currency;
begin
  Result := FPrecoVenda;
end;

class function TProduto.New: IProduto;
begin
  Result := Self.Create;
end;

procedure TProduto.SetCodigo(const AValue: Integer);
begin
  FCodigo := AValue;
end;

procedure TProduto.SetDescricao(const AValue: string);
begin
  FDescricao := AValue;
end;

procedure TProduto.SetPrecoVenda(const AValue: Currency);
begin
  FPrecoVenda := AValue;
end;

end.
