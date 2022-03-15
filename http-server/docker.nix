{ pkgs ? import <nixpkgs> { },
    server ? import ./default.nix { }
}:

pkgs.dockerTools.buildLayeredImage {
    name = "http-server";
    tag = "0.1.0";

    config.Cmd = [ "${server.out}/bin/${server.pname}" ];
}