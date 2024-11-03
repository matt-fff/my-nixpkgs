{ pkgs ? import <nixpkgs> {},    
lib ? pkgs.lib, stdenv ? pkgs.stdenv, ... }:  

with pkgs;   
stdenv.mkDerivation {    
    pname = "blurlock";    
    version = "1";    
    src = ./src; # Folder src inside current folder that contains the script    
    dontBuild = true; # No build required       
    nativeBuildInputs = [ makeWrapper ];    
    buildInputs = [ i3lock imagemagick ]; 

    installPhase = ''   
    # Create output directory in /nix/store
    mkdir -p $out/bin
    # Copy all things in ./src to output directory     
    install -t $out/bin ./*
    '';   

  meta = with lib; {
    description = "i3 lock script";
    license = licenses.free;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}