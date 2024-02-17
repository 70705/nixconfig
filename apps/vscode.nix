{ config, pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = [ pkgs.vscode-extensions.ms-python.python 
                   pkgs.vscode-extensions.enkia.tokyo-night
                   pkgs.vscode-extensions.esbenp.prettier-vscode
                   pkgs.vscode-extensions.formulahendry.code-runner ];
    userSettings = { "[python]"."editor.formatOnType" = "true";
                     "editor.formatOnSave" = "true";
                     "editor.defaultFormatter" = "esbenp.prettier-vscode";
                     "editor.largeFileOptimizations" =  "false";
                     "editor.fontSize" = 19;
                     "zenMode.centerLayout" = "false";
                     "zenMode.fullScreen" = "false";
                     "editor.glyphMargin" = "false";
                     "explorer.compactFolders" = "false";
                     "editor.minimap.enabled" = "false";
                     "python.analysis.typeCheckingMode" = "basic";
                     "code-runner.runInTerminal" =  "true";
                     "code-runner.clearPreviousOutput" = "true";
                     "code-runner.executorMap"."python" = "clear ; python -u";
                     "editor.fontLigatures" = "true";
                     "editor.fontVariations" = "true";
                     "editor.cursorBlinking" = "phase";
                     "editor.cursorSmoothCaretAnimation" = "on";
                     "editor.lineHeight" = 26;
                     "editor.lineNumbers" = "on";
                     "editor.bracketPairColorization.independentColorPoolPerBracketType" = "true";
                     "breadcrumbs.enabled" = "false";
                     "editor.smoothScrolling" = "true";
                     "workbench.editor.empty.hint" = "hidden";
                     "security.workspace.trust.untrustedFiles" = "open";
                     "editor.inlayHints.fontFamily" = "monospace";
                     "security.workspace.trust.enabled" = "false";
                     "workbench.editor.tabActionCloseVisibility" = "false";
                     "workbench.colorTheme" = "Tokyo Night";
          };
    };
}
