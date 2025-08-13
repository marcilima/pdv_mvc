unit pdvmvc.rttiatributo.utils;

interface

uses
  System.Rtti;

type
  Campo = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(AName: string);
    destructor Destroy; override;

    property Name: string read FName write FName;
  end;

  Tabela = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(AName: string);
    destructor Destroy; override;

    property Name: string read FName write FName;
  end;

  PK = class(TCustomAttribute)
  end;

  FK = class(TCustomAttribute)
  end;

implementation

{ Campo }

constructor Campo.Create(AName: string);
begin
  FName := AName;
end;

destructor Campo.Destroy;
begin

  inherited;
end;

{ Tabela }

constructor Tabela.Create(AName: string);
begin
  FName := AName;
end;

destructor Tabela.Destroy;
begin

  inherited;
end;

end.
