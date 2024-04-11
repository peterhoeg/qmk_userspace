{
  description = "QMK";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        # This is impure, so load it with nix develop .#full --impure
        full = import ./shell.nix { };

        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            llvmPackages.clang # for qmk format-c
            podman # much nicer than docker
            qmk # what we're here for
            # qmk might have some additional py dependencies, so inject them
            # here. Not sure if it works with py 3.10, so stick to 3.9 for now
            # (python39Packages.python.withPackages (p: with p; [ pillow ]))
          ];
        };
      };
    };
}
