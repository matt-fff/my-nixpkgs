let
  pkgs = import <nixpkgs> {};
in

with pkgs;

{ lib ? pkgs.lib
, stdenv ? pkgs.stdenv
, makeWrapper ? pkgs.makeWrapper
, fetchurl ? pkgs.fetchurl
, appimageTools ? pkgs.appimageTools
, fuse ? pkgs.fuse
}:

let
  pname = "cursor";
  version = "0.42.4";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://download.todesktop.com/230313mzl4w4u92/cursor-${version}-build-2410291z3bdg1dy-x86_64.AppImage";
    sha256 = "0dwlz9bbas257dkviiqry5njighc24c3bc93fri143pwhi1rngh8";
  };

  appimageContents = appimageTools.extractType2 {
    inherit name src;
  };

in appimageTools.wrapType2 {
  inherit name src;

  extraInstallCommands = ''
    # Install desktop file
    mkdir -p $out/share/applications
    cp ${appimageContents}/cursor.desktop $out/share/applications/${pname}.desktop
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'

    # Install icon
    mkdir -p $out/share/icons/hicolor/512x512/apps
    cp ${appimageContents}/cursor.png $out/share/icons/hicolor/512x512/apps/${pname}.png
  '';

  meta = with lib; {
    description = "AI-first coding environment";
    homepage = "https://www.cursor.com/";
    license = licenses.unfree;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}
