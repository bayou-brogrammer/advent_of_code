let
  pkgs = import <nixpkgs> {};
  # choose the ocaml version you want to use
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_1;
in
  pkgs.mkShell {
    # build tools
    nativeBuildInputs = with ocamlPackages; [ocaml findlib dune_3 ocaml-lsp ocamlPackages.core];

    # dependencies
    buildInputs = with ocamlPackages; [ocamlgraph];
  }
