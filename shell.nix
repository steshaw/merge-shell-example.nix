{ sources ? import ./nix/sources.nix
, nixpkgs ? import sources.nixpkgs { overlays = [ ]; config = { }; }
}:
nixpkgs.mkShell {
  inputsFrom = [
    (import ./fe/shell.nix { pkgs = nixpkgs; })
    (import ./be/shell.nix { pkgs = nixpkgs; })
  ];
}
