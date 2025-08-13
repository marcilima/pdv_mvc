unit pdvmvc.cliente.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmCliente = class(TForm)
    GroupBox1: TGroupBox;
    edtCodigoCliente: TEdit;
    edtNomeCliente: TEdit;
    edtCidade: TEdit;
    edtUF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SalvarCliente;
  public
    { Public declarations }
    class procedure ShowView;
  end;

implementation

uses
  pdvmvc.controller.impl;

{$R *.dfm}

procedure TFrmCliente.btnSalvarClick(Sender: TObject);
begin
  SalvarCliente;
end;

procedure TFrmCliente.SalvarCliente;
begin
  var LController := TDAOController.New;
  var LCliente := LController.Entity.Cliente;

  LCliente.Nome := edtNomeCliente.Text;
  LCliente.Cidade := edtCidade.Text;
  LCliente.UF := edtUF.Text;

  LCliente.Codigo := LController.Salvar(LCliente).GetId;

  edtCodigoCliente.Text := IntToStr(LCliente.Codigo);
end;

{ TFrmCliente }

class procedure TFrmCliente.ShowView;
var
  LFrm: TFrmCliente;
begin
  LFrm := TFrmCliente.Create(nil);

  try
    LFrm.ShowModal
  finally
    FreeAndNil(LFrm);
  end;
end;

end.
