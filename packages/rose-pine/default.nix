{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gtk-engine-murrine,
}:
stdenvNoCC.mkDerivation {
  pname = "rose-pine-gtk-theme";
  version = "unstable-2023-08-23";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Rose-Pine-GTK-Theme";
    rev = "95aa1f2b2cc30495b1fc5b614dc555b3eef0e27d";
    hash = "sha256-I9UnEhXdJ+HSMFE6R+PRNN3PT6ZAAzqdtdQNQWt7o4Y=";
  };

  propagatedUserEnvPkgs = [gtk-engine-murrine];

  installPhase = ''
    mkdir -p $out/share/themes/
    cp --archive themes/RosePine-Main-BL $out/share/themes/RosePine-Main-BL
  '';
}
