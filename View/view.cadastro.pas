unit view.cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TFormCadastro = class(TForm)
    pnlBotoes: TPanel;
    PageControl1: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    btnSalvar: TButton;
    procedure btnExcluirClick(Sender: TObject); virtual; abstract;
    procedure btnCancelarClick(Sender: TObject); virtual; abstract;
    procedure btnSalvarClick(Sender: TObject); virtual; abstract;
    procedure btnNovoClick(Sender: TObject); virtual; abstract;
    procedure btnEditarClick(Sender: TObject);virtual; abstract;
    procedure DataSourceDataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
    procedure UpdateButtonState;
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

{ TFormCadastro }

procedure TFormCadastro.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  UpdateButtonState
end;

procedure TFormCadastro.UpdateButtonState;
begin
  btnNovo.Enabled := DataSource.DataSet.State in [dsBrowse, dsInactive];
  btnEditar.Enabled := (DataSource.DataSet.State in [dsBrowse, dsInactive]) and (not DataSource.DataSet.IsEmpty);
  btnExcluir.Enabled := (DataSource.DataSet.State in [dsBrowse, dsInactive]) and (not DataSource.DataSet.IsEmpty);
  btnCancelar.Enabled := DataSource.DataSet.State in [dsEdit, dsInsert];
  btnSalvar.Enabled := DataSource.DataSet.State in [dsEdit, dsInsert];
end;
end.

