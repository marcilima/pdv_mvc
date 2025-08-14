unit pdvmvc.dao.controller.interfaces;

interface

uses
  pdvmvc.daogenerico.model.dao.interfaces,
  pdvmvc.model.entity.interfaces,
  Data.DB;

type
  IDAOController = interface
    function Entity: IEntity;
    function Salvar(AValue: IInterface): IDAOGenerico;
    function FindByAll(AValue: IInterface): TDataSet;
    procedure Excluir(AValue: IInterface);
  end;
implementation

end.
