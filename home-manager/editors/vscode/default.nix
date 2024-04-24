{
  config,
  pkgs,
  lib,
  ...
}: let
  extensions = [
    # Themes
    "mvllow.rose-pine" # Rose Pine theme
    "oderwat.indent-rainbow" # Indent Rainbow
    "pkief.material-icon-theme" # Material Icon Theme
    "vscode-icons-team.vscode-icons" # VSCode Icons
    "miguelsolorio.fluent-icons" # Fluent Icons
    "rafamel.subtle-brackets" # Subtle Brackets
    "SirTori.indenticator" # Indenticator

    # Python
    "ms-python.python" # Python Language Support
    "ms-python.black-formatter" # Formatter
    "ms-python.vscode-pylance" # Pylance
    "ms-python.isort" # isort for Python Imports
    "ms-python.flake8" # Linting support
    "almenon.arepl" # real-time python scratchpad
    "littlefoxteam.vscode-python-test-adapter" # Python Test Adapter

    # Html/ Css/ JavaScript
    "dbaeumer.vscode-eslint" # Linter for JavaScript
    "mgmcdermott.vscode-language-babel" # JavaScript syntax highlighting
    "ecmel.vscode-html-css" # HTML/CSS Language Support
    "htmlhint.vscode-htmlhint" # Linter for HTML
    "formulahendry.auto-rename-tag" # Auto Rename Tag
    "formulahendry.auto-close-tag"
    "ritwickdey.liveserver" # Live Server
    "Zignd.html-css-class-completion" # HTML/CSS Class Completion
    "christian-kohler.npm-intellisense" # NPM Intellisense
    "wix.vscode-import-cost" # Import Cost
    "pflannery.vscode-versionlens" # Shows the latest version for each package

    # Nix
    "bbenoist.nix" # Nix Language Support
    "kamadorueda.alejandra" # Nix Code Formatter
    "jnoortheen.nix-ide" # Nix IDE

    # Tools
    "ms-azuretools.vscode-docker" # Docker Support
    "jock.svg" # SVG Language Support
    "redhat.vscode-xml" # XML Language Support
    "tamasfe.even-better-toml" # TOML Language Support
    "eww-yuck.yuck" # Yuck Language Support
    "aaron-bond.better-comments" # Better Comments
    "alefragnani.project-manager" # Project Manager
    "christian-kohler.path-intellisense" # Path Intellisense
    "eamodio.gitlens" # GitLens - Git Visualizer
    "esbenp.prettier-vscode" # Prettier Code Formatter
    "inferrinizzard.prettier-sql-vscode" # Prettier SQL Formatter
    "formulahendry.code-runner" # Code Runner
    "foxundermoon.shell-format" # Shell Format
    "ibm.output-colorizer" # Output Colorizer
    "kamikillerto.vscode-colorize" # Colorize
    "usernamehw.errorlens" # ErrorLens
    "hbenl.vscode-test-explorer" # Test Explorer
    "helixquar.randomeverything" # Random Everything
    "ms-dotnettools.vscode-dotnet-runtime" # .NET Runtime Support
    "ms-vscode.test-adapter-converter" # Test Adapter Converter
    "VisualStudioExptTeam.vscodeintellicode" # IntelliCode
    "VisualStudioExptTeam.intellicode-api-usage-examples" # IntelliCode API Examples
    "ms-vsliveshare.vsliveshare" # Live Share
    "ms-vscode.live-server" # Live Preview
  ];
  code-extensions = pkgs.writeShellScriptBin "code-extensions" ''
    for ext in ${toString extensions}; do
      code --install-extension "$ext"
      echo "                "
    done
  '';

  settingsJSON = builtins.readFile ./config/settings.json;
in {
  #*----------------------
  #* VSCODE CONFIGURATION
  #*----------------------
  home.packages = with pkgs; [
    code-extensions
  ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    # enableUpdateCheck = false;
    enableExtensionUpdateCheck = true;
    mutableExtensionsDir = true;
  };
  home.file.".config/Code/User/settings.json" = {
    text = settingsJSON;
  };
}
