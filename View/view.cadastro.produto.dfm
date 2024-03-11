inherited FormProdutos: TFormProdutos
  BorderStyle = bsDialog
  Caption = 'Gerenciamento de produtos'
  ClientWidth = 937
  Position = poDesktopCenter
  ExplicitWidth = 949
  ExplicitHeight = 471
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Width = 937
    ExplicitWidth = 931
    inherited btnNovo: TButton
      Left = 272
      OnClick = btnNovoClick
      ExplicitLeft = 266
    end
    inherited btnEditar: TButton
      Left = 398
      OnClick = btnEditarClick
      ExplicitLeft = 392
    end
    inherited btnExcluir: TButton
      Left = 524
      OnClick = btnExcluirClick
      ExplicitLeft = 518
    end
    inherited btnCancelar: TButton
      Left = 650
      OnClick = btnCancelarClick
      ExplicitLeft = 644
    end
    inherited btnSalvar: TButton
      Left = 776
      OnClick = btnSalvarClick
      ExplicitLeft = 770
    end
    object btnRelatorio: TButton
      Left = 18
      Top = 16
      Width = 120
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      StyleElements = [seClient, seBorder]
      OnClick = btnRelatorioClick
      ExplicitLeft = 12
    end
  end
  inherited PageControl1: TPageControl
    Width = 937
    ExplicitWidth = 931
    ExplicitHeight = 351
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 929
      ExplicitHeight = 330
      inherited DBGrid1: TDBGrid
        Width = 929
        Height = 330
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'Id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 155
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'preco'
            Title.Caption = 'Pre'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QuantidadeEmEstoque'
            Title.Caption = 'Quantidade em estoque'
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CategoriaId'
            Title.Caption = 'Id categoria'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_categoria'
            Title.Caption = 'Categoria'
            Width = 126
            Visible = True
          end>
      end
    end
    inherited tsCadastro: TTabSheet
      ExplicitWidth = 929
      ExplicitHeight = 330
      object Label2: TLabel
        Left = 104
        Top = 21
        Width = 33
        Height = 15
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 424
        Top = 24
        Width = 30
        Height = 15
        Caption = 'Pre'#231'o'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 24
        Top = 80
        Width = 65
        Height = 15
        Caption = 'Qtd estoque'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 202
        Top = 75
        Width = 10
        Height = 15
        Caption = 'Id'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 280
        Top = 75
        Width = 51
        Height = 15
        Caption = 'Categoria'
        FocusControl = DBEdit5
      end
      object Label1: TLabel
        Left = 24
        Top = 21
        Width = 10
        Height = 15
        Caption = 'Id'
        FocusControl = dbID
      end
      object DBEdit2: TDBEdit
        Left = 104
        Top = 42
        Width = 300
        Height = 23
        DataField = 'NOME'
        DataSource = DataSource
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 424
        Top = 42
        Width = 180
        Height = 23
        DataField = 'PRECO'
        DataSource = DataSource
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 24
        Top = 101
        Width = 154
        Height = 23
        DataField = 'QUANTIDADEEMESTOQUE'
        DataSource = DataSource
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 202
        Top = 96
        Width = 49
        Height = 23
        DataField = 'CATEGORIAID'
        DataSource = DataSource
        Enabled = False
        TabOrder = 3
      end
      object cmbCategoria: TComboBox
        Left = 280
        Top = 96
        Width = 145
        Height = 23
        TabOrder = 4
        Text = 'cmbCategoria'
        OnChange = cmbCategoriaChange
      end
      object dbID: TDBEdit
        Left = 24
        Top = 42
        Width = 65
        Height = 23
        DataField = 'ID'
        DataSource = DataSource
        Enabled = False
        TabOrder = 5
      end
    end
  end
  inherited DataSource: TDataSource
    Left = 72
    Top = 176
  end
  object dsRel: TfrxDBDataset
    UserName = 'dsRel'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NOME=NOME'
      'PRECO=PRECO'
      'QUANTIDADEEMESTOQUE=QUANTIDADEEMESTOQUE'
      'CATEGORIAID=CATEGORIAID'
      'NOME_CATEGORIA=NOME_CATEGORIA')
    DataSource = DataSource
    BCDToCurrency = False
    Left = 88
    Top = 280
  end
  object frxrelatorio: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbSave, pbExport, pbZoom, pbFind, pbPageSetup, pbTools, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41277.454174583300000000
    ReportOptions.LastChange = 45361.975316446760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 87
    Top = 352
    Datasets = <
      item
        DataSet = dsRel
        DataSetName = 'dsRel'
      end>
    Variables = <
      item
        Name = ' titulo'
        Value = Null
      end
      item
        Name = 'titulo'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      HGuides.Strings = (
        '257,00804')
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 94.327358600000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 583.451698420000000000
          Top = 30.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 649.858690000000000000
          Top = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 507.183918420000000000
          Top = 30.236240000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data e Hora:')
          ParentFont = False
        end
        object titulo: TfrxMemoView
          AllowVectorExport = True
          Left = 5.166129470000000000
          Top = 3.779530000000000000
          Width = 410.051529460000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Gerenciamento de produtos')
          ParentFont = False
        end
        object imgLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 0.050223160000000000
          Height = 56.314960630000000000
          Visible = False
          DataField = 'logomarca'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Pagina: TfrxMemoView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 659.417750000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 90.779769350000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 76.535560000000000000
          Top = 65.655195530000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          DataSet = dsRel
          DataSetName = 'dsRel'
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome Produto')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 7.075041300000000000
          Top = 65.655195530000000000
          Width = 56.363915530000000000
          Height = 18.897650000000000000
          DataSet = dsRel
          DataSetName = 'dsRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Id')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 456.393940000000000000
          Top = 66.472480000000000000
          Width = 86.798618540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 555.222985730000000000
          Top = 66.031540000000000000
          Width = 37.664728540000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Id')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 362.778421170000000000
          Top = 66.252010000000000000
          Width = 79.382574850000000000
          Height = 18.897650000000000000
          DataSet = dsRel
          DataSetName = 'dsRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 604.790085730000000000
          Top = 65.031540000000000000
          Width = 105.696268540000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Categoria')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 44.214734620000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559059999999990000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.000011450000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = dsRel
        DataSetName = 'dsRel'
        RowCount = 0
        object dsProdutoGeralcodigo: TfrxMemoView
          AllowVectorExport = True
          Left = 6.063080000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'ID'
          DataSet = dsRel
          DataSetName = 'dsRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsRel."ID"]')
          ParentFont = False
        end
        object dsProdutoGeraldescricao: TfrxMemoView
          AllowVectorExport = True
          Left = 76.535560000000000000
          Width = 268.346630000000000000
          Height = 15.118120000000000000
          DataField = 'NOME'
          DataSet = dsRel
          DataSetName = 'dsRel'
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsRel."NOME"]')
        end
        object dsProdutoGeralsigla: TfrxMemoView
          AllowVectorExport = True
          Left = 456.393940000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataField = 'PRECO'
          DataSet = dsRel
          DataSetName = 'dsRel'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRel."PRECO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 555.157700000000000000
          Top = -0.440940000000000000
          Width = 37.664728540000000000
          Height = 15.118120000000000000
          DataField = 'CATEGORIAID'
          DataSet = dsRel
          DataSetName = 'dsRel'
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsRel."CATEGORIAID"]')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 362.778421170000000000
          Top = -0.220470000000000000
          Width = 79.382574850000000000
          Height = 15.118120000000000000
          DataField = 'QUANTIDADEEMESTOQUE'
          DataSet = dsRel
          DataSetName = 'dsRel'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRel."QUANTIDADEEMESTOQUE"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = -1.440940000000000000
          Width = 105.696268540000000000
          Height = 15.118120000000000000
          DataField = 'NOME_CATEGORIA'
          DataSet = dsRel
          DataSetName = 'dsRel'
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsRel."NOME_CATEGORIA"]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
      end
    end
  end
end
