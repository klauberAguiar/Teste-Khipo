unit view.cadastro.produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, CadastroInterface, Presenter.cadastro,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, Vcl.Mask, Vcl.DBCtrls, repository.produto, frxClass,
  frxDBSet;

type
  TFormProdutos = class(TFormCadastro, ICadastroView)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    cmbCategoria: TComboBox;
    Label6: TLabel;
    dbID: TDBEdit;
    Label1: TLabel;
    dsRel: TfrxDBDataset;
    frxrelatorio: TfrxReport;
    btnRelatorio: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cmbCategoriaChange(Sender: TObject);
    function ConfirmDeletion: Boolean;
    procedure FDQueryBeforePost(DataSet: TDataSet);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    FQuery: TFDQuery;
    FPresenter: TCadastroPresenter;
    procedure PreencherCategorias;
    procedure SetaComboCategorias;
    procedure HabilitarAbaConsulta;
    procedure HabilitarAbaCadastro;


  public
    { Public declarations }
    function GetDataSetProdutos: TFDQuery;
    constructor Create(AOwner: TComponent; APresenter: TCadastroPresenter; AQuery: TFDQuery);
  end;

var
  FormProdutos: TFormProdutos;

implementation

uses  repository.categoria, data.conexao, view.messages;

{$R *.dfm}

{ TFormCadastro1 }

constructor TFormProdutos.Create(AOwner: TComponent;  APresenter:TCadastroPresenter; AQuery: TFDQuery);
begin
  inherited Create(AOwner);
  FPresenter :=  APresenter;
  FQuery := AQuery;
  try
    DataSource.DataSet := AQuery;
    DBGrid1.DataSource := DataSource;
    PreencherCategorias;
    SetaComboCategorias;
  except
    FQuery.Free;
    raise;
  end;
end;

procedure TFormProdutos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FPresenter.CancelEdit;
  HabilitarAbaConsulta;
end;

procedure TFormProdutos.HabilitarAbaCadastro;
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TFormProdutos.btnEditarClick(Sender: TObject);
begin
  inherited;
  FPresenter.EditRecord;
  HabilitarAbaCadastro;
end;

procedure TFormProdutos.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if ConfirmDeletion then
  begin
    try
      TConexao.GetInstancia.Conexao.StartTransaction;
      FPresenter.DeleteRecord;
      TConexao.GetInstancia.Conexao.Commit;
    except
    on E: Exception do
      begin
        TConexao.GetInstancia.Conexao.Rollback;
        TMessage.ShowMessage('Erro', 'Já existe movimentação de estoque para o produto! ', tmAttention);
      end;
    end;
  end;
end;

procedure TFormProdutos.btnNovoClick(Sender: TObject);
begin
  inherited;
  FPresenter.AddNewRecord;
  FQuery.FieldByName('ID').Required := False;
  HabilitarAbaCadastro;
end;

procedure TFormProdutos.btnRelatorioClick(Sender: TObject);
begin
  inherited;
  frxrelatorio.ShowReport;
end;

procedure TFormProdutos.HabilitarAbaConsulta;
begin
  PageControl1.ActivePageIndex := 0;
  DataSource.DataSet.Refresh;
end;

function TFormProdutos.GetDataSetProdutos: TFDQuery;
begin
  Result := FQuery;
end;

procedure TFormProdutos.btnSalvarClick(Sender: TObject);
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

procedure TFormProdutos.cmbCategoriaChange(Sender: TObject);
begin
  inherited;
  if not FQuery.IsEmpty then
  begin
    FQuery.Edit;
    FQuery.FieldByName('CategoriaId').AsInteger := cmbCategoria.ItemIndex + 1;
  end;
end;

function TFormProdutos.ConfirmDeletion: Boolean;
begin
  Result := TMessage.ShowMessage('Confirmação', 'Confirma a exclusão?', tmInterrogation) = mrYes;
end;

procedure TFormProdutos.PreencherCategorias;
var
  CategoriaRepository: TCategoriaRepository;
  Query: TFDQuery;
begin
  CategoriaRepository := TCategoriaRepository.Create(TConexao.GetInstancia.Conexao);
  Query := CategoriaRepository.GetAll;
  try
    cmbCategoria.Clear;
    while not Query.Eof do
    begin
      cmbCategoria.Items.AddObject(Query.FieldByName('Nome').AsString, TObject(Query.FieldByName('Id').AsInteger));
      Query.Next;
    end;
  finally
    Query.Free;
    CategoriaRepository.Free;
  end;
end;

procedure TFormProdutos.SetaComboCategorias;
var
  CategoriaId: Integer;
begin
  CategoriaId := DataSource.DataSet.FieldByName('CategoriaId').AsInteger;
  cmbCategoria.ItemIndex := cmbCategoria.Items.IndexOfObject(TObject(CategoriaId));
end;

procedure TFormProdutos.FDQueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim(DataSet.FieldByName('NOME').AsString) = '' then
  begin
    TMessage.ShowMessage('Aviso', 'O campo Nome é obrigatório.', tmAttention);
    Abort;
  end;

  if DataSet.FieldByName('PRECO').AsCurrency <= 0 then
  begin
    TMessage.ShowMessage('Aviso', 'O campo Preço deve ser maior que zero.', tmAttention);
    Abort;
  end;

  if DataSet.FieldByName('QUANTIDADEEMESTOQUE').AsInteger < 0 then
  begin
    TMessage.ShowMessage('Aviso', 'O campo Quantidade em Estoque não pode ser negativo.' , tmAttention);
    Abort;
  end;

  if DataSet.FieldByName('CATEGORIAID').IsNull then
  begin
    TMessage.ShowMessage('Aviso', 'A seleção de uma Categoria é obrigatória.', tmAttention);
    Abort;
  end;
end;
end.
