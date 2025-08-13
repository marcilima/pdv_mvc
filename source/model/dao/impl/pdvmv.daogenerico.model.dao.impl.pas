unit pdvmv.daogenerico.model.dao.impl;

interface

uses
  Data.DB,
  pdvmvc.daogenerico.model.dao.interfaces,
  pdvmvc.connection.model.interfaces,
  System.Generics.Collections;

type
  TDAOGenerico = class(TInterfacedObject, IDAOGenerico)
  private
    FParent: IInterface;
    FConexao: IConnection;
    FQuery: IQuery;
    FLista: TDictionary<string, Variant>;
    FId: Integer;
  public
    constructor Create(AParent: IInterface);
    destructor Destroy; override;

    class function New(AParent: IInterface): IDAOGenerico;

    function GetId: Integer;

    function FindByAll: TDataSet;
    function FindById: TDataSet;
    procedure Delete;
    procedure Update;
    function Insert: IDAOGenerico;

    function GetConexao: IConnection;
  end;

implementation

uses
  pdvmvc.firedac.connection.model.impl, pdvmvc.query.connection.model.impl,
  pdvmvc.utils.impl;

constructor TDAOGenerico.Create(AParent: IInterface);
begin
  FParent := AParent;
  FConexao := TConnectionFiredac.New;
  FQuery := TQuery.New(FConexao);

  FLista := TDictionary<string, Variant>.Create;

  var LQueryUtils := TUtils.New(FParent).QueryUtils;
  LQueryUtils.FieldParameter(FLista);

end;

procedure TDAOGenerico.Delete;
begin
  var LSqlDelete := TUtils.New(FParent).QueryUtils.GerarSqlDelete;
  FQuery.ExeQry(LSqlDelete, FLista);
end;

destructor TDAOGenerico.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TDAOGenerico.FindByAll: TDataSet;
begin
  var LSqlSelect := TUtils.New(FParent).QueryUtils.GerarSqlSelect;
  Result := FQuery.OpenQry(LSqlSelect, FLista)
end;

function TDAOGenerico.FindById: TDataSet;
begin
  var LSqlSelect := TUtils.New(FParent).QueryUtils.GerarSqlInsert;
  Result := FQuery.OpenQry(LSqlSelect, FLista);
end;

function TDAOGenerico.GetConexao: IConnection;
begin
  Result := FConexao;
end;

function TDAOGenerico.GetId: Integer;
begin
  Result := FId;
end;

function TDAOGenerico.Insert: IDAOGenerico;
begin
  var LSqlInsert := TUtils.New(FParent).QueryUtils.GerarSqlInsert;
  FId := FQuery.OpenQry(LSqlInsert, FLista).Fields[0].AsInteger;

  Result := Self;
end;

class function TDAOGenerico.New(AParent: IInterface): IDAOGenerico;
begin
  Result := Self.Create(AParent);
end;

procedure TDAOGenerico.Update;
begin
  var LSqlUpdate := TUtils.New(FParent).QueryUtils.GerarSqlUpdate;
  FQuery.ExeQry(LSqlUpdate, FLista);
end;

end.
