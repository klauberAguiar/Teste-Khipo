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
  Resultado := TMessage.ShowMessage('Aten��o', 'Esta � uma mensagem de teste', tmAttention);
  Assert.AreEqual(mrOk, Resultado, 'O resultado deve ser mrOk para uma mensagem de aten��o');

  Resultado := TMessage.ShowMessage('Aten��o', 'Esta � uma mensagem de teste', tminformation);
  Assert.AreEqual(mrOk, Resultado, 'O resultado deve ser mrOk para uma mensagem de informa��o');

  Resultado := TMessage.ShowMessage('Interroga��o', 'Esta � uma mensagem de teste', tmInterrogation);
  Assert.IsTrue(Resultado in [mrYes, mrNo], 'O resultado deve ser mrYes ou mrNo para uma mensagem de interroga��o');

end;

initialization
  TDUnitX.RegisterTestFixture(TTesteMessages);
end.

