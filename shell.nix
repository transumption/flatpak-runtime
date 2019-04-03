{ pkgs ? import ./pkgs.nix {} }: with pkgs;

stdenvNoCC.mkDerivation {
  name = "flatpak-runtime";
  buildInputs = [ flatpak ];
}
