unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Menus,
  System.ImageList, Vcl.ImgList, CommCtrl, StrUtils, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, System.Math, System.Types, Vcl.Imaging.jpeg, CadastroInterface,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormPrincipal = class(TForm, ICadastroView)
    PageControlAbas: TPageControl;
    Menu: TMainMenu;
    mnCadastro: TMenuItem;
    mnManutencao: TMenuItem;
    Sair2: TMenuItem;
    mnProdutos: TMenuItem;
    mnEstoque: TMenuItem;
    AcessoRapidoPanel: TPanel;
    AcessoRapidoLabel: TLabel;
    FlowPanel: TFlowPanel;
    spProdutos: TSpeedButton;
    spEstoque: TSpeedButton;
    AgendamentosPanel: TPanel;
    BottomPanel: TPanel;
    imgLogo: TImage;
    InformacoesSistemaPanel: TPanel;
    Bevel1: TBevel;
    UsuarioPanel: TPanel;
    ImageList: TImageList;
    procedure Sair2Click(Sender: TObject);
    procedure spProdutosClick(Sender: TObject);
    procedure spEstoqueClick(Sender: TObject);
  private
  public
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses view.cadastro.produto, view.movimentacao.estoque, repository.movimentacao.estoque,
     Repository.produto, Presenter.cadastro, data.conexao, view.messages;

procedure TFormPrincipal.Sair2Click(Sender: TObject);
begin
   Close;
end;

procedure TFormPrincipal.spEstoqueClick(Sender: TObject);
var
  MovimentacaoEstoqueRepository: TMovimentacaoEstoqueRepository;
  Presenter : TCadastroPresenter;
  Query: TFDQuery;
begin
  try
    if not Assigned(FormMovimentacaoEstoque) then
    begin
      MovimentacaoEstoqueRepository := TMovimentacaoEstoqueRepository.Create(TConexao.GetInstancia.Conexao);
      Query := TFDQuery.Create(nil);
      Query.Connection := MovimentacaoEstoqueRepository.GetAll.Connection;
      Query.SQL.Text := MovimentacaoEstoqueRepository.GetAll.SQL.Text;
      Query.Open;
      Query.BeforePost := FormMovimentacaoEstoque.FDQueryBeforePost;
      Presenter := TCadastroPresenter.Create(Self, Query);
      FormMovimentacaoEstoque := TFormMovimentacaoEstoque.Create(Application, Presenter, Query);
      try
        FormMovimentacaoEstoque.ShowModal;
      finally
        FreeAndNil(FormMovimentacaoEstoque);
      end;
    end;
  except
    on E: Exception do
    begin
      TMessage.ShowMessage('Aviso', 'Ocorreu um erro ao abrir a tela de produtos:' + E.Message, tmAttention);
    end;
  end;
end;

procedure TFormPrincipal.spProdutosClick(Sender: TObject);
var
  ProdutoRepository: TProdutoRepository;
  Presenter : TCadastroPresenter;
  Query: TFDQuery;
begin
  try
    if not Assigned(FormProdutos) then
    begin
      ProdutoRepository := TProdutoRepository.Create(TConexao.GetInstancia.Conexao);
      Query := TFDQuery.Create(nil);
      Query.Connection := ProdutoRepository.GetAll.Connection;
      Query.SQL.Text := ProdutoRepository.GetAll.SQL.Text;
      Query.Open;
      Query.BeforePost := FormProdutos.FDQueryBeforePost;
      Presenter := TCadastroPresenter.Create(Self, Query);
      FormProdutos := TFormProdutos.Create(Application, Presenter, Query);
      try
        FormProdutos.ShowModal;
      finally
        FreeAndNil(Query);
        FreeAndNil(FormProdutos);
      end;
    end;
  except
    on E: Exception do
    begin
      TMessage.ShowMessage('Aviso', 'Ocorreu um erro ao abrir a tela de produtos:' + E.Message, tmAttention);
    end;
  end;
end;

end.

