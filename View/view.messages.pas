unit view.messages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList;

type
  TTypeMessage = (tmAttention, tminformation, tmInterrogation);

  TMessage = class(TForm)
    ButtonPanel: TPanel;
    NoButton: TButton;
    YesButton: TButton;
    OkButton: TButton;
    MessageLabel: TLabel;
    TypeImage: TImage;
    ActionList: TActionList;
    OkAction: TAction;
    SimAction: TAction;
    NaoAction: TAction;
    ImageList: TImageList;
    CloseAction: TAction;
    procedure OkActionExecute(Sender: TObject);
    procedure SimActionExecute(Sender: TObject);
    procedure NaoActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitarBotoes(aTypeMessage: TTypeMessage);
  public
    { Public declarations }
    class function ShowMessage(aTitle, aMessage: String; TypeMessage: TTypeMessage; aHeight: Integer = 0): TModalResult;
  end;

var
  Message: TMessage;

implementation

{$R *.dfm}

procedure TMessage.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMessage.HabilitarBotoes(aTypeMessage: TTypeMessage);
begin
  case aTypeMessage of
    tmAttention: begin
      YesButton.Visible := False;
      NoButton.Visible  := False;
      OkButton.Visible  := True;
    end;
    tmInterrogation: begin
      YesButton.Visible := True;
      NoButton.Visible  := True;
      OkButton.Visible  := False;
    end;
    tminformation: begin
      YesButton.Visible := False;
      NoButton.Visible  := False;
      OkButton.Visible  := True;
    end;
  end;
end;

procedure TMessage.NaoActionExecute(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TMessage.OkActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

class function TMessage.ShowMessage(aTitle, aMessage: String; TypeMessage: TTypeMessage; aHeight: Integer = 0): TModalResult;
begin
  Message := TMessage.Create(nil);
  try
    if aHeight > 0 then
    begin
      Message.Height := aHeight;
      Message.MessageLabel.Height := aHeight;
    end;
    Message.Caption := aTitle;
    Message.MessageLabel.Caption := aMessage;
    Message.ImageList.GetBitmap( Integer(TypeMessage), Message.TypeImage.Picture.Bitmap);
    Message.HabilitarBotoes(TypeMessage);
    Message.ShowModal;
  finally
    Result := Message.ModalResult;
    Message.Free;
  end;
end;

procedure TMessage.SimActionExecute(Sender: TObject);
begin
  ModalResult := mrYes;
end;
end.
