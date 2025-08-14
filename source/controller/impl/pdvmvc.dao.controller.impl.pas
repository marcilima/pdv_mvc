unit pdvmvc.dao.controller.impl;

interface

uses
  Data.DB,
  pdvmvc.dao.controller.interfaces,
  pdvmvc.model.entity.interfaces,
  pdvmvc.daogenerico.model.dao.interfaces,
  pdvmv.daogenerico.model.dao.impl,
  pdvmvc.connection.model.interfaces;

type
  TDAOController = class(TInterfacedObject, IDAOController)
  private
    FEntity: IEntity;
    FDAO: IDAOGenerico;
    FConexao: IConnection;
    constructor Create(AConexao: IConnection);
    destructor Destroy; override;
  public
    class function New(AConexao: IConnection): IDAOController;

    function Entity: IEntity;
    function Salvar(AValue: IInterface): IDAOGenerico;
    procedure Excluir(AValue: IInterface);
    function FindByAll(AValue: IInterface): TDataSet;

  end;
implementation

uses
  pdvmvc.entities.model.entity.impl,
  Vcl.Dialogs, pdvmvc.utils.impl;

{ TController }

constructor TDAOController.Create(AConexao: IConnection);
begin
  FConexao := AConexao;
end;

function TDAOController.Salvar(AValue: IInterface): IDAOGenerico;
begin
  if not Assigned(FDAO) then
    FDAO := TDAOGenerico.New(AValue, FConexao);

  if TUtils.New(AValue).QueryUtils.IdPrenchido then
    FDAO.Update
  else
    FDAO.Insert;

  Result := FDAO;
end;

destructor TDAOController.Destroy;
begin

  inherited;
end;

function TDAOController.Entity: IEntity;
begin
  if not Assigned(FEntity) then
    FEntity := TEntity.new;

  Result := FEntity;
end;

procedure TDAOController.Excluir(AValue: IInterface);
begin
  if not Assigned(FDAO) then
    FDAO := TDAOGenerico.New(AValue, FConexao);

  FDAO.Delete;
end;

function TDAOController.FindByAll(AValue: IInterface): TDataSet;
begin
  if not Assigned(FDAO) then
    FDAO := TDAOGenerico.New(AValue, FConexao);

  Result := FDAO.FindByAll;
end;

class function TDAOController.New(AConexao: IConnection): IDAOController;
begin
  Result := Self.Create(AConexao);
end;

end.
