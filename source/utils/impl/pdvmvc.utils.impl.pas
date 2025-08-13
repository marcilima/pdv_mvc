unit pdvmvc.utils.impl;

interface

uses
  pdvmvc.utils.interfaces;

type
  TUtils = class(TInterfacedObject, IUtils)
  private
    FParent: IInterface;
    FQueryUtils: IQueryUtils;
  public
    constructor Create(AParent: IInterface);
    destructor Destroy; override;
    class function New(AParent: IInterface): IUtils;
    function QueryUtils: IQueryUtils;
  end;
implementation

uses
  pdvmvc.query.utils.impl;

{ TUtils }

constructor TUtils.Create(AParent: IInterface);
begin
  FParent := AParent;
end;

destructor TUtils.Destroy;
begin

  inherited;
end;

class function TUtils.New(AParent: IInterface): IUtils;
begin
  Result := Self.Create(AParent);
end;

function TUtils.QueryUtils: IQueryUtils;
begin
  if not Assigned(FQueryUtils) then
    FQueryUtils := TQueryUtils.New(FParent);

  Result := FQueryUtils;
end;

end.
