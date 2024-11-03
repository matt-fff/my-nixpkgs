let
  pkgs = import <nixpkgs> {};
in

with pkgs;

{ lib ? pkgs.lib
, stdenv ? pkgs.stdenv
, makeWrapper ? pkgs.makeWrapper
, fetchurl ? pkgs.fetchurl
}:

let
  pname = "cursor-server";
  version = "0.42.4";
  commit = "b1e87884330fc271d5eb589e368c35f14e76dec0";
  os = "linux";
  arch = "x64";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://cursor.blob.core.windows.net/remote-releases/${version}-${commit}/vscode-reh-${os}-${arch}.tar.gz";
    hash = "sha256-TRwnnCfdAq7arvmbmd5kifdL0+IOQ2VvDgfocXE66Qc=";
  };

in stdenv.mkDerivation {
  inherit pname version src;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin $out/libexec/cursor-server
    tar -xzf $src --strip-components=1 -C $out/libexec/cursor-server
    ls -la $out/libexec/cursor-server
    ls -la $out/libexec/cursor-server/bin
    makeWrapper $out/libexec/cursor-server/node $out/bin/cursor-server
  '';

  meta = with lib; {
    description = "Remote server for the Cursor AI-first coding environment";
    homepage = "https://www.cursor.com/";
    license = licenses.unfree;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}
