inherited FormMovimentacaoEstoque: TFormMovimentacaoEstoque
  Caption = 'Gerenciamento de estoque'
  ClientHeight = 504
  ClientWidth = 1053
  Position = poDesktopCenter
  ExplicitWidth = 1065
  ExplicitHeight = 542
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Width = 1053
    ExplicitWidth = 1047
    inherited btnNovo: TButton
      Left = 402
      OnClick = btnNovoClick
      ExplicitLeft = 396
    end
    inherited btnEditar: TButton
      Left = 528
      OnClick = btnEditarClick
      ExplicitLeft = 522
    end
    inherited btnExcluir: TButton
      Left = 654
      OnClick = btnExcluirClick
      ExplicitLeft = 648
    end
    inherited btnCancelar: TButton
      Left = 780
      OnClick = btnCancelarClick
      ExplicitLeft = 774
    end
    inherited btnSalvar: TButton
      Left = 906
      OnClick = btnSalvarClick
      ExplicitLeft = 900
    end
    object btnRelatorio: TButton
      Left = 10
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
      ExplicitLeft = 4
    end
  end
  inherited PageControl1: TPageControl
    Width = 1053
    Height = 431
    ExplicitWidth = 1047
    ExplicitHeight = 422
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 1045
      ExplicitHeight = 401
      inherited DBGrid1: TDBGrid
        Width = 1045
        Height = 401
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'Id'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produto_id'
            Title.Caption = 'Produto id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Produto'
            Width = 217
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo_movimentacao'
            Title.Caption = 'Tipo movimenta'#231#227'o'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Title.Caption = 'Quantidade'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_movimentacao'
            Title.Caption = 'Data movimenta'#231#227'o'
            Width = 119
            Visible = True
          end>
      end
    end
    inherited tsCadastro: TTabSheet
      ExplicitWidth = 1045
      ExplicitHeight = 401
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 11
        Height = 15
        Caption = 'ID'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 24
        Top = 67
        Width = 56
        Height = 15
        Caption = 'Produto id'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 274
        Top = 67
        Width = 122
        Height = 15
        Caption = 'Tipo de movimenta'#231#227'o'
      end
      object Label4: TLabel
        Left = 456
        Top = 67
        Width = 62
        Height = 15
        Caption = 'Quantidade'
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 104
        Top = 67
        Width = 43
        Height = 15
        Caption = 'Produto'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 24
        Top = 32
        Width = 56
        Height = 23
        DataField = 'ID'
        DataSource = DataSource
        Enabled = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 24
        Top = 83
        Width = 56
        Height = 23
        DataField = 'PRODUTO_ID'
        DataSource = DataSource
        Enabled = False
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 456
        Top = 83
        Width = 154
        Height = 23
        DataField = 'QUANTIDADE'
        DataSource = DataSource
        TabOrder = 2
      end
      object cmbProduto: TComboBox
        Left = 104
        Top = 83
        Width = 145
        Height = 23
        TabOrder = 3
        OnChange = cmbProdutoChange
      end
      object cmbTipoMov: TComboBox
        Left = 274
        Top = 83
        Width = 145
        Height = 23
        TabOrder = 4
        OnChange = cmbTipoMovChange
        Items.Strings = (
          'ENTRADA'
          'SAIDA')
      end
    end
  end
  inherited DataSource: TDataSource
    Left = 328
    Top = 176
  end
  object dsRel: TfrxDBDataset
    UserName = 'dsRel'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'PRODUTO_ID=PRODUTO_ID'
      'TIPO_MOVIMENTACAO=TIPO_MOVIMENTACAO'
      'QUANTIDADE=QUANTIDADE'
      'DATA_MOVIMENTACAO=DATA_MOVIMENTACAO'
      'NOME=NOME')
    DataSource = DataSource
    BCDToCurrency = False
    Left = 424
    Top = 176
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
    ReportOptions.LastChange = 43468.740779062500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 503
    Top = 176
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
            'Movimenta'#231#245'es de estoque')
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
          Left = 109.889920000000000000
          Top = 65.655195530000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 52.429401300000000000
          Top = 65.655195530000000000
          Width = 56.363915530000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Id produto')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 505.527830000000000000
          Top = 66.472480000000000000
          Width = 86.798618540000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Movimenta'#231#227'o')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 68.031540000000000000
          Width = 86.798618540000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 8.571021300000000000
          Top = 64.252010000000000000
          Width = 33.686735530000000000
          Height = 18.897650000000000000
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
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 411.912311170000000000
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
          Left = 51.417440000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'PRODUTO_ID'
          DataSet = dsRel
          DataSetName = 'dsRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsRel."PRODUTO_ID"]')
          ParentFont = False
        end
        object dsProdutoGeraldescricao: TfrxMemoView
          AllowVectorExport = True
          Left = 109.889920000000000000
          Width = 287.244280000000000000
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
          Left = 505.527830000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataField = 'TIPO_MOVIMENTACAO'
          DataSet = dsRel
          DataSetName = 'dsRel'
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsRel."TIPO_MOVIMENTACAO"]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 1.559060000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataField = 'DATA_MOVIMENTACAO'
          DataSet = dsRel
          DataSetName = 'dsRel'
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsRel."DATA_MOVIMENTACAO"]')
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = -1.403185530000000000
          Width = 37.795300000000000000
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
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 411.912311170000000000
          Top = -0.220470000000000000
          Width = 79.382574850000000000
          Height = 15.118120000000000000
          DataField = 'QUANTIDADE'
          DataSet = dsRel
          DataSetName = 'dsRel'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsRel."QUANTIDADE"]')
          ParentFont = False
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
