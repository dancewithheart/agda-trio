{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        defaultPackage = packages.agda-trio;
        packages = {
          agda-trio = pkgs.runCommand "agda-trio"
            {
              buildInputs = [
                pkgs.gnumake
                (pkgs.agda.withPackages (p: [ p.standard-library ]))
              ];
            }
            ''
              ln -s ${./Makefile} Makefile
              ln -s ${./agda-trio.agda-lib} agda-trio.agda-lib
              ln -s ${./src}/*.agda src
              mkdir -p $out
              ${pkgs.gnumake}/bin/make OUT_DIR=$out
            '';
        };
        checks = {
          build = self.defaultPackage."${system}";
        };
      }
    );
}
