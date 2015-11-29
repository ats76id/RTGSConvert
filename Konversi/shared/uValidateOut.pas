unit uValidateOut;

interface

uses SysUtils, Dialogs, DB, ADODB, fUtils, fGlobalVar, fGlobalVarDM, Classes, Variants;

function initValidate(const adoConn:TADOConnection): Boolean;
procedure deinitValidate;
Procedure ValidateDKOI(vBICPengirimPenerus,vBICPengirimAsal,
  vSandiKotaAsal, vNamaNasabahPengirim, vNoRekNasabahPengirim,
  vAlamatNasabahPengirim, vSandiJenisNasabahPengirim,
  vSandiPendudukPengirim, vIdentitasNasabahPengirim, vBICPenerimaPenerus,
  vBICPenerimaAkhir, vSandiKotaTujuan, vNamaNasabahPenerima,
  vNoRekNasabahPenerima, vAlamatNasabahPenerima,
  vSandiJenisNasabahPenerima, vSandiPendudukPenerima,
  vIdentitasNasabahPenerima, vJenisTransaksi, vSandiJenisSaranaTransaksi,
  vNomorReferensi, vNomorReferensiAsal: String; vNominal: Currency;
  vSequence: Integer;Var msgResult:TStringList);

Procedure ValidateDPOI(vBICPengirim, vBICPenerima,
	vWilayahPengirim, vWilayahPenerbit, vNamaNasabahPemegang,
  vNoRekNasabahPemegang, vIdentitasNasabahPemegang,
  vNoRekNasabahTertarik, vJenisTransaksi, vNomorWarkat, vNoReferensi: String;
  vNominal: Currency; vSequence: Integer;Var msgResult:TStringList);


var
  qryBranch,
  qryKantorBank,
  qryRefPeserta,
  qryOpsPesertaDB,
  qryOpsPesertaKR,
  qryRefJenisUsaha,
  qryRefKota,
  qryRefWilayahKliring,
  qryRefJenisTransaksi,
  qryRefPesertaWilayah,
  qryOpsWilayahKliring,
  qryStatusPenduduk,
  qryRefJenisNasabah,
  qryRefStatusPenduduk : TADOQuery;

implementation

uses fConst;

function initValidate(const adoConn:TADOConnection): Boolean;
begin
  (*
  qryKantorBank := TADOQuery.Create(nil);
  with qryKantorBank do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT SANDI_KANTOR_BANK, SANDI_BANK, SANDI_JENIS_USAHA, SANDI_KOTA, SANDI_INSTITUSI_BANK, ');
    SQL.Add('SANDI_WILAYAH_KLIRING ');
    SQL.Add('FROM ' + DB_TABLE_REF_KANTOR_BANK);
    SQL.Add('WHERE DELETED = 0');
    SQL.Add('ORDER BY SANDI_KANTOR_BANK ');
    Open;
  end;
  *)

  qryRefPeserta := TADOQuery.Create(nil);
  with qryRefPeserta do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT a.BIC_PESERTA, a.SANDI_INSTITUSI_PESERTA,a.SANDI_KOTA, b.SANDI_WILAYAH_KLIRING,');
    SQL.Add('a.SANDI_JENIS_USAHA,a.SANDI_JENIS_BANK, a.BIC_PESERTA_SETELMEN,a.STATUS_PESERTA ');
    SQL.Add('FROM ' + DB_TABLE_REF_PESERTA + ' a ');
    SQL.Add('LEFT JOIN ' + DB_TABLE_REF_WILAYAH_KOTA + ' b ');
    SQL.Add('ON b.SANDI_KOTA=a.SANDI_KOTA ');
    SQL.Add('WHERE a.DELETED = 0 AND b.DELETED = 0');
    Open;
  end;

  qryOpsPesertaKR := TADOQuery.Create(nil);
  With qryOpsPesertaKR do
  begin
    if Active then
      close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT BIC_PESERTA, AKTIF_KLIRING_INDV, AKTIF_KLIRING_BULK FROM ' + DB_TABLE_OPS_PESERTA_KR);
    SQL.Add('WHERE AKTIF_KLIRING_INDV=1 AND CONVERT(VARCHAR,TANGGAL,101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', GlobalVarForm.SystemToday))); //CONVERT(VARCHAR,GETDATE(),105) ');
    Open;
  end;

  qryOpsPesertaDB := TADOQuery.Create(nil);
  With qryOpsPesertaDB do
  begin
    if Active then
      close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT BIC_PESERTA, AKTIF_KLIRING_INDV, AKTIF_KLIRING_BULK FROM ' + DB_TABLE_OPS_PESERTA_DB);
    SQL.Add('WHERE AKTIF_KLIRING_INDV=1 AND CONVERT(VARCHAR,TANGGAL,101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', GlobalVarForm.SystemToday))); //CONVERT(VARCHAR,GETDATE(),105) ');
    Open;
  end;

  qryRefJenisUsaha := TADOQuery.Create(nil);
  with qryRefJenisUsaha do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT SANDI_JENIS_USAHA');
    SQL.Add('FROM ' + DB_TABLE_REF_JENIS_USAHA);
    SQL.Add('WHERE DELETED = 0');
    SQL.Add('ORDER BY SANDI_JENIS_USAHA');
    Open;
  end;

  qryRefKota := TADOQuery.Create(nil);
  with qryRefKota do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT PW.BIC_PESERTA, WK.SANDI_KOTA, PW.SANDI_WILAYAH_KLIRING ');
    SQL.Add('FROM ' + DB_TABLE_REF_PESERTA_WILAYAH + ' AS PW ');
    SQL.Add('INNER JOIN ' + DB_TABLE_REF_WILAYAH_KOTA + ' AS WK ');
    SQL.Add('ON WK.SANDI_WILAYAH_KLIRING = PW.SANDI_WILAYAH_KLIRING ');
    SQL.Add('WHERE PW.DELETED = 0 AND WK.DELETED = 0');
    SQL.Add('ORDER BY PW.BIC_PESERTA, WK.sandi_kota, PW.SANDI_WILAYAH_KLIRING ');
    Open;
  end;

  qryRefWilayahKliring := TADOQuery.Create(nil);
  with qryRefWilayahKliring do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT SANDI_WILAYAH_KLIRING');
    SQL.Add('FROM ' + DB_TABLE_REF_WILAYAH_KLIRING);
    SQL.Add('WHERE DELETED = 0');
    SQL.Add('ORDER BY SANDI_WILAYAH_KLIRING');
    Open;
  end;

  qryRefJenisTransaksi := TADOQuery.Create(nil);
  with qryRefJenisTransaksi do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT SANDI_TRANSAKSI, CAPPING');
    SQL.Add('FROM ' + DB_TABLE_REF_JENIS_TRANSAKSI);
    SQL.Add('WHERE DELETED=0');
    SQL.Add('ORDER BY SANDI_TRANSAKSI');
    Open;
  end;

  qryRefPesertaWilayah := TADOQuery.Create(nil);
  With qryRefPesertaWilayah do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_REF_PESERTA_WILAYAH);
    SQL.Add('WHERE DELETED = 0');
    SQL.Add('ORDER BY BIC_PESERTA, SANDI_WILAYAH_KLIRING ');
    Open;
  end;

  qryOpsWilayahKliring := TADOQuery.Create(nil);
  With qryOpsWilayahKliring do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + DB_TABLE_OPS_WILAYAH_KLIRING);
    SQL.Add('WHERE STATUS_WILAYAH=1');
    SQL.Add('AND CONVERT(VARCHAR(10), TANGGAL, 101)=' + QuotedStr(FormatDateTime('mm/dd/yyyy', GlobalVarForm.SystemToday)));
    SQL.Add('ORDER BY SANDI_WILAYAH_KLIRING ');
    Open;
  end;

  qryRefJenisNasabah := TADOQuery.Create(nil);
  with qryRefJenisNasabah do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT SANDI_JENIS_NASABAH, JENIS_NASABAH FROM ' + DB_TABLE_REF_JENIS_NASABAH);
    SQL.Add('WHERE DELETED = 0');
    SQL.Add('ORDER BY SANDI_JENIS_NASABAH ');
    Open;
  end;

  (*
  with TransferDM.MAP_BIC_PESERTAQuery do
  begin
    if Active then
      Close;
    SQL.Clear;
    SQL.Add('SELECT SANDI_BIC_LAMA, SANDI_BIC_BARU FROM ' + GenMainDS(DB_TABLE_MAPPING_BIC_PESERTA));
    SQL.Add('ORDER BY SANDI_BIC_LAMA ');
    Open;
  end;

  with TransferDM.MAP_INSTITUSI_BANKQuery do
  begin
    if Active then
      Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + GenMainDS(DB_TABLE_MAPPING_SANDI_INSTITUSI_BANK));
    SQL.Add('ORDER BY SANDI_INSTITUSI_BANK_LAMA ');
    Open;
  end;
  *)

  qryRefStatusPenduduk := TADOQuery.Create(nil);
  With qryRefStatusPenduduk do
  begin
    if Active then
      Close;
    Connection := adoConn;
    SQL.Clear;
    SQL.Add('SELECT SANDI_STATUS_PENDUDUK, STATUS_PENDUDUK FROM ' + DB_TABLE_REF_STATUS_PENDUDUK);
    SQL.Add('WHERE DELETED = 0');
    Open;
  end;

end;

procedure deinitValidate;
begin
  FreeAndNil(qryBranch);
  FreeAndNil(qryKantorBank);
  FreeAndNil(qryRefPeserta);
  FreeAndNil(qryOpsPesertaDB);
  FreeAndNil(qryOpsPesertaKR);
  FreeAndNil(qryRefJenisUsaha);
  FreeAndNil(qryRefKota);
  FreeAndNil(qryRefWilayahKliring);
  FreeAndNil(qryRefJenisTransaksi);
  FreeAndNil(qryRefPesertaWilayah);
  FreeAndNil(qryOpsWilayahKliring);
  FreeAndNil(qryStatusPenduduk);
  FreeAndNil(qryRefJenisNasabah);
  FreeAndNil(qryRefStatusPenduduk);
end;

Procedure ValidateDKOI(vBICPengirimPenerus,vBICPengirimAsal,
  vSandiKotaAsal, vNamaNasabahPengirim, vNoRekNasabahPengirim,
  vAlamatNasabahPengirim, vSandiJenisNasabahPengirim,
  vSandiPendudukPengirim, vIdentitasNasabahPengirim, vBICPenerimaPenerus,
  vBICPenerimaAkhir, vSandiKotaTujuan, vNamaNasabahPenerima,
  vNoRekNasabahPenerima, vAlamatNasabahPenerima,
  vSandiJenisNasabahPenerima, vSandiPendudukPenerima,
  vIdentitasNasabahPenerima, vJenisTransaksi, vSandiJenisSaranaTransaksi,
  vNomorReferensi, vNomorReferensiAsal: String; vNominal: Currency;
  vSequence: Integer;Var msgResult:TStringList);

var
	TempVal: Integer;
  tempNominal:Currency;

  procedure AddToList(intErrorField:Integer;strError:string);
  begin
    msgResult.Add(IntToStr(vSequence)+';'+IntToStr(intErrorField)+';'+strError);
  end;

begin
  msgResult.Clear;

  //if vBICPengirimPenerus=vBICPenerimaPenerus then
  //	AddToList(EFI_BANKNO, Format('BIC Pengirim Penerus [%s] tidak boleh sama dengan BIC Penerima Penerus [%s]', [vBICPengirimPenerus, vBICPenerimaPenerus]))
  //else
  if vBICPengirimPenerus=vBICPenerimaAkhir then
  	AddToList(EFI_BANKNO, Format('BIC Pengirim Penerus [%s] tidak boleh sama dengan BIC Penerima Akhir [%s]', [vBICPengirimPenerus, vBICPenerimaAkhir]));

	(* cek BIC Pengirim Asal *)
  if IsEmptyString(vBICPengirimAsal) then
  	AddToList(EFI_BANKNO, 'BIC Pengirim Asal tidak boleh kosong.')
  else if vBICPengirimAsal=vBICPenerimaPenerus then
  	AddToList(EFI_BANKNO, Format('BIC Pengirim Asal [%s] tidak boleh sama dengan BIC Penerima Penerus [%s]', [vBICPengirimAsal, vBICPenerimaPenerus]))
  else if vBICPengirimAsal=vBICPenerimaAkhir then
  	AddToList(EFI_BANKNO, Format('BIC Pengirim Asal [%s] tidak boleh sama dengan BIC Penerima Akhir [%s]', [vBICPengirimAsal, vBICPenerimaAkhir]))
  else if Not qryOpsPesertaKR.Locate('BIC_PESERTA', vBICPengirimAsal, []) then
  	AddToList(EFI_BANKNO, Format('BIC Pengirim Asal [%s] tidak ikut kliring', [vBICPengirimAsal]))
  else if not qryRefPeserta.Locate('BIC_PESERTA', vBICPengirimAsal, []) then
  	AddToList(EFI_BANKNO, Format('BIC Pengirim Asal [%s] tidak terdaftar', [vBICPengirimAsal]))
  else begin
    if Trim(vBICPengirimPenerus)<>Trim(qryRefPeserta.FieldByName('BIC_PESERTA_SETELMEN').AsString) then
  	  AddToList(EFI_BANKNO, Format('BIC pengirim penerus [%s] bukan peserta setelmen dari BIC pengirim asal [%s].', [vBICPengirimPenerus, vBICPengirimAsal]));
  end;

  (* Cek Sandi Kota Asal *)
  if IsEmptyString(vSandiKotaAsal) then
  	AddToList(EFI_CITY_CODE, 'Sandi kota asal tidak boleh kosong.')
  else if Not qryRefKota.Locate('SANDI_KOTA', vSandiKotaAsal, []) then
  	AddToList(EFI_CITY_CODE, Format('Sandi kota pengirim [%s] tidak terdaftar.', [vSandiKotaAsal]));

  (* Cek Nama Nasabah Pengirim *)
  If IsEmptyString(vNamaNasabahPengirim) then
  	AddToList(EFI_OP_NAME, 'Nama nasabah pengirim tidak boleh kosong.');

  (* No.Rekening Nasabah Pengirim *)
  if (not (IsEmptyString(vNoRekNasabahPengirim))) AND (not (IsValidAccountAlphaNumeric(vNoRekNasabahPengirim))) then
  begin
  	AddToList(EFI_ACCNO, 'No.Rekening nasabah pengirim tidak valid.');
  end;

  (* Cek Alamat Nasabah Pengirim *)
  if (IsEmptyString(vNoRekNasabahPengirim)) and (IsEmptyString(vAlamatNasabahPengirim)) then
  	AddToList(EFI_CU_ADDRESS, 'Alamat nasabah pengirim yang tidak mencantumkan no.rekening pengirim tidak boleh kosong.');

	(* Cek Jenis Nasabah Pengirim *)
  if IsEmptyString(vSandiJenisNasabahPengirim) then
  	AddToList(EFI_CU_TYPE, 'Sandi jenis nasabah pengirim tidak boleh kosong.')
  else if Not qryRefJenisNasabah.Locate('SANDI_JENIS_NASABAH', vSandiJenisNasabahPengirim, []) then
  	AddToList(EFI_CU_TYPE, Format('Sandi jenis nasabah pengirim [%s] tidak terdaftar.', [vSandiJenisNasabahPengirim]));

  (* Cek sandi Penduduk Pengirim *)
  if IsEmptyString(vSandiPendudukPengirim) then
  	AddToList(EFI_CU_RESIDENT, 'Sandi penduduk pengirim tidak boleh kosong.')
  else if Not qryRefStatusPenduduk.Locate('SANDI_STATUS_PENDUDUK', vSandiPendudukPengirim, []) then
  	AddToList(EFI_CU_RESIDENT, Format('Sandi penduduk pengirim [%s] tidak terdaftar.', [vSandiPendudukPengirim]));

  (* Identitas Nasabah Pengirim *)
  if (IsEmptyString(vNoRekNasabahPengirim)) AND (IsEmptyString(vIdentitasNasabahPengirim)) then
  	AddToList(EFI_ACCNO, 'Identitas nasabah pengirim yang tidak mencantumkan no.rekening pengirim tidak boleh kosong.');

  if (Not (IsEmptyString(vIdentitasNasabahPengirim))) and (not (IsValidAccountAlphaNumeric2(vIdentitasNasabahPengirim))) then
  	AddToList(EFI_ACCNO, 'Identitas nasabah pengirim tidak valid.');

	(* Cek BIC Penerima Penerus *)
  if IsEmptyString(vBICPenerimaPenerus) then
  	AddToList(EFI_BANKNO, 'BIC Penerima Penerus tidak boleh kosong.')
	//else if Trim(vBICPenerimaPenerus)='INDOIDJA' then
  //	AddToList(EFI_BANKNO, Format('BIC Penerima Penerus [%s] tidak boleh Bank Indonesia (BI).', [vBICPenerimaPenerus]))
  else if not qryRefPeserta.Locate('BIC_PESERTA', vBICPenerimaPenerus, []) then
  	AddToList(EFI_BANKNO, Format('BIC Penerima Penerus [%s] tidak terdaftar', [vBICPenerimaPenerus]))
  else if Not qryOpsPesertaKR.Locate('BIC_PESERTA', vBICPenerimaPenerus, []) then
  	AddToList(EFI_BANKNO, Format('BIC Penerima Penerus [%s] tidak ikut kliring',[vBICPenerimaPenerus]));

	(* Cek BIC Penerima Akhir *)
  if IsEmptyString(vBICPenerimaAkhir) then
  	AddToList(EFI_BANKNO, 'BIC Penerima Akhir tidak boleh kosong.')
	//else if Trim(vBICPenerimaAkhir)='INDOIDJA' then
  //	AddToList(EFI_BANKNO, Format('BIC Penerima Akhir [%s] tidak boleh Bank Indonesia (BI).', [vBICPenerimaAkhir]))
  else if not qryRefPeserta.Locate('BIC_PESERTA', vBICPenerimaAkhir, []) then
  	AddToList(EFI_BANKNO, Format('BIC Penerima Akhir [%s] tidak terdaftar', [vBICPenerimaAkhir]))
  else if Not qryOpsPesertaKR.Locate('BIC_PESERTA', vBICPenerimaAkhir, []) then
  	AddToList(EFI_BANKNO, Format('BIC Penerima Akhir [%s] tidak ikut kliring',[vBICPenerimaAkhir]))
  else begin
    if Trim(vBICPenerimaPenerus)<>Trim(qryRefPeserta.FieldByName('BIC_PESERTA_SETELMEN').AsString) then
  	  AddToList(EFI_BANKNO, Format('BIC penerima penerus [%s] bukan peserta setelmen dari BIC penerima akhir [%s].', [vBICPenerimaPenerus, vBICPenerimaAkhir]));
  end;

  (* Cek Sandi Kota Tujuan *)
  if IsEmptyString(vNoRekNasabahPenerima) then
  begin
    if IsEmptyString(vSandiKotaTujuan) then
      AddToList(EFI_CITY_CODE, 'Sandi kota tujuan yang tidak mencantumkan No.Rekening penerima tidak boleh kosong.')
    else if Not qryRefKota.Locate('SANDI_KOTA', vSandiKotaTujuan, []) then
      AddToList(EFI_CITY_CODE, Format('Sandi kota tujuan [%s] tidak terdaftar.', [vSandiKotaTujuan]));
	end
  else if (not (IsEmptyString(vSandiKotaTujuan))) and (Not (qryRefKota.Locate('SANDI_KOTA', vSandiKotaTujuan, []))) then
  	AddToList(EFI_CITY_CODE, Format('Sandi kota tujuan [%s] tidak terdaftar.', [vSandiKotaTujuan]));

  (* Cek Rekening penerima *)
  if (not (IsEmptyString(vJenisTransaksi))) AND (vJenisTransaksi<>'54') AND (IsEmptyString(vNoRekNasabahPenerima)) then
  	AddToList(EFI_ACCNO, 'Nomor rekening nasabah penerima untuk sandi transaksi bukan 54 tidak boleh kosong.');

  if (not (IsEmptyString(vNoRekNasabahPenerima))) and (Not (IsValidAccountAlphaNumeric(vNoRekNasabahPenerima))) then
  	AddToList(EFI_ACCNO, 'No.Rekening nasabah penerima tidak valid.');

	(* Cek Nama Nasabah Penerima *)
  if IsEmptyString(vNamaNasabahPenerima) then
  	AddToList(EFI_CU_NAME, 'Nama nasabah penerima tidak boleh kosong.');

  (* Cek Alamat Nasabah penerima *)
  If (IsEmptyString(vNoRekNasabahPenerima)) AND (IsEmptyString(vAlamatNasabahPenerima)) then
  	AddToList(EFI_CU_ADDRESS, 'Alamat nasabah penerima yang tidak mencantumkan no.rekening penerima tidak boleh kosong.');

  (* cek Jenis Nasabah penerima *)
  if IsEmptyString(vSandiJenisNasabahPenerima) then
  	AddToList(EFI_CU_TYPE, 'Sandi jenis nasabah penerima tidak boleh kosong.')
  else if Not qryRefJenisNasabah.Locate('SANDI_JENIS_NASABAH', vSandiJenisNasabahPenerima, []) then
  	AddToList(EFI_CU_TYPE, Format('Sandi jenis nasabah penerima [%s] tidak terdaftar.', [vSandiJenisNasabahPenerima]));

  (* Cek sandi Penduduk Penerima *)
  if IsEmptyString(vSandiPendudukPenerima) then
  	AddToList(EFI_CU_RESIDENT, 'Sandi penduduk penerima tidak boleh kosong.')
  else if Not qryRefStatusPenduduk.Locate('SANDI_STATUS_PENDUDUK', vSandiPendudukPenerima, []) then
  	AddToList(EFI_CU_RESIDENT, Format('Sandi penduduk penerima [%s] tidak terdaftar.', [vSandiPendudukPenerima]));

  (* Identitas Nasabah Penerima *)
  if (IsEmptyString(vNoRekNasabahPenerima)) AND (IsEmptyString(vIdentitasNasabahPenerima)) then
  	AddToList(EFI_ACCNO, 'Identitas nasabah penerima yang tidak mencantumkan no.rekening penerima tidak boleh kosong.');

  if (not (IsEmptyString(vIdentitasNasabahPenerima))) and (not (IsValidAccountAlphaNumeric2(vIdentitasNasabahPenerima))) then
  	AddToList(EFI_ACCNO, 'Identitas nasabah penerima tidak valid.');

  (* Cek Nominal *)
  if vNominal<=0 then
  	AddToList(EFI_AMOUNT, 'Nominal tidak boleh nol (0) atau kosong.');

  (* Jenis Transaksi *)
  if IsEmptyString(vJenisTransaksi) then
		AddToList(EFI_TC, 'Sandi transaksi tidak boleh kosong.')
  else if not TryStrToInt(Trim(vJenisTransaksi), TempVal) then
    AddToList(EFI_TC, 'Sandi Transaksi harus numerik.')
  else if not ((TempVal >= 50) and (TempVal <= 59)) then
    AddToList(EFI_TC, Format('Sandi Transaksi [%s] bukan merupakan Sandi Transaksi Kredit', [vJenisTransaksi]))
  else if not qryRefJenisTransaksi.Locate('SANDI_TRANSAKSI', vJenisTransaksi, []) then
		AddToList(EFI_TC, Format('Sandi transaksi [%s] tidak terdaftar.', [vJenisTransaksi]))
  else begin
      if vNominal>qryRefJenisTransaksi.FieldByName('CAPPING').AsCurrency then
      begin
        AddToList(EFI_AMOUNT,'Nominal (' + FormatCurr('###,###,###.00', vNominal)+ ') melewati capping.');
      end;
  end;

  (* Cek Nomor Referensi *)
	if IsEmptyString(vNomorReferensi) then
  	AddToList(EFI_REF_NO, 'Nomor referensi tidak boleh kosong.');

  (* Cek Nomor Referensi Asal *)
  if (Trim(vJenisTransaksi) = '59') AND (IsEmptyString(vNomorReferensiAsal)) then
  	AddToList(EFI_REF_NO, 'No.Ref transaksi asal untuk TC=59 tidak boleh kosong.');


end;

Procedure ValidateDPOI(vBICPengirim, vBICPenerima,
	vWilayahPengirim, vWilayahPenerbit, vNamaNasabahPemegang,
  vNoRekNasabahPemegang, vIdentitasNasabahPemegang,
  vNoRekNasabahTertarik, vJenisTransaksi, vNomorWarkat, vNoReferensi: String;
  vNominal: Currency; vSequence: Integer;Var msgResult:TStringList);

var
	TempVal: Integer;
  tempNominal:Currency;

  procedure AddToList(intErrorField:Integer;strError:string);
  begin
    msgResult.Add(IntToStr(vSequence)+';'+IntToStr(intErrorField)+';'+strError);
  end;

begin
  msgResult.Clear;

	(* cek BIC Penerima *)
  if IsEmptyString(vBICPenerima) then
  	AddToList(EFI_BANKNO, 'BIC Penerima tidak boleh kosong.')
	else If vBICPengirim=vBICPenerima then
  	AddToList(EFI_BANKNO, Format('BIC pengirim [%s] tidak boleh sama dengan BIC penerima [%s]', [vBICPengirim, vBICPenerima]))
	else if Trim(vBICPenerima)='INDOIDJA' then
  	AddToList(EFI_BANKNO, Format('BIC Penerima [%s] tidak boleh Bank Indonesia (BI).', [vBICPenerima]))
  else if not qryRefPeserta.Locate('BIC_PESERTA', vBICPenerima, []) then
  	AddToList(EFI_BANKNO, Format('BIC Penerima [%s] tidak terdaftar', [vBICPenerima]))
  else if Not qryOpsPesertaDB.Locate('BIC_PESERTA', vBICPenerima, []) then
  	AddToList(EFI_BANKNO, Format('BIC Penerima [%s] tidak ikut kliring', [vBICPenerima]))
  else if not qryRefPesertaWilayah.Locate('BIC_PESERTA;SANDI_WILAYAH_KLIRING', VarArrayOf([vBICPenerima, vWilayahPengirim]), []) then
    AddToList(EFI_BANKNO, Format('BIC penerima [%s] tidak terdaftar pada Sandi wilayah [%s].', [vBICPenerima, vWilayahPenerbit]));

  (* Cek Wilayah Penerbit *)
  if IsEmptyString(vWilayahPenerbit) then
  	AddToList(EFI_CITY_CODE, 'Sandi Wilayah Penerbit tidak boleh kosong')
  (*
  else if vWilayahPengirim<>vWilayahPenerbit then
  	AddToList(EFI_CITY_CODE, Format('Sandi Wilayah Penerbit [%s] tidak sama dengan Sandi Wilayah Pengirim [%s].', [vWilayahPengirim, vWilayahPenerbit]))
  *)
  else if not qryOpsWilayahKliring.Locate('SANDI_WILAYAH_KLIRING', vWilayahPenerbit, []) then
    AddToList(EFI_CITY_CODE, Format('Sandi Wilayah penerbit [%s] tidak tidak ikut kliring.', [vWilayahPenerbit]));

  (* Cek Nama Nasabah Pengirim *)
  If IsEmptyString(vNamaNasabahPemegang) then
  	AddToList(EFI_OP_NAME, 'Nama nasabah pemegang tidak boleh kosong.');

  (* No.Rekening nasabah pengirim *)
  if (not (IsEmptyString(vNoRekNasabahPemegang))) and (not (IsValidAccountNumeric(vNoRekNasabahPemegang))) then
  	AddToList(EFI_ACCNO, 'No.Rekening nasabah pemegang tidak valid.');

  (* Identitas Nasabah Pengirim *)
  if (IsEmptyString(vNoRekNasabahPemegang)) AND (IsEmptyString(vIdentitasNasabahPemegang)) then
  	AddToList(EFI_ACCNO, 'Identitas nasabah pemegang yang tidak mencantumkan no.rekening pemegang tidak boleh kosong.');

  if (Not (IsEmptyString(vIdentitasNasabahPemegang))) and (not (IsValidAccountAlphaNumeric2(vIdentitasNasabahPemegang))) then
  	AddToList(EFI_ACCNO, 'Identitas nasabah pemegang tidak valid.');

	(* Cek No.Rekening Tertarik *)
  if IsEmptyString(vNoRekNasabahTertarik) then
		AddToList(EFI_ACCNO, 'No.Rekening tertarik tidak boleh kosong.')
  else if Not IsValidAccountNumeric(vNoRekNasabahTertarik) then
		AddToList(EFI_ACCNO, 'No.Rekening tertarik tidak valid.');

  (* Cek Jenis Transaksi *)
  if IsEmptyString(vJenisTransaksi) then
		AddToList(EFI_TC, 'Sandi transaksi tidak boleh kosong.')
  else if not TryStrToInt(Trim(vJenisTransaksi), TempVal) then
    AddToList(EFI_TC, 'Sandi Transaksi harus numerik.')
  else if not ((TempVal >= 0) and (TempVal <= 49)) then
    AddToList(EFI_TC, 'Sandi Transaksi bukan merupakan Sandi Transaksi Debet')
  else if not qryRefJenisTransaksi.Locate('SANDI_TRANSAKSI', vJenisTransaksi, []) then
		AddToList(EFI_TC, Format('Sandi transaksi [%s] tidak terdaftar.', [vJenisTransaksi]))
  else begin
      if vNominal>qryRefJenisTransaksi.FieldByName('CAPPING').AsCurrency then
      begin
        AddToList(EFI_AMOUNT,'Nominal (' + FormatCurr('###,###,###.00', vNominal)+ ') melewati capping.');
      end;
  end;

  (* Cek Nomor Warkat *)
  if IsEmptyString(vNomorWarkat) then
    AddToList(EFI_CHNO, 'Nomor warkat tidak boleh kosong.');

  (* Cek Nominal *)
  if vNominal<=0 then
  	AddToList(EFI_AMOUNT, 'Nominal tidak boleh nol (0) atau kosong.');

  (* Cek Nomor Referensi *)
	if IsEmptyString(vNoReferensi) then
  	AddToList(EFI_REF_NO, 'Nomor referensi tidak boleh kosong.');
end;


end.
