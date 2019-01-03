{ pkgs ? import ./nixpkgs.nix {} }: with pkgs;

stdenvNoCC.mkDerivation {
  name = "flatpak-runtime";
  buildInputs = [ flatpak ];
}
