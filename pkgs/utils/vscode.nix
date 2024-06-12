{
  pkgs,
  pkgs-unstable,
  ... 
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = [ pkgs.vscode-extensions.ms-python.python 
                   pkgs.vscode-extensions.enkia.tokyo-night
                   pkgs.vscode-extensions.wakatime.vscode-wakatime
                   pkgs.vscode-extensions.esbenp.prettier-vscode
                   pkgs.vscode-extensions.formulahendry.code-runner
                   pkgs.vscode-extensions.jnoortheen.nix-ide
                   pkgs-unstable.vscode-extensions.asvetliakov.vscode-neovim ];
    userSettings = { "[python]"."editor.formatOnSave" = true;
		     "nix.enableLanguageServer" = true;
		     "nix.serverPath" = "nil";
                     "zenMode.centerLayout" = false;
                     "zenMode.fullScreen" = false;
                     "explorer.compactFolders" = false;
                     "python.analysis.typeCheckingMode" = "basic";
                     "code-runner.runInTerminal" = true;
                     "code-runner.clearPreviousOutput" = true;
                     "code-runner.executorMap"."python" = "clear ; python -u";
                     "editor.formatOnSave" = true;
                     "editor.defaultFormatter" = "esbenp.prettier-vscode";
                     "editor.largeFileOptimizations" =  false;
                     "editor.fontSize" = 19;
                     "editor.minimap.enabled" = false;
                     "editor.glyphMargin" = false;
                     "editor.fontLigatures" = true;
                     "editor.fontVariations" = true;
                     "editor.cursorBlinking" = "phase";
                     "editor.cursorSmoothCaretAnimation" = "on";
                     "editor.lineHeight" = 26;
                     "editor.lineNumbers" = "on";
                     "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
                     "editor.inlayHints.fontFamily" = "monospace";
                     "editor.smoothScrolling" = true;
                     "breadcrumbs.enabled" = false;
                     "security.workspace.trust.untrustedFiles" = "open";
                     "security.workspace.trust.enabled" = false;
                     "workbench.editor.empty.hint" = "hidden";
                     "workbench.editor.tabActionCloseVisibility" = false;
                     "workbench.colorTheme" = "Tokyo Night";
		                 "workbench.startupEditor" = "none";
                     "window.menuBarVisibility" = "hidden";
                     "extensions.experimental.affinity"."asvetliakov.vscode-neovim" = 1;
          };
    };
}
