unit fUMCConst;

interface

resourcestring
  { Text }
  rsTxtSIKUserGroup      =  'SIK User & Grup';
  rsTxtUser                = 'User';
  rsTxtGroup               = 'Grup';
  rsTxtOperator            = 'Operator';
  rsTxtName                = 'Nama user';
  rsTxtGroupName           = 'Nama grup';
  rsTxtFullName            = 'Nama lengkap';
  rsTxtDesc                = 'Keterangan';
  rsTxtActiveIn            = 'Aktif di komputer ''%s''';
  rsTxtActive              = 'Sedang Login';
  rsTxtObjects             = '%d obyek';
  rsTxtAccRight            = 'Hak akses untuk grup ''%s''';
  rsTxtNeedValidate        = 'Perlu validasi';
  rsTxtNewGroup            = 'Grup baru';
  rsTxtManageGroup         = 'Pengaturan grup';

  { User Status }
  rsStatusAuthorized       = 'Telah divalidasi';
  rsStatusNew              = 'Baru';
  rsStatusEditing          = 'Edit';
  rsStatusDeleteFlag       = 'Flag hapus';
  rsStatusDeleted          = 'Telah dihapus';
  rsStatusBlocked          = 'Locked';
  rsStatusUnlocked         = 'Unlocked';

  { Button }
  rsButtonSave             = 'Simpan';
  rsButtonCreate           = 'Buat';

  rsYes                    = 'Ya';
  rsNo                     = 'Tidak';


  { Error }
  rsErrFirstInitialization = 'Error inisialisasi rutin database.';
  rsErrAccessModuleFailed  = 'Gagal mengakses modul ''%s''.';
  rsErrUnknownResult       = 'Pesan kesalahan tidak diketahui. Kode# : %d';

  rsPassNotMatch = 'Password yang anda masukkan tidak sama. Masukkan password baru pada kedua kotak password baru.';
  rsUserExists   = 'User ''%s'' sudah ada.';
  rsGroupExists  = 'Grup ''%s'' sudah ada.';
  rsDataNotSaved = 'Data tidak disimpan.';


  { Information }
  rsInfoDataSaved    = 'Data telah disimpan.';
  rsInfoDataNotFound = 'Data tidak ada.';

  rsMinLessThan = '%s harus lebih kecil dari %s dan lebih kecil dari %d';
  rsMaxLessThan = '%s harus lebih kecil dari %d.';
  rsUserNameCannotBeZeroLength = 'Minimum panjang nama user ' +
   'tidak boleh sama dengan nol.';
  rsGroupNameInvalid = 'Nama group yang anda masukkan tidak valid. Nama group tidak boleh terdiri dari ' +
   ' karakter-karakter berikut : * + , / : ; < = > ? [ \ ] | & '''' spasi''';
  rsUserNameInvalid = 'Nama user yang anda masukkan tidak valid. Nama user tidak boleh terdiri dari ' +
   ' karakter-karakter berikut : * + , / : ; < = > ? [ \ ] | & '''' spasi''';
  rsUserNameTooShort = 'Panjang nama user terlalu pendek : minimal %d karakter.';
  rsPasswordNotMatch = 'Password yang anda masukkan tidak sama. Masukkan kedua password baru pada ke dua kotak password baru.';
  rsPasswordTooShort = 'Panjang passsword terlalu pendek : minimal %d karakter.';
  rsPasswordChanged = 'Password telah diubah.';
  rsSetAccessListFailed = 'Gagal mengakses modul ''rules'', akses grup gagal disimpan.';
  rsGroupMemberRemoved = 'User ''%s'' telah dihapus dari grup ''%s''.';
  rsFlagRemoved = '%s ''%s'' telah diflag hapus.';
  rsRemoved = '%s ''%s'' telah dihapus.';
  rsCannotRemoveSelf = 'Tidak bisa menghapus user: user ''%s'' tidak bisa menghapus diri sendiri.';
  rsCannotRemoveGroup = 'Tidak bisa menghapus grup: user ''%s'' adalah anggota dari grup ''%s''.';
  rsUsersExistInGroup = 'Tidak bisa menghapus grup: masih terdapat user dalam grup.';

  { Confirmation }
  rsConfirmSaveChanges     = 'Anda yakin akan menyimpan ?';
  rsConfirmValidate        = 'Anda yakin akan memvalidasi %s ''%s'' ?';
  rsConfirmRemove          = 'Anda yakin akan menghapus %s ''%s'' ?';
  rsConfirmUnLock          = 'Anda yakin akan meng-unlock %s ''%s'' ?';
  rsConfirmEnable          = 'Anda yakin akan mengaktifkan %s ''%s'' ?';
  rsConfirmDisable         = 'Anda yakin akan menonaktifkan %s ''%s'' ?';
  rsConfirmRemoveGroupMember = 'Anda yakin akan menghapus user ''%s''' +
    ' dari grup ''%s''?';
  rsConfirmUpdateUser      = 'Anda yakin akan mengubah data user ?';
  rsConfirmCloseWindow     = 'Anda yakin akan menutup window ini ? Data yang belum disimpan tidak akan disimpan.';
  rsConfirmCloseUMC        = 'Anda akan keluar : lanjutkan ?';

  { Log Activities }
  rsLogSetsMenuAccessList  = 'Mengaktifkan menu %s untuk grup %s.';
  rsLogUnSetsMenuAccessList= 'Menonaktifkan akses menu %s untuk grup %s.';
  rsLogChangesGroupDesc    = 'Ubah %s keterangan grup menjadi ''%s''.';
  rsLogTxtExpire           = 'Kadaluarsa';

  { Description }
  rsDescOptionsPass        = 'Masukkan masa kadaluarsa, history, panjang minimum dan maksimum password.';
  rsDescOptionsUser        = 'Masukkan panjang minimum dan maksimum nama user.';

  { Module Access Rights }
  rsMDL_SE                 = 'SOD / EOD';
  rsMDL_LD                 = 'Load Data';
  rsMDL_RPT                = 'Laporan';
  rsMDL_FI                 = 'File Interface';
  rsMDL_PS                 = 'Parameter Sistem';
  rsMDL_UMC                = 'Manajemen User';
  rsMDL_MDB                = 'Pemeliharaan Database';

 { Menu Access Rights }
  rsUMC_NEWUSER            = 'User Baru';
  rsUMC_MANAGEUSER         = 'Pengaturan User';
  rsUMC_VALIDATEUSER       = 'Otorisasi User';
  rsUMC_ENABLEUSER         = 'Aktifkan User';
  rsUMC_DISABLEUSER        = 'Non-aktifkan User';
  rsUMC_UNLOCKUSER         = 'Unlock User';
  rsUMC_REMOVEUSER         = 'Hapus User';
  rsUMC_SETPASSWORD        = 'Set Password';
  rsUMC_NEWGROUP           = 'Grup Baru';
  rsUMC_MANAGEGROUP        = 'Pengaturan Grup';
  rsUMC_VALIDATEGROUP      = 'Otorisasi Grup';
  rsUMC_REMOVEGROUP        = 'Hapus Grup';
  rsUMC_OPTIONS            = 'Konfigurasi';
  rsUMC_USERANDGROUPLIST   = 'Daftar User dan Grup';
  rsUMC_AUDIT              = 'Audit User';
  rsUMC_USERACCESSRIGHT    = 'Hak Akses User';
  rsUMC_GROUPACCESSRIGHT   = 'Hak Akses Grup';
  //UMC_GROUPMEMBERLIST    = 'Data';


const
  { RESULT VALUE }
  VR_OK                 =   0;
  VR_FLAGGED            =   1;
  VR_INCORRECT_PASSWORD =   2;
  VR_PASSWORD_EXPIRED   =   3;
  VR_MAXIMUM_BAD_LOGIN  =   4;
  VR_ALREADY_LOGIN      =   5;
  VR_FAILED             =   6;
  VR_USER_EXISTS        =   7;
  VR_GROUP_NOT_FOUND    =   8;
  VR_GROUP_EXISTS       =   9;
  VR_NOT_AUTHORIZED     =  10;
  VR_INVALID_STATUS     =  11;
  VR_USER_NOT_FOUND     =  12;
  VR_USER_NOT_HAVE_ACCESS = 13;

  { USER & GROUP STATUS }
  ST_NEW                   =  2;
  ST_EDITED                =  3;
  ST_AUTHORIZED            =  1;
  ST_DELETE_FLAG           =  4;
  ST_DELETED               =  5;
  ST_BLOCKED               =  6;
  ST_UNLOCKED              =  7;


  USERSTATUS: array[1..7] of string = (rsStatusAuthorized, rsStatusNew,
    rsStatusEditing, rsStatusDeleteFlag, rsStatusDeleted, rsStatusBlocked, rsStatusUnLocked);

  { Separator }
  SEP                      = ';';

  { Tag }
  tgReset                  = 0;
  tgChanged                = 1;

  { STATUS ENABLED or DISABLED (FLAG) }
  F_ENABLED                =  1;
  F_DISABLED               =  0;

  { Default PARAMETER Value }
  FIXED_PASSWORD_MAXLENGTH = 20;
  FIXED_PASSWORD_MINLENGTH = 0;
  FIXED_USERNAME_MAXLENGTH = 20;
  FIXED_USERNAME_MINLENGTH = 6;

implementation

end.
