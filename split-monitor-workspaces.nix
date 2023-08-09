{
  lib,
  stdenv,
  hyprland,
}:
stdenv.mkDerivation {
  pname = "split-monitor-workspaces";
  version = "1.0.0";
  src = ./split-monitor-workspaces/src;

  inherit (hyprland) nativeBuildInputs;

  buildInputs = [hyprland] ++ hyprland.buildInputs;

  meta = with lib; {
    homepage = "https://github.com/Duckonaut/split-monitor-workspaces";
    description = "Split monitor workspaces";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
