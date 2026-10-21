{ stdenv, lib, ... }:

let
  src = builtins.fetchGit {
    url = "https://github.com/DogeTheBeast/sidebery.git";
    ref = "custom-release-ci";
    shallow = true;
  };
  addonId = "{3c078156-979c-498b-8990-85f7987dd929}";
in
stdenv.mkDerivation {
  pname = "Sidebery";
  version = "latest";

  src = src;

  installPhase = ''
    mkdir -p $out/share/mozilla/extensions
    cp ${src}/releases/sidebery.xpi $out/share/mozilla/extensions/${addonId}.xpi
  '';
  meta = {
    description = "DogeTheBeast's fork of Sidebery";
    homepage = "https://github.com/DogeTheBeast/sidebery";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
