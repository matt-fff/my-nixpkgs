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
    rev = "1.1.16";
    hash = "sha256-M/3mqO7G2E5NW2uE+X8P4UhEl0r1fPXuxyb1NowJQnY=";
  };

  cargoHash = "sha256-XncjvmjqxfSxZnf/N7/NXfctuF0OGmwklZh57HWWKSI=";

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
