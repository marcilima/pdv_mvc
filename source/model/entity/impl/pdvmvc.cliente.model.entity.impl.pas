unit pdvmvc.cliente.model.entity.impl;

interface

uses
  pdvmvc.model.entity.interfaces,
  pdvmvc.rttiatributo.utils;

type
  [Tabela('CLIENTE')]
  TCliente = class(TInterfacedObject, ICliente)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;

    [Campo('NOME')]
    FNome: string;

    [Campo('CIDADE')]
    FCidade: string;

    [Campo('UF')]
    FUF: string;

    procedure SetCodigo(const AValue: Integer);
    function GetCodigo: Integer;

    procedure SetNome(AValue: string);
    function GetNome: string;

    procedure SetCidade(AValue: string);
    function GetCidade: string;

    procedure SetUF(AValue: string);
    function GetUF: string;

  public
    class function New: ICliente;

  end;
implementation

{ TCliente }

function TCliente.GetCidade: string;
begin
  Result := FCidade;
end;

function TCliente.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TCliente.GetUF: string;
begin
  Result := FUF;
end;

function TCliente.GetNome: string;
begin
  Result := FNome;
end;

class function TCliente.New: ICliente;
begin
  Result := Self.Create;
end;

procedure TCliente.SetCidade(AValue: string);
begin
  FCidade := AValue;
end;

procedure TCliente.SetCodigo(const AValue: Integer);
begin
  FCodigo := AValue;
end;

procedure TCliente.SetUF(AValue: string);
begin
  FUF := AValue;
end;

procedure TCliente.SetNome(AValue: string);
begin
  FNome := AValue;
end;

end.
