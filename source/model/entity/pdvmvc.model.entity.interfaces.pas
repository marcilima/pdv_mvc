unit pdvmvc.model.entity.interfaces;

interface

uses
  System.Generics.Collections;

type
  ICliente = interface
    ['{07DC785C-5184-48E5-B35D-4067A58FF613}']

    procedure SetCodigo(const AValue: Integer);
    function GetCodigo: Integer;

    procedure SetNome(AValue: string);
    function GetNome: string;

    procedure SetCidade(AValue: string);
    function GetCidade: string;

    procedure SetUF(AValue: string);
    function GetUF: string;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property Cidade: string read GetCidade write SetCidade;
    property UF: string read GetUF write SetUF;

  end;

  IProduto = interface
    ['{8D680553-4455-4E4E-A86B-AA3DA667D0E8}']
    procedure SetCodigo(const AValue: Integer);
    function GetCodigo: Integer;

    procedure SetDescricao(const AValue: string);
    function GetDescricao: string;

    procedure SetPrecoVenda(const AValue: Currency);
    function GetPrecoVenda: Currency;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property PrecoVenda: Currency read GetPrecoVenda write SetPrecoVenda;

  end;

  IPedidoItem = interface
    ['{296DFBBD-CD0F-48DE-BE77-7327EBC1EBDE}']
    procedure SetCodigo(const AValue: Integer);
    function GetCodigo: Integer;

    procedure SetNumeroPedido(const AValue: Integer);
    function GetNumeroPedido: Integer;

    procedure SetCodigoProduto(const AValue: Integer);
    function GetCodigoProduto: Integer;

    procedure SetQuantidade(const AValue: Integer);
    function GetQuantidade: Integer;

    procedure SetValorUnitario(const AValue: Currency);
    function GetValorUnitario: Currency;

    procedure SetValorTotal(const AValue: Currency);
    function GetValorTotal: Currency;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property NumeroPedido: Integer read GetNumeroPedido write SetNumeroPedido;
    property CodigoProduto: Integer read GetCodigoProduto write SetCodigoProduto;
    property Quantidade: Integer read GetQuantidade write SetQuantidade;
    property ValorUnitario: Currency read GetValorUnitario write SetValorUnitario;
    property ValorTotal: Currency read GetValorTotal write SetValorTotal;
  end;

  IPedido = interface
    ['{F425486C-D50C-4B5C-8FE1-B1F7CF38D142}']
    procedure SetNumeroPedido(const AValue: Integer);
    function GetNumeroPedido: Integer;

    procedure SetCodigoCliente(const AValue: Integer);
    function GetCodigoCliente: Integer;

    procedure SetDataEmissao(const AValue: TDateTime);
    function GetDataEmissao: TDateTime;

    procedure SetValorTotal(const AValue: Currency);
    function GetValorTotal: Currency;

    procedure AdicionarItem(AItem: IPedidoItem);
    function GetItens: TList<IPedidoItem>;

    procedure RemoverItem(AItem: IPedidoItem);

    property NumeroPedido: Integer read GetNumeroPedido write SetNumeroPedido;
    property CodigoCliente: Integer read GetCodigoCliente write SetCodigoCliente;
    property DataEmissao: TDateTime read GetDataEmissao write SetDataEmissao;
    property ValorTotal: Currency read GetValorTotal write SetValorTotal;

  end;

  IEntity = interface
    ['{3FD6739D-1450-48C2-99CF-EA65B766695F}']
    function Cliente: ICliente;
    function Produto: IProduto;
    function Pedido: IPedido;
    function PedidoItem: IPedidoItem;
  end;

implementation

end.
