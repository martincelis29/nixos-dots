{
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation rec {
  pname = "sn-pro";
  version = "unstable-2024-03-09";

  src = fetchFromGitHub {
    owner = "supernotes";
    repo = "sn-pro";
    rev = "b46e8965ca06dfd77fc0420c6f62bd02bc5f042a";
    hash = "sha256-9uxDElCzPPZVKEEkDnNfMyVbimyAPNAzzGKlEt+B1S0=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/woff2

    cp exports/SNPro/*.otf $out/share/fonts/opentype
    cp exports/SNPro/*.woff2 $out/share/fonts/woff2

    runHook postInstall
  '';
}
