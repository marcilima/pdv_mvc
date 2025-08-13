unit pdvmvc.query.utils.impl;

interface

uses
  pdvmvc.utils.interfaces,
  System.Generics.Collections;

type
  TQueryUtils = class(TInterfacedObject, IQueryUtils)
  private
    FParent: TObject;
    function Fields: string;
    function Params: string;
    function NomeTabela: string;
    function Where: String;
    function FieldParamsUpdate: String;

    constructor Create(AParent: IInterface);
    destructor Destroy; override;
  public
    class function New(AParent: IInterface): IQueryUtils;

    procedure FieldParameter(var AValue: TDictionary<String, Variant>);
    function CampoPK: string;
    function IdPrenchido: Boolean;

    function GerarSqlInsert: string;
    function GerarSqlUpdate: string;
    function GerarSqlDelete: string;
    function GerarSqlSelect: string;

  end;

implementation

uses
  System.Rtti,
  System.SysUtils,
  pdvmvc.rttihelper.utils,
  pdvmvc.rttiatributo.utils;

{ TQuery }

function TQueryUtils.CampoPK: string;
var
  LContexto: TRttiContext;
  LTipo: TRttiType;
begin
  Result := '';

  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(FParent.ClassInfo);

    for var I in LTipo.GetFields do
    begin
      if not (I.Tem<Campo> and I.Tem<PK>)then
        Break;

      Result := I.GetAttribute<Campo>.Name;
    end;

  finally
    LContexto.Free;
  end;


end;

constructor TQueryUtils.Create(AParent: IInterface);
begin
  FParent := TObject(AParent);
end;

function TQueryUtils.GerarSqlDelete: string;
begin
  Result := 'DELETE FROM ' + NomeTabela + ' WHERE ' + Where;
end;

destructor TQueryUtils.Destroy;
begin
  inherited;
end;

procedure TQueryUtils.FieldParameter(var AValue: TDictionary<String, Variant>);
var
  LContexto: TRttiContext;
  LTipo: TRttiType;
begin
  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(FParent.ClassInfo);

    for var I in LTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64:
          begin
            if not (I.GetValue(FParent).AsInteger <= 0) then
              AValue.Add(I.GetAttribute<Campo>.Name, I.GetValue(FParent).AsInteger);
          end;
        tkFloat:
          begin
            if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
              AValue.Add(I.GetAttribute<Campo>.Name, StrToDateTime(I.GetValue(FParent).ToString));

            if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
              AValue.Add(I.GetAttribute<Campo>.Name, I.GetValue(FParent).AsCurrency);
          end;

        tkLString, tkWString, tkUString, tkString:
          begin
            if not I.GetValue(FParent).AsString.IsEmpty then
              AValue.Add(I.GetAttribute<Campo>.Name, I.GetValue(FParent).AsString);
          end;
        else
          AValue.Add(I.GetAttribute<Campo>.Name, I.GetValue(FParent).AsString);
      end;
    end;
  finally
    LContexto.Free;
  end;

end;

function TQueryUtils.FieldParamsUpdate: String;
var
  LContexto: TRttiContext;
  LTipo: TRttiType;
begin
  Result := '';

  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(FParent.ClassInfo);

    for var I in LTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64: begin
          if not (I.GetValue(FParent).AsInteger <= 0) then
            Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkFloat: begin
          if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';

          if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
            Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkLString,
        tkWString,
        tkUString,
        tkString: begin
          if not I.GetValue(FParent).AsString.IsEmpty then
            Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
        end;
        else
          Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 2) + ' ';
    LContexto.Free;
  end;

end;

function TQueryUtils.Fields: string;
var
  LContexto: TRttiContext;
  lTipo: TRttiType;
begin
  LContexto := TRttiContext.Create;
  try
    lTipo := LContexto.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64: begin
          if not (I.GetValue(FParent).AsInteger <= 0) then
            Result := Result + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkFloat: begin
          if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + I.GetAttribute<Campo>.Name + ', ';

          if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
            Result := Result + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkLString,
        tkWString,
        tkUString,
        tkString: begin
          if not I.GetValue(FParent).AsString.IsEmpty then
            Result := Result + I.GetAttribute<Campo>.Name + ', ';
        end;
        else
          Result := Result + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Result.Length-2);
    LContexto.Free;
  end;

end;

function TQueryUtils.GerarSqlInsert: string;
begin
  Result := 'INSERT INTO ' + NomeTabela + sLineBreak +
            '  (' + Fields + ')' + sLineBreak +
            'VALUES ' + sLineBreak +
            '  (' + Params + ') RETURNING ' + CampoPK + ';';
end;

class function TQueryUtils.New(AParent: IInterface): IQueryUtils;
begin
  Result := Self.Create(AParent);
end;

function TQueryUtils.Params: string;
var
  LCtxRtti   : TRttiContext;
  LTypRtti   : TRttiType;
  LField: TRttiField;
begin
  LCtxRtti := TRttiContext.Create;
  try
    LTypRtti := LCtxRtti.GetType(FParent.ClassInfo);
    for var I in LTypRtti.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64: begin
          if not (I.GetValue(FParent).AsInteger <= 0) then
            Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkFloat: begin
          if I.GetValue(FParent).TypeInfo = TypeInfo(TDateTime) then
              Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';

          if I.GetValue(FParent).TypeInfo = TypeInfo(Currency) then
            Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
        end;
        tkLString,
        tkWString,
        tkUString,
        tkString: begin
          if not I.GetValue(FParent).AsString.IsEmpty then
            Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
        end;
        else
          Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 2) + ' ';
    LCtxRtti.Free;
  end;

end;

function TQueryUtils.GerarSqlSelect: string;
begin
  Result := 'SELECT * FROM ' + NomeTabela;
end;

function TQueryUtils.Where: String;
var
  lCtxRtti: TRttiContext;
  lTipo: TRttiType;
begin
  Result := '';

  lCtxRtti := TRttiContext.Create;
  try
    lTipo := lCtxRtti.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<PK> then
        Continue;

      Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 4) + ' ';
    lCtxRtti.Free;
  end;

end;

function TQueryUtils.NomeTabela: string;
var
  LContexto: TRttiContext;
  LTipo: TRttiType;
begin
  Result := '';

  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(FParent.ClassInfo);

    if LTipo.Tem<Tabela> then
      Result := LTipo.GetAttribute<Tabela>.Name;

  finally
    LContexto.Free;
  end;

end;

function TQueryUtils.GerarSqlUpdate: string;
begin
  Result := 'UPDATE ' + NomeTabela +
            '  SET ' + FieldParamsUpdate +
            'WHERE ' + Where;
end;

function TQueryUtils.IdPrenchido: Boolean;
var
  LContexto: TRttiContext;
  LTipo: TRttiType;
begin
  Result := False;

  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(FParent.ClassInfo);

    for var I in LTipo.GetFields do
    begin
      if not (I.Tem<Campo> and I.Tem<PK>)then
        Break;

      case I.GetValue(FParent).TypeInfo.Kind of
        tkInteger, tkInt64:
          begin
            if not (I.GetValue(FParent).AsInteger <= 0) then
              Result := True;
          end;
      end;
    end;

  finally
    LContexto.Free;
  end;
end;

end.
