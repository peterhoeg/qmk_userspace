{
  description = "QMK";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    localpkgs = {
      url = "gitlab:peterhoeg/pkgs";
      # url = "path:/home/peter/src/nix/pkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, localpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (localpkgs.packages.${system}) qmkfmt;
    in
    {
      devShells.${system} = {
        # This is impure, so load it with nix develop .#full --impure
        full = import ./shell.nix { };

        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            beadwork
            jq # config.mk pretty-prints the generated JSON with it
            just # the justfile is the entry point for everything
            llvmPackages.clang # for qmk format-c
            nushell # scripts/generate-keymap is written in it
            podman # much nicer than docker
            qmk # what we're here for
            qmkfmt # scripts/generate-keymap formats the generated C with it
            usbutils # lsusb, used by the justfile to detect the attached keyboard
            # qmk might have some additional py dependencies, so inject them
            # here. Not sure if it works with py 3.10, so stick to 3.9 for now
            # (python39Packages.python.withPackages (p: with p; [ pillow ]))
          ];
        };
      };
    };
}
