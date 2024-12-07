{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "hyprland-autoname-workspaces";
  version = "1.1.16rc1";

  src = fetchFromGitHub {
    owner = "matt-fff";
    repo = "hyprland-autoname-workspaces";
    rev = "mw/name-cache";
    hash = "sha256-DRrYehE7BwRNQST+Fh3kct4WNR75s763I2Y1R4yVHNE=";
  };

  cargoHash = "sha256-X/1ZDGtL5xN9g+2YiXwuMg4hGURVLlX8YZzfgP3ipmc=";

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