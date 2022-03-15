{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGoModule rec {
  pname = "http-server";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "romainDavaze";
    repo = "go-http-server";
    rev = "v${version}";
    sha256 = "";
  };

  vendorSha256 = "";

  proxyVendor = true;
}