unit pdvmvc.configuration.connection.model.impl;

interface

uses
  System.SysUtils, StrUtils,
  IniFiles,
  pdvmvc.connection.model.interfaces;

type
  TConfiguration = class(TInterfacedObject, IConfiguration)
  private
    const
      SECTION = 'CONFIG';
      CAMINHO = 'CAMINHO';
      PORTA = 'PORTA';
      SERVIDOR = 'SERVIDOR';
      USUARIO = 'USERNAME';
      SENHA = 'PASSWORD';
      DRIVERNAME = 'DRIVERNAME';
    var
      FArq: TIniFile;
    constructor Create(AFileName: string);
    destructor Destroy; override;
  public
    class function New(AFileName: string): IConfiguration;

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

{ TConfiguration }

constructor TConfiguration.Create(AFileName: string);
begin
  FArq := TIniFile.Create(AFileName);
end;

destructor TConfiguration.Destroy;
begin
  FArq.Free;
  inherited;
end;

function TConfiguration.GetCaminho: string;
begin
  Result := FArq.ReadString(SECTION, CAMINHO, '');
end;

function TConfiguration.GetDriverName: string;
begin
   Result := FArq.ReadString(SECTION, DRIVERNAME, '');
end;

function TConfiguration.GetPorta: Integer;
begin
  Result := FArq.ReadInteger(SECTION, CAMINHO, 0);
end;

function TConfiguration.GetProtocolo: string;
begin
  Result := 'LOCAL';

  if MatchStr(FArq.ReadString(SECTION, SERVIDOR, '').ToUpper, ['LOCALHOST', '127.0.0.1']) then
    Result := 'TCP';

end;

function TConfiguration.GetSenha: string;
begin
  Result := FArq.ReadString(SECTION, SENHA, '')
end;

function TConfiguration.GetServidor: string;
begin
  Result := FArq.ReadString(SECTION, SERVIDOR, '')
end;

function TConfiguration.GetUsuario: string;
begin
  Result := FArq.ReadString(SECTION, USUARIO, '')
end;

class function TConfiguration.New(AFileName: string): IConfiguration;
begin
  Result := Self.Create(AFileName);
end;

function TConfiguration.SetCaminho(const AValue: string): IConfiguration;
begin
  FArq.WriteString(SECTION, CAMINHO, AValue);
  Result := Self;
end;

function TConfiguration.SetDriverName(const AValue: string): IConfiguration;
begin
  FArq.WriteString(SECTION, DRIVERNAME, AValue);
  Result := Self;
end;

function TConfiguration.SetPorta(const AValue: Integer): IConfiguration;
begin
  FArq.WriteInteger(SECTION, PORTA, AValue);
  Result := Self;
end;

function TConfiguration.SetSenha(const AValue: string): IConfiguration;
begin
  FArq.WriteString(SECTION, SENHA, AValue);
  Result := Self;
end;

function TConfiguration.SetServidor(const AValue: string): IConfiguration;
begin
  FArq.WriteString(SECTION, SERVIDOR, AValue);
  Result := Self;
end;

function TConfiguration.SetUsuario(const AValue: string): IConfiguration;
begin
  FArq.WriteString(SECTION, USUARIO, AValue);
  Result := Self;
end;

end.
