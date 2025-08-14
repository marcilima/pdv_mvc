unit pdvmvc.dependencycontainer.utils.impl;

interface

uses
  Generics.Collections, SysUtils, pdvmvc.model.entity.interfaces,
  pdvmvc.pedido.model.entity.impl, pdvmvc.pedidoitem.model.entity.impl,
  pdvmvc.produto.model.entity.impl, pdvmvc.cliente.model.entity.impl;

type
  TDependencyContainer = class
  private
    FRegistry: TDictionary<TGUID, TFunc<IInterface>>;
    constructor Create;
    destructor Destroy; override;
    procedure RegistrarDependencias;
  public
    class procedure New;
    procedure RegisterType<T: IInterface>(FactoryMethod: TFunc<IInterface>);
    function Resolve<T: IInterface>: T;

  end;

var
  Container: TDependencyContainer;

implementation

uses
  System.TypInfo;

constructor TDependencyContainer.Create;
begin
  FRegistry := TDictionary<TGUID, TFunc<IInterface>>.Create;
end;

destructor TDependencyContainer.Destroy;
begin
  FRegistry.Free;
  inherited;
end;

class procedure TDependencyContainer.New;
begin
  Container := TDependencyContainer.Create;
  Container.RegistrarDependencias;
end;

procedure TDependencyContainer.RegisterType<T>(FactoryMethod: TFunc<IInterface>);
var
  GUID: TGUID;
begin
  GUID := GetTypeData(TypeInfo(T))^.GUID;
  FRegistry.Add(GUID, FactoryMethod);
end;

procedure TDependencyContainer.RegistrarDependencias;
begin
  Container.RegisterType<IPedido>(
  function: IInterface
  begin
    Result := TPedido.New;
  end
  );

  Container.RegisterType<IPedidoItem>(
  function: IInterface
  begin
    Result := TPedidoItem.New;
  end
  );

  Container.RegisterType<IProduto>(
  function: IInterface
  begin
    Result := TProduto.New;
  end
  );

  Container.RegisterType<ICliente>(
  function: IInterface
  begin
    Result := TCliente.New;
  end
  );

end;

function TDependencyContainer.Resolve<T>: T;
var
  GUID: TGUID;
  FactoryMethod: TFunc<IInterface>;
begin
  GUID := GetTypeData(TypeInfo(T))^.GUID;
  if not FRegistry.TryGetValue(GUID, FactoryMethod) then
    raise Exception.CreateFmt('Dependency not registered for %s', [GUIDToString(GUID)]);

  Result := T(FactoryMethod());
end;

end.
