{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGoModule rec {
  pname = "go-http-server";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "romainDavaze";
    repo = "go-http-server";
    rev = "v${version}";
    sha256 = "sha256:1xxj8pvpjz0xlssbf09x1nppsy9rrrzxf2ynlxbjl30ljac8mmr5";
  };

  vendorSha256 = "sha256:1x1zw8j930midm77cjdr7bz6553lsdj83mvwslgk0501kg8z6w0x";

  proxyVendor = true;
}
