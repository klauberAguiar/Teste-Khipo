unit presenter.cadastro;

interface

uses
  CadastroInterface, System.Classes, Data.DB;

type
  TCadastroPresenter = class
  private
    FView: ICadastroView;
    FModel: TDataSet;
  public
    constructor Create(View: ICadastroView; Model: TDataSet);
    procedure AddNewRecord;
    procedure EditRecord;
    procedure DeleteRecord;
    procedure SaveRecord;
    procedure CancelEdit;
  end;

implementation

procedure TCadastroPresenter.CancelEdit;
begin

end;

constructor TCadastroPresenter.Create(View: ICadastroView; Model: TDataSet);
begin
  FView := View;
  FModel := Model;
end;

procedure TCadastroPresenter.DeleteRecord;
begin
  FModel.Delete;
end;

procedure TCadastroPresenter.EditRecord;
begin
  FModel.Edit;
end;

procedure TCadastroPresenter.SaveRecord;
begin
  FModel.Post;
end;

procedure TCadastroPresenter.AddNewRecord;
begin
  FModel.Insert;
end;

end.

