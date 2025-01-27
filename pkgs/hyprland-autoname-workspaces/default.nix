{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "hyprland-autoname-workspaces";
  version = "1.1.16rc1";

  src = fetchFromGitHub {
    owner = "hyprland-community";
    repo = "hyprland-autoname-workspaces";
    rev = "main";
    hash = "sha256-ukP+v0MmK6S9T2b+/qZeSwagSJufNU83/uKruNK16zk=";
  };

  cargoHash = "sha256-uhnTe6yQc8fFCzXRWfyu6ft254nk/A7jsDlttg7nQ78=";

  doCheck = false;

  meta = with lib; {
    description = "Automatically rename workspaces with icons of started applications";
    homepage = "https://github.com/hyprland-community/hyprland-autoname-workspaces";
    license = licenses.isc;
    maintainers = with maintainers; [ donovanglover ];
    mainProgram = "hyprland-autoname-workspaces";
    platforms = platforms.linux;
  };
}