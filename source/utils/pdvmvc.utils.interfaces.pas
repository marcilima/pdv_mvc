unit pdvmvc.utils.interfaces;

interface

uses
  System.Generics.Collections;

type
  IQueryUtils = interface
    ['{C97D9C62-AB42-4379-815B-7D83FC7EF082}']
    procedure FieldParameter(var AValue: TDictionary<String, Variant>);
    function SelectWithWhere(Value: Boolean): String;
    function IdPrenchido: Boolean;
    function GerarSqlInsert: string;
    function GerarSqlUpdate: string;
    function GerarSqlDelete: string;
    function GerarSqlSelect: string;
  end;

  IUtils = interface
    ['{04294AF4-015B-4839-A1A4-9F07650FD268}']
    function QueryUtils: IQueryUtils;
  end;
implementation

end.
