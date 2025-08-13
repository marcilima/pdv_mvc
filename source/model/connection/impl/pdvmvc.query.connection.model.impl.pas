unit pdvmvc.query.connection.model.impl;

interface

uses
  Data.DB,
  FireDac.Comp.Client,
  pdvmvc.connection.model.interfaces,
  System.Generics.Collections;

type

  TQuery = class(TInterfacedObject, IQuery)
  private
    FQuery: TFDQuery;

    procedure PreencherQuery(AValue: string);
    procedure PreencherParams(AValue: array of Variant);

    constructor Create(AConn: IConnection);
    destructor Destroy; override;

  public
    class function New(AConn: IConnection): IQuery;

    procedure ExeQry(const AStatement: String; const AParams: TDictionary<String, Variant>); overload;
    function OpenQry(const AStatement: String; const AParams: TDictionary<String, Variant>): TDataSet; overload;
  end;

implementation

{ TQuery }

constructor TQuery.Create(AConn: IConnection);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(AConn.Connection);
end;

destructor TQuery.Destroy;
begin
  FQuery.Free;
  inherited;
end;

class function TQuery.New(AConn: IConnection): IQuery;
begin
  Result := Self.Create(AConn);
end;

function TQuery.OpenQry(const AStatement: String;
  const AParams: TDictionary<String, Variant>): TDataSet;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(AStatement);

  for var I in AParams.Keys do
    if not (FQuery.Params.FindParam(I) = nil) then
      FQuery.ParamByName(I).Value := AParams.Items[I];

  FQuery.Open;

  Result := FQuery;
end;

procedure TQuery.PreencherParams(AValue: array of Variant);
var
  i: Integer;
begin

  for i := Low(AValue) to High(AValue) do
  begin
    FQuery.Params.Add;
    FQuery.Params[i].Value := AValue[i];
  end;

end;

procedure TQuery.PreencherQuery(AValue: string);
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(AValue);
end;

procedure TQuery.ExeQry(const AStatement: string;
  const AParams: TDictionary<string, Variant>);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(AStatement);

  for var I in AParams.Keys do
    if not (FQuery.Params.FindParam(I) = nil) then
      FQuery.ParamByName(I).Value := AParams.Items[I];

  FQuery.ExecSQL;
end;

end.
