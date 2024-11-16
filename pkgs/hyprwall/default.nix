{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  glib,
  pango,
  cairo,
  gtk4,
  wrapGAppsHook4,
  gtk3,
  gdk-pixbuf,
}:

rustPlatform.buildRustPackage rec {
  pname = "hyprwall";
  version = "0.1.8";

  src = fetchFromGitHub {
    owner = "hyprutils";
    repo = "hyprwall";
    rev = "refs/tags/v${version}";
    hash = "sha256-dzPd+5cws3hKhdd1CKKEO7EWMS0XW0y1vqxg1XKX+gY=";
  };

  cargoHash = "sha256-gT2ysWHckcUl1yx5tciy6kSvZZ0srrs4OwI1mr/58Pc=";

  strictDeps = true;

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook4
  ];
  buildInputs = [
    glib
    cairo
    pango
    gtk4
    gtk3
    gdk-pixbuf
  ];

  postInstall = ''
    install -Dm644 -t $out/usr/share/icons hyprwall.png
    install -Dm644 -t $out/usr/share/applications hyprwall.desktop
  '';

  meta = {
    description = "GUI for setting wallpapers with hyprpaper, swww, swaybg, wallutils, and feh.";
    homepage = "https://github.com/hyprutils/hyprwall";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ matt-fff ];
    badPlatforms = lib.platforms.darwin;
    mainProgram = "hyprwall";
  };
}
