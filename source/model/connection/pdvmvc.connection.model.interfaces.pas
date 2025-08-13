unit pdvmvc.connection.model.interfaces;

interface
uses
  Data.DB, System.Generics.Collections;

type
  IConnection = interface
    ['{B7ACDC52-979E-4AB8-879D-0164AF84FB80}']
    function Connection: TCustomConnection;
    procedure StartTransaction;
    procedure CommitTrasaction;
    procedure RollBackTransaction;
  end;

  IQuery = interface
    ['{37721041-6A37-4462-8571-A6752209DD3A}']

    procedure ExeQry(const AStatement: String; const AParams: TDictionary<String, Variant>); overload;
    function OpenQry(const AStatement: String; const AParams: TDictionary<String, Variant>): TDataSet; overload;

  end;

  IConfiguration = interface
    ['{F1BBD6E7-9082-43A7-8A01-9C17875EDD95}']
    function GetProtocolo: string;

    function SetServidor(const AValue: string): IConfiguration;
    function GetServidor: string;

    function SetPorta(const AValue: Integer): IConfiguration;
    function GetPorta: Integer;

    function SetUsuario(const AValue: string): IConfiguration;
    function GetUsuario: string;

    function SetSenha(const AValue: string): IConfiguration;
    function GetSenha: string;

    function SetCaminho(const AValue: string): IConfiguration;
    function GetCaminho: string;

    function SetDriverName(const AValue: string): IConfiguration;
    function GetDriverName: string;


  end;
implementation

end.
