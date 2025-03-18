{
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = false;

    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs; [
        vscode-extensions.ms-python.python
        vscode-extensions.enkia.tokyo-night
        vscode-extensions.esbenp.prettier-vscode
        vscode-extensions.formulahendry.code-runner
        vscode-extensions.jnoortheen.nix-ide
        vscode-extensions.kamadorueda.alejandra
        vscode-extensions.jeff-hykin.better-nix-syntax
      ];
      userSettings = {
        "[python]"."editor.formatOnSave" = true;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.formatterPath" = "alejandra";
        "nix.formatOnSave" = true;
        "zenMode.centerLayout" = false;
        "zenMode.fullScreen" = false;
        "explorer.compactFolders" = false;
        "python.analysis.typeCheckingMode" = "basic";
        "code-runner.runInTerminal" = true;
        "code-runner.clearPreviousOutput" = true;
        "code-runner.executorMap"."python" = "clear ; python -u";
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.largeFileOptimizations" = false;
        "editor.fontSize" = lib.mkForce 16;
        "window.titleBarStyle" = "custom";
        "editor.minimap.enabled" = false;
        "editor.glyphMargin" = false;
        "editor.fontLigatures" = true;
        "editor.fontVariations" = true;
        "editor.cursorBlinking" = "phase";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.lineHeight" = 26;
        "editor.lineNumbers" = "on";
        "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
        #"editor.inlayHints.fontFamily" = "monospace";
        "editor.smoothScrolling" = true;
        "breadcrumbs.enabled" = false;
        "security.workspace.trust.untrustedFiles" = "open";
        "security.workspace.trust.enabled" = false;
        "workbench.editor.empty.hint" = "hidden";
        "workbench.editor.tabActionCloseVisibility" = false;
        "workbench.startupEditor" = "none";
        "window.menuBarVisibility" = "hidden";
      };
    };
  };
}
