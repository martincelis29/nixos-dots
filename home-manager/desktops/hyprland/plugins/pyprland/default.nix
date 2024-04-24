{
  lib,
  python3Packages,
  fetchPypi,
  poetry,
}:
python3Packages.buildPythonPackage rec {
  pname = "pyprland";
  version = "1.5.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-PHxHX9Ar58BBTVj9H8n74+gUMjRnPChwzpLdHZwrN70=";
  };

  format = "pyproject";

  buildInputs = [
    python3Packages.setuptools
    python3Packages.poetry-core
    poetry
  ];

  doCheck = false;
}
