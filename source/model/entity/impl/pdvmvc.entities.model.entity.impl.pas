unit pdvmvc.entities.model.entity.impl;

interface

{uses pdvmvc.model.entity.interfaces, pdvmvc.cliente.model.entity.impl,
  pdvmvc.pedidoitem.model.entity.impl, pdvmvc.produto.model.entity.impl,
  pdvmvc.pedido.model.entity.impl, pdvmvc.dependencycontainer.utils.impl;

type
  TEntity = class(TInterfacedObject, IEntity)
  private
    FCliente: ICliente;
    FProduto: IProduto;
    FPedido: IPedido;
    FPedidoItem: IPedidoItem;
  public
    class function New: IEntity;

    function Cliente: ICliente;
    function Produto: IProduto;
    function Pedido: IPedido;
    function PedidoItem: IPedidoItem;
  end;
           }
implementation
            {


function TEntity.Cliente: ICliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCliente.New;

  Result := FCliente;
end;

class function TEntity.New: IEntity;
begin
  Result := Self.Create;
end;

function TEntity.Pedido: IPedido;
begin
  if not Assigned(FPedido) then
    FPedido := Container.Resolve<IPedido>;

  Result := FPedido;
end;

function TEntity.PedidoItem: IPedidoItem;
begin
  if not Assigned(FPedidoItem) then
    FPedidoItem := TPedidoItem.New;

  Result := FPedidoItem;
end;

function TEntity.Produto: IProduto;
begin
  if not Assigned(FProduto) then
    FProduto := TProduto.New;

  Result := FProduto;
end;
   }
end.
