program PDV_MVC;

uses
  Vcl.Forms,
  pdvmvc.principal.view in 'source\view\pdvmvc.principal.view.pas' {frmPrincipal},
  pdvmvc.model.entity.interfaces in 'source\model\entity\pdvmvc.model.entity.interfaces.pas',
  pdvmvc.cliente.model.entity.impl in 'source\model\entity\impl\pdvmvc.cliente.model.entity.impl.pas',
  pdvmvc.produto.model.entity.impl in 'source\model\entity\impl\pdvmvc.produto.model.entity.impl.pas',
  pdvmvc.pedidoitem.model.entity.impl in 'source\model\entity\impl\pdvmvc.pedidoitem.model.entity.impl.pas',
  pdvmvc.entities.model.entity.impl in 'source\model\entity\impl\pdvmvc.entities.model.entity.impl.pas',
  pdvmvc.pedido.model.entity.impl in 'source\model\entity\impl\pdvmvc.pedido.model.entity.impl.pas',
  pdvmvc.connection.model.interfaces in 'source\model\connection\pdvmvc.connection.model.interfaces.pas',
  pdvmvc.firedac.connection.model.impl in 'source\model\connection\impl\pdvmvc.firedac.connection.model.impl.pas',
  pdvmvc.query.connection.model.impl in 'source\model\connection\impl\pdvmvc.query.connection.model.impl.pas',
  pdvmvc.configuration.connection.model.impl in 'source\model\connection\impl\pdvmvc.configuration.connection.model.impl.pas',
  pdvmvc.daogenerico.model.dao.interfaces in 'source\model\dao\pdvmvc.daogenerico.model.dao.interfaces.pas',
  pdvmv.daogenerico.model.dao.impl in 'source\model\dao\impl\pdvmv.daogenerico.model.dao.impl.pas',
  pdvmvc.utils.interfaces in 'source\utils\pdvmvc.utils.interfaces.pas',
  pdvmvc.query.utils.impl in 'source\utils\impl\pdvmvc.query.utils.impl.pas',
  pdvmvc.rttihelper.utils in 'source\utils\impl\pdvmvc.rttihelper.utils.pas',
  pdvmvc.rttiatributo.utils in 'source\utils\impl\pdvmvc.rttiatributo.utils.pas',
  pdvmvc.controller.interfaces in 'source\controller\pdvmvc.controller.interfaces.pas',
  pdvmvc.controller.impl in 'source\controller\impl\pdvmvc.controller.impl.pas',
  pdvmvc.utils.impl in 'source\utils\impl\pdvmvc.utils.impl.pas',
  pdvmvc.cliente.view in 'source\view\pdvmvc.cliente.view.pas' {FrmCliente},
  pdvmvc.produto.view in 'source\view\pdvmvc.produto.view.pas' {FrmProduto},
  pdvmvc.listadados.view in 'source\view\pdvmvc.listadados.view.pas' {FrmListaDados};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
