{ lib
, stdenv
, fetchFromGitHub
, cups
, cups-filters
, foomatic-db-engine
, fetchpatch
, ghostscript
, libpng
, libxml2
, autoreconfHook
, perl
, patchPpdFilesHook
}:

stdenv.mkDerivation rec {
  pname = "ptouch-driver";
  version = "rc1.7";

  src = fetchFromGitHub {
    owner = "matt-fff";
    repo = "printer-driver-ptouch";
    rev = "mw/QL-1100c";
    hash = "sha256-uaQaZrxDwBSP1oE3ArUNHVhYiiMGOuw7JTyHdsnBitQ=";
    # hash = "";
  };

  buildInputs = [ cups cups-filters ghostscript libpng libxml2 ];
  nativeBuildInputs = [
    autoreconfHook
    foomatic-db-engine
    patchPpdFilesHook
    (perl.withPackages (pp: with pp; [ XMLLibXML ]))
  ];

  postPatch = ''
    patchShebangs ./foomaticalize
  '';

  postInstall = ''
    export FOOMATICDB="${placeholder "out"}/share/foomatic"
    mkdir -p "${placeholder "out"}/share/cups/model"
    foomatic-compiledb -j "$NIX_BUILD_CORES" -d "${placeholder "out"}/share/cups/model/ptouch-driver"
  '';

  # compress ppd files
  postFixup = ''
    echo 'compressing ppd files'
    find -H "${placeholder "out"}/share/cups/model/ptouch-driver" -type f -iname '*.ppd' -print0  \
      | xargs -0r -n 4 -P "$NIX_BUILD_CORES" gzip -9n
  '';

  # Comments indicate the respective
  # package the command is contained in.
  ppdFileCommands = [
    "rastertoptch" # ptouch-driver
    "gs" # ghostscript
    "foomatic-rip" # cups-filters
  ];

  meta = with lib; {
    description = "Printer Driver for Brother P-touch and QL Label Printers";
    downloadPage = "https://github.com/philpem/printer-driver-ptouch";
    homepage = "https://github.com/philpem/printer-driver-ptouch";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ sascha8a ];
    platforms = platforms.linux;
    longDescription = ''
      This is ptouch-driver, a printer driver based on CUPS and foomatic,
      for the Brother P-touch and QL label printer families.
    '';
  };
}