unit fUMCResStr;

interface

resourcestring
  INFO_LOGGED_USER = 'User %s logon.';
  //INFO_LAST_LOGGED = 'Last logged in on terminal %s.';
  INFO_VERSION     = '1.0.0.1';
  //INFO_LICENSE     = 'Licensed To : %s';
  INFO_LICENSE     = 'Bank Indonesia';

  INFO_APP_TITLE   = 'Aplikasi Perhitungan dan Pelaporan Kliring [APOK]';
  INFO_UNLICENSED  = '(Unlicensed)';
  INFO_UNKNOWN     = '(Unknown)';
  INFO_BAD_LOGIN   = '%d kali kesalahan logon (salah memasukkan password).';
  INFO_APP_VENDOR  = 'Bank Indonesia';
  INFO_APP_ABOUT   = 'Aplikasi Perhitungan dan Pelaporan Kliring [APOK]';

  INFO_UNVALIDATE_USER      = '%d user belum divalidasi.';
  INFO_UNVALIDATE_GROUP     = '%d grup belum divalidasi.';
  INFO_UNVALIDATE_BANK      = '%d bank(s) has not been validated.';
  INFO_UNVALIDATE_BRANCH    = '%d branch(es) has not been validated.';
  INFO_UNVALIDATE_DISTGROUP = '%d dist. group(s) has not been validated.';

  //----------------------------------------------------------------------------
  ERR_INPUT_USER_ID         = 'Silakan masukan nama anda.';
  ERR_UNKNOWN_ERROR         = 'Pesan kesalahan tidak terdaftar : #%s.';
  ERR_CONFIG_NOT_FOUND      = 'Tidak ditemukan konfigurasi pada registry. ' + #13#10 + 'Silakan masukan data-data konfigurasi yang diperlukan pada form berikut.';
  ERR_CREATE_CONFIG_FAILED  = 'Gagal membuat konfigurasi pada registry : Aplikasi akan ditutup.';

  SEC_NOT_AUTHORIZED        = 'User belum diotorisasi : Hubungi sistem administrator.';
  SEC_GROUP_NOT_AUTHORIZED  = 'Grup belum diotorisasi : Hubungi sistem administrator.';

  SEC_INVALID_PASSWORD      = 'Nama user atau password yang dimasukkan salah.';
  SEC_MAXIMUM_BAD_LOGIN     = 'User tidak dapat logon, MAKSIMUM KESALAHAN LOGON : hubungi sistem administrator.';
  SEC_ALREADY_LOGIN         = 'User %s sedang logon.';
  SEC_USER_DISABLED         = 'User dibekukan : Hubungi sistem administrator.';
  SEC_PASSWORD_EXPIRED      = 'Password Anda telah kadaluarsa : Silakan ubah password Anda.';
  SEC_ASK_RELOGIN           = 'Silakan logon kembali untuk melanjutkan.';
  SEC_MUST_CHANGE_PASSWORD  = 'Anda harus mengubah passowrd anda untuk melanjutkan.';
  SEC_NEW_USER              = 'Ini adalah login pertama anda, anda harus mengubah password anda untuk logon : Silakan ubah password Anda.';
  SEC_US_BLOCKED            = 'User diblokir : Hubungi sistem administrator.';
{  INFO_UNVALIDATE_USER      = '%d user(s) has not been validated.';
  INFO_DISABLED_USER        = '%d user(s) is disabled.';
  INFO_UNVALIDATE_GROUP     = '%d user group(s) has not been validated.';
  INFO_UNVALIDATE_BANK      = '%d bank(s) has not been validated.';
  INFO_UNVALIDATE_BRANCH    = '%d branch(es) has not been validated.';
  INFO_UNVALIDATE_DISTGROUP = '%d dist. group(s) has not been validated.';
  }

  INFO_LOGIN       = 'LOGON';
  INFO_CHANGE_PASSWORD = 'UBAH PASSWORD';

  MSG_LOGOUT       = 'Akan keluar dari aplikasi : Lanjutkan?';

  ERR_LOADING_DLL = 'Error loading DLL : %s';
  ERR_LOADING_FUNC = 'Error loading DLL : %s, Function : %s';
  ERR_INVALID_MODULE_ID = 'Invalid module ID : %d';

  SEC_DEFAULT_DB_USER = 'sa';

  SEC_PASSWORD_DIFFERENT = 'Password yang anda masukkan tidak sama. Masukkan password baru ke dua kotak password baru.';
  SEC_USER_NOT_FOUND = 'Tidak terdapat user : %s.';
  SEC_PASSWORD_CHANGED = 'Password telah diubah.';

  SEC_PASSWORD_MUST_DIFFERENT = 'Password baru tidak boleh sama dengan password lama.';
  SEC_PASSWORD_MUST_NOT_COMMON = 'Passowrd baru tidak boleh umum (UserID, ''password'', etc.).';
  SEC_MIN_PASSWORD_LENGTH = 'Password anda terlalu pendek. Minimum panjang password  : %s karakter.';
  SEC_PASSWORD_IS_IN_LIST = 'Password anda tidak boleh sama dengan password anda sebelumnya.';
  SEC_PASSWORD_MUST_CONTAIN_SPECIAL_CHARACTER = 'Password anda harus mengandung minimal 1 (satu) karakter spesial.';
  SEC_LOGIN = 'Logon di terminal %s.';
  SEC_LOGOUT = 'Logout dari terminal %s.';


implementation

end.


