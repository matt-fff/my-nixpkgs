{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  lz4,
  libxkbcommon,
  installShellFiles,
  scdoc,
}:

rustPlatform.buildRustPackage rec {
  pname = "swww";
  version = "master";

  RUSTC_VERSION = "1.80.0";

  src = fetchFromGitHub {
    owner = "LGFae";
    repo = "swww";
    rev = "0db3f4eb192f1c9bf914efcc1d2aba809da5d78a";
    hash = "sha256-+8YUJsNzvgAeZYLfbHYfYlad/iS+6Eec/LWzL1ZIGfY=";
  };


  cargoHash = "sha256-0pqLyGPzTQv69RtexiNxRy8TuGHEOpuIxOkIs+6dsUc=";

  buildInputs = [
    lz4
    libxkbcommon
  ];

  doCheck = false; # Integration tests do not work in sandbox environment

  nativeBuildInputs = [
    pkg-config
    installShellFiles
    scdoc
  ];

  postInstall = ''
    for f in doc/*.scd; do
      local page="doc/$(basename "$f" .scd)"
      scdoc < "$f" > "$page"
      installManPage "$page"
    done

    installShellCompletion --cmd swww \
      --bash completions/swww.bash \
      --fish completions/swww.fish \
      --zsh completions/_swww
  '';

  meta = {
    description = "Efficient animated wallpaper daemon for wayland, controlled at runtime";
    homepage = "https://github.com/LGFae/swww";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [
      mateodd25
      donovanglover
    ];
    platforms = lib.platforms.linux;
    mainProgram = "swww";
  };
}