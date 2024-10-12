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
      sha256 = "0p62v7lday01hrh361gy440agrnp4s8rqhnk6v3kz33ln1ag1nqf";
    };

    description = "Rhythm-based aim game";
    homepage = "https://github.com/David20122/sound-space-plus";
    platforms = [ "x86_64-linux" ];

    buildInputs = [ pkgs.unzip ];

    unpackPhase = ''
      mkdir -p $out
      unzip $src -d $out
    '';

    installPhase = ''
            mkdir -p $out/bin
            mv $out/SoundSpacePlus.x86_64 $out/bin/SoundSpacePlus
            chmod +x $out/bin/SoundSpacePlus
            mv $out/*.so $out/bin
            mv $out/*.pck $out/bin
            mkdir -p $out/share/applications
            cat > $out/share/applications/soundspaceplus.desktop <<EOF
      [Desktop Entry]
      Name=SoundSpacePlus
      Exec=$out/bin/SoundSpacePlus
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
