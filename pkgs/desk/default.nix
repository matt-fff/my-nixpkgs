{ pkgs ? import <nixpkgs> {},    
lib ? pkgs.lib, stdenv ? pkgs.stdenv,
blurlock ? pkgs.callPackage ../blurlock {},
... }:  

with pkgs;   
stdenv.mkDerivation {    
    pname = "desk";    
    version = "1";    
    src = ./src; # Folder src inside current folder that contains the script    
    dontBuild = true; # No build required       
    nativeBuildInputs = [ makeWrapper ];    
    buildInputs = [ ]; 

    installPhase = ''   
    # Create output directory in /nix/store
    mkdir -p $out/bin $out/bin/shell_plugins
    
    # Copy all things in ./src to output directory     
    cp -r ./shell_plugins $out/bin/shell_plugins
    install -t $out/bin ./desk
    '';   

  meta = with lib; {
    description = "A lightweight workspace manager for the shell";
    license = licenses.free;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}