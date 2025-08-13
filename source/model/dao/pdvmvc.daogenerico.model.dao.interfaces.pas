unit pdvmvc.daogenerico.model.dao.interfaces;

interface

uses
  Data.DB, pdvmvc.connection.model.interfaces;
type
  IDAOGenerico = interface
    ['{0D3BCEA3-E0E7-4C66-BDE8-DD3E43628057}']
    function FindByAll: TDataSet;
    function FindById: TDataSet;

    procedure Delete;
    procedure Update;
    function Insert: IDAOGenerico;
    function GetId: Integer;

    function GetConexao: IConnection;
  end;

implementation

end.
