{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modules.system.gaming.soundspaceplus;
  soundspaceplus = pkgs.stdenv.mkDerivation {
    pname = "soundspaceplus";
    version = "latest";
    src = pkgs.fetchurl {
      url = "https://github.com/David20122/sound-space-plus/releases/latest/download/linux.zip";
      sha256 = "0q9kdw7fczrp0q21h1d2m76qcgw1b44aqkr66dy4i3q1gdwn8gnv";
    };

    description = "Rhythm-based aim game";
    homepage = "https://github.com/David20122/sound-space-plus";
    platforms = [ "x86_64-linux" ];

    buildInputs = with pkgs; [ unzip ];

    unpackPhase = ''
      mkdir -p $out
      unzip $src -d $out
    '';

    installPhase = ''
      mkdir -p $out/bin
      mv $out/SoundSpacePlus.x86_64 $out/bin/SoundSpacePlus
      mv $out/*.{so,pck} $out/bin
      chmod +x $out/bin/SoundSpacePlus
      mkdir -p $out/share/applications
      mkdir -p $out/share/icons

      cp ${./icon.png} $out/share/icons/soundspaceplus.png

      cat > $out/share/applications/soundspaceplus.desktop <<EOF
      [Desktop Entry]
      Name=SoundSpacePlus
      Exec=$out/bin/SoundSpacePlus
      Icon=$out/share/icons/soundspaceplus.png
      Type=Application
      EOF
    '';
  };
in
{
  options.modules.system.gaming.soundspaceplus = {
    enable = lib.mkEnableOption "soundspaceplus";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ soundspaceplus ];
  };
}
