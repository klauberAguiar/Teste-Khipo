unit view.movimentacao.estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, CadastroInterface,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Presenter.cadastro, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  Vcl.Mask, Vcl.DBCtrls, frxClass, frxDBSet;

type
  TFormMovimentacaoEstoque = class(TFormCadastro, ICadastroView)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    cmbProduto: TComboBox;
    dsRel: TfrxDBDataset;
    frxrelatorio: TfrxReport;
    btnRelatorio: TButton;
    Label6: TLabel;
    cmbTipoMov: TComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cmbProdutoChange(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure btnRelatorioClick(Sender: TObject);
    procedure cmbTipoMovChange(Sender: TObject);
    procedure FDQueryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FQuery: TFDQuery;
    FPresenter: TCadastroPresenter;
    procedure PreencherProdutos;
    procedure HabilitarAbaCadastro;
    procedure HabilitarAbaConsulta;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; APresenter: TCadastroPresenter; AQuery: TFDQuery);
  end;

var
  FormMovimentacaoEstoque: TFormMovimentacaoEstoque;

implementation

uses Repository.produto, data.conexao, view.messages;

{$R *.dfm}

{ TFormMovimentacaoEstoque }

procedure TFormMovimentacaoEstoque.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FPresenter.CancelEdit;
  HabilitarAbaConsulta;
end;

procedure TFormMovimentacaoEstoque.btnNovoClick(Sender: TObject);
begin
  inherited;
  FPresenter.AddNewRecord;
  FQuery.FieldByName('ID').Required := False;
  HabilitarAbaCadastro;
end;

procedure TFormMovimentacaoEstoque.btnRelatorioClick(Sender: TObject);
begin
  inherited;
  frxrelatorio.ShowReport;
end;

procedure TFormMovimentacaoEstoque.btnSalvarClick(Sender: TObject);
begin
  inherited;
  TConexao.GetInstancia.Conexao.StartTransaction;
  try
    FPresenter.SaveRecord;
    TConexao.GetInstancia.Conexao.Commit;
    HabilitarAbaConsulta;
  except
    on E: Exception do
    begin
      TConexao.GetInstancia.Conexao.Rollback;
      TMessage.ShowMessage('Erro', 'Erro ao salvar: ' + E.Message, tmAttention);
    end;
  end;
end;


constructor TFormMovimentacaoEstoque.Create(AOwner: TComponent; APresenter: TCadastroPresenter; AQuery: TFDQuery);
begin
  inherited Create(AOwner);
  FPresenter :=  APresenter;
  FQuery := AQuery;
  try
    DataSource.DataSet := FQuery;
    DBGrid1.DataSource := DataSource;
    PreencherProdutos;
  except
    FQuery.Free;
    raise;
  end;
end;


procedure TFormMovimentacaoEstoque.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  btnEditar.Enabled:= False;
  btnExcluir.Enabled:= False;
end;

procedure TFormMovimentacaoEstoque.cmbProdutoChange(Sender: TObject);
var
  selectedProductId: Integer;
begin
  if cmbProduto.ItemIndex <> -1 then
  begin
     selectedProductId := Integer(cmbProduto.Items.Objects[cmbProduto.ItemIndex]);
    if not (FQuery.State in [dsEdit, dsInsert]) then
      FQuery.Edit;
    FQuery.FieldByName('PRODUTO_ID').AsInteger := selectedProductId;
  end;
end;

procedure TFormMovimentacaoEstoque.cmbTipoMovChange(Sender: TObject);
begin
  inherited;
  if cmbTipoMov.ItemIndex <> -1 then
  begin
    if not (FQuery.State in [dsEdit, dsInsert]) then
      FQuery.Edit;
    FQuery.FieldByName('TIPO_MOVIMENTACAO').AsString := cmbTipoMov.Text;
  end;
end;

procedure TFormMovimentacaoEstoque.FDQueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('PRODUTO_ID').AsInteger = 0 then
  begin
    TMessage.ShowMessage('Aviso', 'O campo ID do Produto é obrigatório.', tmAttention);
    Abort;
  end;

  if DataSet.FieldByName('QUANTIDADE').AsInteger <= 0 then
  begin
    TMessage.ShowMessage('Aviso', 'A quantidade deve ser maior que zero.', tmAttention);
    Abort;
  end;

  if DataSet.FieldByName('TIPO_MOVIMENTACAO').AsString = '' then
  begin
    TMessage.ShowMessage('Aviso', 'Selecione o tipo de movimentação.', tmAttention);
    Abort;
  end;
end;

procedure TFormMovimentacaoEstoque.PreencherProdutos;
var
  ProdutoRepository: TProdutoRepository;
  Query: TFDQuery;
begin
  ProdutoRepository := TProdutoRepository.Create(TConexao.GetInstancia.Conexao);
  Query := ProdutoRepository.GetAll;
  try
    cmbProduto.Clear;
    while not Query.Eof do
    begin
      cmbProduto.Items.AddObject(Query.FieldByName('Nome').AsString, TObject(Query.FieldByName('Id').AsInteger));
      Query.Next;
    end;
  finally
    Query.Free;
    ProdutoRepository.Free;
  end;
end;

procedure TFormMovimentacaoEstoque.HabilitarAbaConsulta;
begin
  PageControl1.ActivePageIndex := 0;
  DataSource.DataSet.Refresh;
end;

procedure TFormMovimentacaoEstoque.HabilitarAbaCadastro;
begin
  PageControl1.ActivePageIndex := 1;
end;

end.
