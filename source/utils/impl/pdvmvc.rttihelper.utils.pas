unit pdvmvc.rttihelper.utils;

interface

uses
  System.Rtti;

type
  TRttiTypeHelper = class helper for TRttiType
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

  TRttiFieldHelper = class helper for TRttiField
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

implementation

{ TRttiTypeHelper }

function TRttiTypeHelper.GetAttribute<T>: T;
var
  LAtributo: TCustomAttribute;
begin
  Result := nil;

  for LAtributo in GetAttributes do
  begin
    if LAtributo is T then
      Exit(LAtributo as T);

  end;

end;

function TRttiTypeHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

{ TRttiFieldHelper }

function TRttiFieldHelper.GetAttribute<T>: T;
var
  LAtributo: TCustomAttribute;
begin
  Result := nil;

  for LAtributo in GetAttributes do
  begin
    if LAtributo is T then
      Exit(LAtributo as T);
  end;

end;

function TRttiFieldHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

end.
