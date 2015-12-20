object frmLaporanPerProses: TfrmLaporanPerProses
  Left = 327
  Top = 348
  BorderStyle = bsDialog
  Caption = 'Laporan Proses Per File'
  ClientHeight = 220
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 220
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.2.1.0'
    BorderColor = clNone
    BorderWidth = 4
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    GradientDirection = gdHorizontal
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object Panel2: TPanel
      Left = 4
      Top = 162
      Width = 242
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnGeneralEdit: TcxButton
        Left = 25
        Top = 9
        Width = 92
        Height = 35
        Caption = '&Cetak'
        Default = True
        TabOrder = 0
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralEditClick
        LookAndFeel.NativeStyle = True
        OptionsImage.ImageIndex = 14
        OptionsImage.Images = GlobalVarForm.listGlobalImage
        OptionsImage.Spacing = 2
      end
      object btnGeneralSave: TcxButton
        Left = 123
        Top = 9
        Width = 92
        Height = 35
        Cancel = True
        Caption = '&Batal'
        TabOrder = 1
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralSaveClick
        LookAndFeel.NativeStyle = True
        OptionsImage.ImageIndex = 17
        OptionsImage.Images = GlobalVarForm.listGlobalImage
        OptionsImage.Spacing = 2
      end
    end
    object AdvGroupBox1: TAdvGroupBox
      Left = 4
      Top = 4
      Width = 242
      Height = 158
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 14
        Top = 23
        Width = 99
        Height = 13
        Alignment = taCenter
        Caption = 'Tanggal Konversi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object dtpTanggalKonversi: TAdvDateTimePicker
        Left = 120
        Top = 19
        Width = 106
        Height = 21
        Date = 41320.169918981480000000
        Time = 41320.169918981480000000
        Kind = dkDate
        TabOrder = 0
        BorderStyle = bsSingle
        Ctl3D = False
        DateTime = 41320.169918981480000000
        Version = '1.2.0.5'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
      end
      object ragJenisKonversi: TAdvOfficeRadioGroup
        Left = 16
        Top = 48
        Width = 209
        Height = 97
        Version = '1.3.6.1'
        Caption = 'Jenis Konversi'
        ParentBackground = False
        TabOrder = 1
        ItemIndex = 0
        Items.Strings = (
          'SEMUA'
          'DKOI'
          'REMM'
          'SWIFT')
        Ellipsis = False
      end
    end
  end
  object qryRptMaster: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=pass@word1;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DBSIK;Data Source=WIN7-DELPHI-ATS\' +
      'SQLEXPRESS'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT ConvertType, DateProcess=CONVERT(VARCHAR(8), DateProcess,' +
        ' 108), G1File'
      ',SUM(1) AS HCreditCount'
      ',SUM(CONVERT(NUMERIC(20,2), Amount,206)/100) AS HCreditAmount'
      ',SUM(CASE WHEN Status=1 THEN 1 ELSE 0 END) as TotalItemBerhasil'
      
        ',SUM(CASE WHEN Status=1 THEN CONVERT(NUMERIC(20,2), Amount,206)/' +
        '100  ELSE 0 END) as TotalNominalBerhasil'
      ',SUM(CASE WHEN Status=0 THEN 1 ELSE 0 end) as TotalItemGagal'
      
        ',SUM(CASE WHEN Status=0 THEN CONVERT(NUMERIC(20,2), Amount,206)/' +
        '100 ELSE 0 end) as TotalNominalGagal'
      ',SUM(CASE WHEN Status=2 THEN 1 ELSE 0 end) as TotalItemHapus'
      
        ',SUM(CASE WHEN Status=2 THEN CONVERT(NUMERIC(20,2), Amount,206)/' +
        '100 ELSE 0 end) as TotalNominalHapus'
      ''
      'FROM RTGS2SKNHISTORY'
      'Group by ConvertType, DateProcess, G1File'
      'order by ConvertType, DateProcess, G1File')
    Left = 128
    Top = 80
  end
  object dsRptMaster: TDataSource
    DataSet = qryRptMaster
    Left = 104
    Top = 80
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ConvertType=ConvertType'
      'DateProcess=DateProcess'
      'G1File=G1File'
      'HCreditCount=HCreditCount'
      'HCreditAmount=HCreditAmount'
      'TotalItemBerhasil=TotalItemBerhasil'
      'TotalNominalBerhasil=TotalNominalBerhasil'
      'TotalItemGagal=TotalItemGagal'
      'TotalNominalGagal=TotalNominalGagal'
      'TotalItemHapus=TotalItemHapus'
      'TotalNominalHapus=TotalNominalHapus')
    DataSet = qryRptMaster
    BCDToCurrency = False
    Left = 157
    Top = 81
  end
  object frxReport1: TfrxReport
    Version = '4.9.35'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbOutline, pbPageSetup, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41306.724200104200000000
    ReportOptions.Description.Strings = (
      'Laporan Per Proses File Konversi')
    ReportOptions.LastChange = 41309.724302465300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  intRecNo:Integer;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  intRecNo := 0;                                                '
      'end;'
      '      '
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  tglCetak.Text := FormatDateTime('#39'dd/mm/yyyy'#39', Now);'
      '  jamCetak.Text := FormatDateTime('#39'hh:nn:ss'#39', Now);      '
      'end;'
      ''
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '(*    case <frxDBDataset2."Status"> of'
      '     1: memStatus.Text := '#39'Berhasil Konversi'#39
      '     else'
      
        '       memStatus.Text := '#39'Gagal Konversi'#39'                       ' +
        '                                                   '
      '   end;'
      '*)           '
      'end;'
      ''
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   (*'
      '   Inc(intRecNo);'
      '   '
      '   memRecNo.Text := Format('#39'%d.'#39', [intRecNo]);'
      '     '
      '   if (<frxDBDataset2."ToMember"> = '#39'INDOIDJA'#39') then'
      '   begin'
      '       if Trim(<frxDBDataset2."UltimateBeneAccount">)='#39#39' then'
      
        '          memRekPenerima.Text := <frxDBDataset2."ToAccountNumber' +
        '">'
      '       else'
      
        '          memRekPenerima.Text := <frxDBDataset2."UltimateBeneAcc' +
        'ount">;'
      '            '
      '       memNamaPenerima.Text := <frxDBDataset2."ToAccountName">;'
      '   end'
      '   else begin'
      
        '       memRekPenerima.Text := <frxDBDataset2."UltimateBeneAccoun' +
        't">;'
      
        '       memNamaPenerima.Text:= <frxDBDataset2."UltimateBeneName">' +
        ';                                                            '
      '   end;             '
      '   *)      '
      'end;'
      ''
      'procedure Page1OnManualBuild(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure Page1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '                                '
      'end;'
      ''
      'procedure GroupFooter1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  intRecNo := 0;                '
      'end;'
      ''
      'procedure memConvertTypeOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    case <frxDBDataset1."ConvertType"> of'
      '     1: memConvertType.Text := '#39'Konversi DKOI'#39';  '
      '     2: memConvertType.Text := '#39'Konversi REMM'#39';'
      '     3: memConvertType.Text := '#39'Konversi Swift'#39';'
      '     else'
      
        '       memConvertType.Text := '#39#39';                               ' +
        '             '
      '   end;           '
      'end;'
      ''
      'procedure memTitleKonversiOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   Case <frxDBDataset1."ConvertType"> of'
      '     1: memTitleKonversi.Text := '#39'Data DKOI'#39';  '
      '     2: memTitleKonversi.Text := '#39'Data REMM'#39';'
      '     3: memTitleKonversi.Text := '#39'Data Swift'#39';'
      '     else'
      
        '       memTitleKonversi.Text := '#39#39';                             ' +
        '               '
      '   end;           '
      'end;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure memRecNoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   Inc(intRecNo);'
      '   memRecNo.Text := Format('#39'%d.'#39', [intRecNo]);'
      'end;'
      ''
      'begin'
      '  '
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 187
    Top = 84
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageHeader1: TfrxPageHeader
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo11: TfrxMemoView
          Align = baCenter
          Left = 421.606571500000000000
          Width = 222.614317000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Laporan Per Proses File Konversi')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Align = baCenter
          Left = 478.110545000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[TGL_KLIRING]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          Width = 253.228510000000000000
          Height = 37.795300000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMA_BANK]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 941.102970000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Jam ')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 982.677800000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PAGE#]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 941.102970000000000000
          Top = 37.795300000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Hlm ')
          ParentFont = False
        end
        object jamCetak: TfrxMemoView
          Left = 982.677800000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Jam')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 941.102970000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Tgl   ')
          ParentFont = False
        end
        object tglCetak: TfrxMemoView
          Left = 982.677800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'tglCetak')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 257.008040000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 94.488250000000000000
          Width = 222.992270000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'G1File'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."G1File"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 510.236550000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'TotalItemBerhasil'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."TotalItemBerhasil"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 574.488560000000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'TotalNominalBerhasil'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."TotalNominalBerhasil"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 328.819110000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HCreditCount'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."HCreditCount"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 393.071120000000000000
          Width = 113.385900000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'HCreditAmount'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."HCreditAmount"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo1: TfrxMemoView
          Left = 691.653990000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'TotalItemGagal'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."TotalItemGagal"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 755.906000000000000000
          Width = 60.472406770000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'TotalItemHapus'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."TotalItemHapus"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DateProcess'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."DateProcess"]')
          ParentFont = False
          WordWrap = False
        end
        object memRecNo: TfrxMemoView
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'memRecNoOnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 79.370130000000000000
        Top = 154.960730000000000000
        Width = 1065.827460000000000000
        Condition = 'frxDBDataset1."ConvertType"'
        KeepTogether = True
        object Memo41: TfrxMemoView
          Top = 22.677180000000000000
          Width = 1065.827460000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Frame.Typ = [ftTop, ftBottom]
        end
        object memConvertType: TfrxMemoView
          Top = 5.559060000000000000
          Width = 279.685220000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'memConvertTypeOnBeforePrint'
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Underlines = True
        end
        object Memo20: TfrxMemoView
          Top = 26.456710000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'No.')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 94.488250000000000000
          Top = 26.456710000000000000
          Width = 222.992270000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'File Name')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 328.819110000000000000
          Top = 49.133890000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Total Item')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 393.071120000000000000
          Top = 49.133890000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Total Nominal')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 34.015770000000000000
          Top = 26.456710000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Jam')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 328.819110000000000000
          Top = 26.456710000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Data RTGS Gen-1')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 328.819110000000000000
          Top = 45.354360000000000000
          Width = 177.637910000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 510.236550000000000000
          Top = 49.133890000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Total Item')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 574.488560000000000000
          Top = 49.133890000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Total Nominal')
          ParentFont = False
        end
        object memTitleKonversi: TfrxMemoView
          Left = 510.236550000000000000
          Top = 26.456710000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'memTitleKonversiOnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Data DKOI')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 510.236550000000000000
          Top = 45.354360000000000000
          Width = 177.637910000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 691.653990000000000000
          Top = 49.133890000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Reject')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 755.906000000000000000
          Top = 49.133890000000000000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Hapus')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 691.653990000000000000
          Top = 26.456710000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Status Proses')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 691.653990000000000000
          Top = 45.354360000000000000
          Width = 124.724490000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 298.582870000000000000
        Width = 1065.827460000000000000
        OnAfterPrint = 'GroupFooter1OnAfterPrint'
        object Memo2: TfrxMemoView
          Align = baClient
          Width = 1065.827460000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 328.819110000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."HCreditCount">,MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 393.071120000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."HCreditAmount">,MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 510.236550000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."TotalItemBerhasil">,MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 574.488560000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."TotalNominalBerhasil">,MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 691.653990000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."TotalItemGagal">,MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 755.906000000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."TotalItemHapus">,MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 208
    Top = 48
  end
  object XPManifest2: TXPManifest
    Left = 40
    Top = 8
  end
end
