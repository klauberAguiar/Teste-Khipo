unit teste.messages;

interface
uses
  DUnitX.TestFramework,
  Vcl.Forms,
  Vcl.Controls,
  view.messages;

type

  [TestFixture]
  TTesteMessages = class(TObject)
  public
    [Test]
    procedure TesteShowMessage;
  end;

implementation

procedure TTesteMessages.TesteShowMessage;
var
  Resultado: TModalResult;
begin
  Resultado := TMessage.ShowMessage('Atenção', 'Esta é uma mensagem de teste', tmAttention);
  Assert.AreEqual(mrOk, Resultado, 'O resultado deve ser mrOk para uma mensagem de atenção');

  Resultado := TMessage.ShowMessage('Atenção', 'Esta é uma mensagem de teste', tminformation);
  Assert.AreEqual(mrOk, Resultado, 'O resultado deve ser mrOk para uma mensagem de informação');

  Resultado := TMessage.ShowMessage('Interrogação', 'Esta é uma mensagem de teste', tmInterrogation);
  Assert.IsTrue(Resultado in [mrYes, mrNo], 'O resultado deve ser mrYes ou mrNo para uma mensagem de interrogação');

end;

initialization
  TDUnitX.RegisterTestFixture(TTesteMessages);
end.

