unit sknconst;

interface

const
  //SSL Option
  NULL_DATE = '12/30/1899'; //mm/dd/yyyy
	SSL_v2	= 0;
	SSL_v23 = 1;
	SSL_v3  = 2;
	TSL_v1  = 3;

  ZIP_PASSWORD							=	'zip2005';//'#z1P5Kn@0)^#';
  TLS_NO_SUPPORT   = 0;
  BS_TPK_DELETED = 99;
  BS_TPK_TEMP = 98;
  TLS_USE_EXPLICIT = 1;
  TLS_USE_IMPLICIT = 2;
  TLS_USE_REQUIRE  = 3;
  FILE_EXT_KREDIT = 'DKOI';
  FILE_EXT_DEBET  = 'DPOI';

  FLD_DATE_DESC = 'DATE';
	//TSSLType = (sslvSSLv2,sslvSSLv2)
  FLD_REFNO_DESC = 'REF. NO';
  FLD_CUST_NAME_DESC = 'CUST. NAME ';
  FLD_BENEF_NAME_DESC = 'BENEF. NAME';
  FLD_BENEF_ACC_NO_DESC = 'BENEF. ACC. NO.';
  FLD_AMOUNT_DESC = 'AMOUNT';
  FLD_BENEF_BANK_DESC = 'BENEF. BANK';

  FLD_LENGTH_REFNO = 35;
  FLD_LENGTH_CUST_NAME = 80;
  FLD_LENGTH_BENEF_NAME = 80;
  FLD_LENGTH_BENEF_ACC_NO = 40;
  FLD_LENGTH_CUST_ACC_NO = 40;
  FLD_LENGTH_DESC = 96;    

implementation

end.

