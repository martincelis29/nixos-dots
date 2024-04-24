{
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation rec {
  pname = "material-icons-and-symbols";
  version = "unstable-2023-12-12";

  src = fetchFromGitHub {
    owner = "google";
    repo = "material-design-icons";
    rev = "102f1f83c640eaadc335edef6901eb2b0e6fa557";
    hash = "sha256-Vm6seheMCoaKA2+zkw36OLfWlKllMDDXXym+0TJSzC0=";
    sparseCheckout = ["font" "variablefont"];
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/woff2

    cp font/*.ttf $out/share/fonts/truetype
    cp font/*.otf $out/share/fonts/opentype
    cp variablefont/*.ttf $out/share/fonts/truetype
    cp variablefont/*.woff2 $out/share/fonts/woff2

    runHook postInstall
  '';
}
