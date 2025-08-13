unit pdvmvc.firedac.connection.model.impl;

interface

uses
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  pdvmvc.connection.model.interfaces, pdvmvc.configuration.connection.model.impl;

type
  TConnectionFiredac = class(TInterfacedObject, IConnection)
  private
    FConn: TFDConnection;
    FConfig: IConfiguration;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: IConnection;
    function Connection: TCustomConnection;
    procedure StartTransaction;
    procedure CommitTrasaction;
    procedure RollBackTransaction;
  end;

implementation

uses
  System.SysUtils;

{ TConnectionFiredac }

procedure TConnectionFiredac.CommitTrasaction;
begin
  FConn.Commit;
end;

function TConnectionFiredac.Connection: TCustomConnection;
begin
  Result := FConn;
end;

constructor TConnectionFiredac.Create;
var
  LArqIni, LCaminhoExe: string;
begin
  FConn := TFDConnection.Create(nil);

  LCaminhoExe := ExtractFilePath(ParamStr(0));
  LArqIni := LCaminhoExe+'conf.ini';
  FConfig := TConfiguration.New(LArqIni);

  if not FileExists(LArqIni) then
  begin
    FConfig.SetCaminho(LCaminhoExe+'db\dados.sdb');
    FConfig.SetDriverName('SQLite');
  end;

  try

    FConn.Params.Clear;
    FConn.Params.DriverID := FConfig.GetDriverName;
    FConn.Params.Database := FConfig.GetCaminho;
    FConn.Params.UserName := FConfig.GetUsuario;
    FConn.Params.Password := FConfig.GetSenha;

    if FConfig.GetDriverName.Equals('SQLite') then
      FConn.Params.Add('LockingMode=Normal');

  except
    raise Exception.Create('Error ao tentar conectar ao banco!');

  end;
end;

destructor TConnectionFiredac.Destroy;
begin
  FConn.Free;
  inherited;
end;

class function TConnectionFiredac.New: IConnection;
begin
  Result := Self.Create;
end;

procedure TConnectionFiredac.RollBackTransaction;
begin
  FConn.Rollback;
end;

procedure TConnectionFiredac.StartTransaction;
begin
  FConn.StartTransaction;
end;

end.
