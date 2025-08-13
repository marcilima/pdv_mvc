unit pdvmvc.controller.impl;

interface

uses
  pdvmvc.controller.interfaces,
  pdvmvc.model.entity.interfaces,
  pdvmvc.daogenerico.model.dao.interfaces,
  pdvmv.daogenerico.model.dao.impl,
  Data.DB;

type
  TDAOController = class(TInterfacedObject, IControllerDAO)
  private
    FEntity: IEntity;
    FDAO: IDAOGenerico;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerDAO;

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

constructor TDAOController.Create;
begin

end;

function TDAOController.Salvar(AValue: IInterface): IDAOGenerico;
begin
  if not Assigned(FDAO) then
    FDAO := TDAOGenerico.New(AValue);

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
    FDAO := TDAOGenerico.New(AValue);

  FDAO.Delete;
end;

function TDAOController.FindByAll(AValue: IInterface): TDataSet;
begin
  if not Assigned(FDAO) then
    FDAO := TDAOGenerico.New(AValue);

  Result := FDAO.FindByAll;
end;

class function TDAOController.New: IControllerDAO;
begin
  Result := Self.Create;
end;

end.
