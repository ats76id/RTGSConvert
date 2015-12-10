object frmLaporanKonversiDetail: TfrmLaporanKonversiDetail
  Left = 445
  Top = 245
  BorderStyle = bsDialog
  Caption = 'Lap.Konversi Data Format REMM'
  ClientHeight = 143
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
    Height = 143
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
      Top = 95
      Width = 293
      Height = 44
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnGeneralEdit: TcxButton
        Left = 56
        Top = 12
        Width = 85
        Height = 29
        Caption = '&Cetak'
        Default = True
        TabOrder = 0
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralEditClick
        LookAndFeel.NativeStyle = True
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000019591C8035AA3AEF37A13CDF0C230E300000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000186B1A9F44BB4AFFA9EEB2FF90E299FF329537CF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001068119F38B53DFFA0E8A9FFA0EEACFFB5F5BFFF72D37AFF1F5C
          2280000000000000000000000000000000000000000000000000000000000000
          00000864099F46BB4BFFA0E6A9FF8EE59AFF84E691FF9DEFA9FFAFF3B9FF4ABE
          50FF0B220C300000000000000000000000000000000000000000000000000160
          019F3BB53FFF98E0A1FF84DD8FFF7ADE87FFA8ECB2FF99ECA5FFACF3B7FF97E6
          9FFF2D9332CF00000000000000000000000000000000000000000055008F34B1
          38FF90DB99FF79D685FF7FDA8BFF9FE6A8FF79D480FFA9EDB3FF91EB9EFFB2F3
          BCFF6CD074FF1C5B1E8000000000000000000000000000000000009700FF89D6
          92FF70CF7BFF75D380FF97E0A0FF42B947FF13A315FF82D889FF9DEAA8FF92EA
          9FFFA7EDB1FF43BB48FF0A220B30000000000000000000000000009600FF7ED0
          86FF85D58FFF86D68EFF2FAF32FF0461049F0428054025AB28FFA3E8ACFF87E4
          94FFA1EBACFF8CDF94FF2C9C30DF030B041000000000000000000054008F21A5
          24FF44B649FF11A013FF0056008F000000000000000009640A9F58C45EFF9CE5
          A6FF7ADE88FFA5EAAEFF62C969FF1B641E8F000000000000000000000000001C
          003000390060001D0030000000000000000000000000010A01100D960EEF89DA
          92FF87DE93FF80DD8CFF98E2A1FF3BB640FF0C2C0D4000000000000000000000
          0000000000000000000000000000000000000000000000000000033B04602FAF
          32FF97E0A0FF6BD478FF8CDD96FF7DD485FF26992ADF030B0310000000000000
          0000000000000000000000000000000000000000000000000000000000000676
          07BF67C96EFF89DA93FF5ACB68FF94DE9DFF57C25DFF18621A8F000000000000
          000000000000000000000000000000000000000000000000000000000000011D
          01300FA010FF85D58DFF66CC72FF66CC72FF87D790FF26AC2AFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000024D02803FB543FF88D591FF6FCD79FF89D691FF24AC2AFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000A0010028702DF4CBA52FF66C56DFF4CBA51FF137C15BF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000001300200160019F067606BF0964099F010A0110}
        OptionsImage.Spacing = 2
      end
      object btnGeneralSave: TcxButton
        Left = 146
        Top = 12
        Width = 85
        Height = 29
        Cancel = True
        Caption = '&Batal'
        TabOrder = 1
        TabStop = False
        WordWrap = True
        OnClick = btnGeneralSaveClick
        LookAndFeel.NativeStyle = True
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000070D005E1324009904050048000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000304
          0035248C00FA13DA00FF1FA100FD173000B10201003100000000000000000000
          000000000000000000000000000000000000000000000306003C00000000172E
          00A915DC08FF00FF01FF00FF00FF0FE100FF217400EA0709005E000000000000
          000000000000000000000000000000000000050A004F152A00A3010100242B7F
          0AF519EB19FF09F709FF00FF00FF00FF00FF04FB00FF209500F90507004F0000
          00000000000000000000000000000101001A2B5700E6102000910B13007036AC
          1FFF25E028FF16EA16FF07F807FF00FF00FF00FF00FF08FA00FF142D00A90000
          0000000000000000000000000009193A00B824AA00FF081100671F3C04B751C8
          48FF35D437FF1FDC20FF0EEB0EFF02FE03FF0AE500FF218900F2060A00530000
          0000000000000000000B192A00AA15CE00FF16BA00FE0303003A32610ADE70D7
          6DFF4ED34DFF3FD53FFF40E040FF2EDF30FF2AC01CFF234401D4010100280000
          000C0303003A1C3600B91ABF00FF00FF00FF1B6F00DF0000000E1326018E4179
          1CF2326E12F277AA5CFFB4F1B6FF73DA73FF40D542FF2CB71EFF287107EF2257
          03DB258C02FB0FDB00FF00FF00FF10DF00FF0F1C008A00000000000000000102
          00190001001D27440AC6BADAABFFC0F7C4FF7DDF7EFF49D64BFF2CD42BFF21DC
          1EFF13EF14FF03FF08FF05FA01FF216F00E70101001E00000000000000000000
          0000000000000103002D3D631AE3BEDAB0FFCAF8CDFF92E995FF59D95BFF33D8
          36FF22E426FF1AE314FF268E02F8060800520000000000000000000000000000
          0000000000000000000001040030254406C480A760FF9BCD8AFF7FCD75FF51BF
          44FF34A71BFF265B04DC06090051000000000000000000000000000000000000
          000000000000000000000000000000000006050C005A1A3200A7254505C41E39
          02B20C1400710000001500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OptionsImage.Spacing = 2
      end
    end
    object AdvGroupBox1: TAdvGroupBox
      Left = 4
      Top = 4
      Width = 293
      Height = 91
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
      'HCreditAmount=HCreditAmount')
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
            '[frxDBDataset1."FIleName"]')
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
    Left = 40
    Top = 8
  end
end
