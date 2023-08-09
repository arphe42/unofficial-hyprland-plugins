{
  lib,
  stdenv,
  fetchFromGitHub,
  clang,
  hyprland,
}:
stdenv.mkDerivation {
  pname = "split-monitor-workspaces";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "Duckonaut";
    repo = " split-monitor-workspaces";
    rev = "1.0.0";
    sha256 = "sha256-8IH0WTPSaAundhYh4l7gQR66nyT38H4DstRTm+Xh+Z8=";
  };

  inherit (hyprland) nativeBuildInputs;

  buildInputs = [hyprland] ++ hyprland.buildInputs;

  buildPhase = "make all";

  meta = with lib; {
    homepage = "https://github.com/Duckonaut/split-monitor-workspaces";
    description = "Split monitor workspaces";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
