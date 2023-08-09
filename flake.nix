{
  description = "unofficial Hyprland Plugins";

  inputs.hyprland.url = "github:hyprwm/Hyprland";

  outputs = { 
    self,
    hyprland,
  }: let
    inherit (hyprland.inputs) nixpkgs;
    withPkgsFor = fn: nixpkgs.lib.genAttrs (builtins.attrNames hyprland.packages) (system: fn system nixpkgs.legacyPackages.${system});
  in {
    packages = withPkgsFor (system: pkgs: {
      split-monitor-workspaces = pkgs.callPackage ./split-monitor-workspaces.nix {inherit (hyprland.packages.${system}) hyprland;};
    });

    devShells = withPkgsFor (system: pkgs: {
      default = pkgs.mkshell {
        name = "unofficial-hyprland-plugins";
        buildInputs = [hyprland.packages.${system}.hyprland];
        inputsFrom = [hyprland.packages.${system}.hyprland];
      };
    });
  };
}
