object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 442
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 649
    DesignSize = (
      656
      73)
    object btnNovo: TButton
      Left = 11
      Top = 16
      Width = 120
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      StyleElements = [seClient, seBorder]
      ExplicitLeft = 4
    end
    object btnEditar: TButton
      Left = 137
      Top = 16
      Width = 120
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      StyleElements = [seClient, seBorder]
      ExplicitLeft = 130
    end
    object btnExcluir: TButton
      Left = 263
      Top = 16
      Width = 120
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = 'E&xcluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      StyleElements = [seClient, seBorder]
      ExplicitLeft = 256
    end
    object btnCancelar: TButton
      Left = 389
      Top = 16
      Width = 120
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      StyleElements = [seClient, seBorder]
      ExplicitLeft = 382
    end
    object btnSalvar: TButton
      Left = 515
      Top = 16
      Width = 120
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      StyleElements = [seClient, seBorder]
      ExplicitLeft = 508
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 656
    Height = 369
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 649
    ExplicitHeight = 360
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 648
        Height = 339
        Align = alClient
        DataSource = DataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
    end
  end
  object DataSource: TDataSource
    OnDataChange = DataSourceDataChange
    Left = 216
    Top = 144
  end
end
