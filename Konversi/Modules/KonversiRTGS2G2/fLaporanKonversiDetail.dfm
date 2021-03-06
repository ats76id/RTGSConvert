object frmLaporanKonversiDetail: TfrmLaporanKonversiDetail
  Left = 445
  Top = 245
  BorderStyle = bsDialog
  Caption = 'Lap.Konversi Data Format REMM'
  ClientHeight = 150
  ClientWidth = 301
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
    Width = 301
    Height = 150
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
      Top = 92
      Width = 293
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnGeneralEdit: TcxButton
        Left = 48
        Top = 12
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
        Left = 146
        Top = 12
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
      Width = 293
      Height = 88
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 32
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
      object Label3: TLabel
        Left = 32
        Top = 53
        Width = 90
        Height = 13
        Alignment = taCenter
        Caption = 'Status Konversi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object dtpTanggalKonversi: TAdvDateTimePicker
        Left = 138
        Top = 19
        Width = 117
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
      object cboStatusKonversi: TComboBox
        Left = 138
        Top = 49
        Width = 117
        Height = 21
        BevelKind = bkFlat
        Style = csDropDownList
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 1
        Text = 'Semua'
        Items.Strings = (
          'Semua'
          'Gagal'
          'Berhasil')
      end
    end
  end
  object qryRptMaster: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=pass@word1;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DBSIK;Data Source=WIN7-DELPHI-ATS\' +
      'SQLEXPRESS'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM RTGS2SKNHistory '
      'order by ConvertType, HSessionNumber, Status, SeqNumber')
    Left = 40
  end
  object dsRptMaster: TDataSource
    DataSet = qryRptMaster
    Left = 16
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DateProcess=DateProcess'
      'HRecordType=HRecordType'
      'HMemberCode=HMemberCode'
      'HCreationDate=HCreationDate'
      'HSDD=HSDD'
      'HMM=HMM'
      'HCCCC=HCCCC'
      'HMessageType=HMessageType'
      'HBatchType=HBatchType'
      'HSessionNumber=HSessionNumber'
      'RecordType=RecordType'
      'TransactionCode=TransactionCode'
      'FromMember=FromMember'
      'ToMember=ToMember'
      'ReceivingBank=ReceivingBank'
      'TRN=TRN'
      'relref=relref'
      'Amount=Amount'
      'ValueDate=ValueDate'
      'SenderRefNo=SenderRefNo'
      'ReceiverRefNo=ReceiverRefNo'
      'DealCode=DealCode'
      'ToAccountNumber=ToAccountNumber'
      'ToAccountName=ToAccountName'
      'FromAccountNumber=FromAccountNumber'
      'FromAccountName=FromAccountName'
      'PaymentDetails=PaymentDetails'
      'MemberInfo=MemberInfo'
      'OriginatingName=OriginatingName'
      'UltimateBeneAccount=UltimateBeneAccount'
      'UltimateBeneName=UltimateBeneName'
      'Currency=Currency'
      'ExchangeRate=ExchangeRate'
      'Interest=Interest'
      'Period=Period'
      'SAKTINumber=SAKTINumber'
      'SeqNumber=SeqNumber'
      'MT=MT'
      'Status=Status'
      'Keterangan=Keterangan'
      'FileName=FIleName'
      'CAmount=CAmount'
      'SandiKotaAsal=SandiKotaAsal'
      'SandiCabang=SandiCabang'
      'ConvertType=ConvertType'
      'HCreditCount=HCreditCount'
      'HCreditAmount=HCreditAmount'
      'G1File=G1File')
    DataSet = qryRptMaster
    BCDToCurrency = False
    Left = 69
    Top = 1
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
    ReportOptions.LastChange = 41309.724302465300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  intRecNo:Integer;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   Inc(intRecNo);'
      '   memNoRec.Text := Format('#39'%d.'#39', [intRecNo]);'
      ''
      '   (*'
      '   if <frxDBDataset1."Status">=1 then'
      '   begin'
      '     memAlasan.Visible := False;'
      
        '     MasterData1.Height:= 1.00;                                 ' +
        '                           '
      '   end'
      '   else begin'
      '     memAlasan.Visible := True;'
      
        '     MasterData1.Height:= 1.50;                                 ' +
        '                           '
      '   end;             '
      '   *)'
      '     '
      '   if (<frxDBDataset1."ToMember"> = '#39'INDOIDJA'#39') then'
      '   begin'
      '       if Trim(<frxDBDataset1."UltimateBeneAccount">)='#39#39' then'
      
        '          memRekPenerima.Text := <frxDBDataset1."ToAccountNumber' +
        '">'
      '       else'
      
        '          memRekPenerima.Text := <frxDBDataset1."UltimateBeneAcc' +
        'ount">;'
      '            '
      '       memNamaPenerima.Text := <frxDBDataset1."ToAccountName">;'
      '   end'
      '   else begin'
      
        '       memRekPenerima.Text := <frxDBDataset1."UltimateBeneAccoun' +
        't">;'
      
        '       memNamaPenerima.Text:= <frxDBDataset1."UltimateBeneName">' +
        ';                                                            '
      '   end;'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  intRecNo := 0;                                                '
      ''
      '  (*'
      '  IF <FReportType> = 1 then //Gagal'
      '  begin'
      
        '    ColHeaderAlasan.Visible := True;                            ' +
        '                       '
      '    ColumnHeader1.Height := 1.70;'
      ''
      '    memAlasan.Visible := True;        '
      
        '    MasterData1.Height := 1.50;                                 ' +
        '                               '
      '  end                '
      '  else Begin                 '
      '    ColHeaderAlasan.Visible := False;      '
      '    ColumnHeader1.Height := 1.10;'
      ''
      
        '    memAlasan.Visible := False;                                 ' +
        '                                                            '
      '    MasterData1.Height := 1.00;        '
      '  end;                  '
      '  *)      '
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
      ''
      'end;'
      ''
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  '
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
      '  intRecNo:=0;                              '
      'end;'
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure ColumnHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure memAlasanOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset1."Status"><>1   then'
      
        '    memAlasan.Text := '#39'Alasan Gagal: '#39' + <frxDBDataset1."Keteran' +
        'gan">'
      '  else'
      
        '    memAlasan.Text := '#39#39';                                       ' +
        '                    '
      'end;'
      ''
      'procedure memSTatusOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset1."Status">=1 then'
      '    memSTatus.Text := '#39'Berhasil'#39
      '  else'
      '    memSTatus.Text := '#39'Gagal'#39';             '
      'end;'
      ''
      'begin'
      '  '
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 115
    Top = 4
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Var1'
        Value = Null
      end
      item
        Name = 'FReportType'
        Value = ''
      end>
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
          Left = 387.590801500000000000
          Width = 290.645857000000000000
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
            '[HEADER]')
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
          Width = 366.614410000000000000
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
          Left = 944.882500000000000000
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
          Left = 986.457330000000000000
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
          Left = 944.882500000000000000
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
          Left = 986.457330000000000000
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
          Left = 944.882500000000000000
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
          Left = 986.457330000000000000
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
        Height = 56.692950000000000000
        ParentFont = False
        Top = 268.346630000000000000
        Width = 1065.827460000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 41.574830000000000000
          Width = 124.724490000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'relref'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."relref"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 170.078850000000000000
          Width = 56.692950000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ToMember'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."ToMember"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          Left = 230.551330000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."TRN"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo35: TfrxMemoView
          Left = 298.582870000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'FromAccountNumber'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."FromAccountNumber"]')
          ParentFont = False
        end
        object memRekPenerima: TfrxMemoView
          Left = 298.582870000000000000
          Top = 18.897650000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 427.086890000000000000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'OriginatingName'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."OriginatingName"]')
          ParentFont = False
        end
        object memNamaPenerima: TfrxMemoView
          Left = 427.086890000000000000
          Top = 18.897650000000000000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 835.276130000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39'#,##0.00'#39', <frxDBDataset1."CAmount">)]')
          ParentFont = False
        end
        object memNoRec: TfrxMemoView
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
        object memAlasan: TfrxMemoView
          Left = 41.574830000000000000
          Top = 37.795300000000000000
          Width = 529.134200000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'memAlasanOnBeforePrint'
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object memSTatus: TfrxMemoView
          Left = 978.898270000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'memSTatusOnBeforePrint'
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 41.574788500000000000
        ParentFont = False
        Top = 117.165430000000000000
        Width = 1065.827460000000000000
        OnBeforePrint = 'ColumnHeader1OnBeforePrint'
        object Memo25: TfrxMemoView
          Align = baClient
          Width = 1065.827460000000000000
          Height = 41.574788500000000000
          ShowHint = False
          Frame.Typ = [ftTop, ftBottom]
        end
        object Memo3: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
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
        object Memo9: TfrxMemoView
          Left = 41.574830000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'No.Referensi')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 170.078850000000000000
          Width = 56.692950000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'BIC Penerima')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 230.551330000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TRN')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 298.582870000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Rekening Pengirim')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 419.527830000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Nasabah Pengirim')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 298.582870000000000000
          Top = 22.677180000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Rekening Penerima')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 419.527830000000000000
          Top = 22.677180000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Nasabah Penerima')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 835.276130000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Nominal')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 978.898270000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Status')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 219.212740000000000000
        Width = 1065.827460000000000000
        Condition = 'frxDBDataset1."FIleName"'
        KeepTogether = True
        StartNewPage = True
        object Memo1: TfrxMemoView
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'FIle:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Top = 3.779530000000000000
          Width = 396.850650000000000000
          Height = 15.118120000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."G1File"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 347.716760000000000000
        Width = 1065.827460000000000000
        OnAfterPrint = 'GroupFooter1OnAfterPrint'
        object Memo4: TfrxMemoView
          Align = baClient
          Width = 1065.827460000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 642.520100000000000000
          Top = 3.779530000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Total:')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 774.803650000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[COUNT(MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 835.276130000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
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
            '[SUM(<frxDBDataset1."CAmount">,MasterData1)]')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 32
    Top = 48
  end
end
