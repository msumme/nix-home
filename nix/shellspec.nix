{ pkgs ? import <nixpkgs> { }, fetchFromGitHub ? pkgs.fetchFromGitHub
, lib ? pkgs.lib, stdenv ? pkgs.stdenv }:
stdenv.mkDerivation rec {
    pname = "shellspec";
    version = "0.28.1";
    buildInputs = [ pkgs.bash pkgs.coreutils pkgs.shellcheck pkgs.ps ];
    buildPhase = ":";
    installPhase = ''
      make install PREFIX="$out"
   '';
   src = fetchFromGitHub {
     owner = "shellspec";
     repo = pname;
     rev = "${version}";
     sha256 = "1ib5qp29f2fmivwnv6hq35qhvdxz42xgjlkvy0i3qn758riyqf46";
   };
   meta = with lib; {
     description = "shellspec";
     homepage = "https://github.com/shellspec/shellspec";
     license = licenses.mit;
   };
 }
