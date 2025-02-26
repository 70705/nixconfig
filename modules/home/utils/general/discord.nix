{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.home.utils.discord;
in
{
  options.modules.home.utils.discord = {
    enable = lib.mkEnableOption "discord";
  };

  config = lib.mkIf cfg.enable {
    programs.nixcord = {
      enable = true;
      config = {
        frameless = true;
        plugins = {
          alwaysTrust.enable = true;
          callTimer.enable = true;
          clearURLs.enable = true;
          disableCallIdle.enable = true;
          fakeNitro.enable = true;
          fixImagesQuality.enable = true;
          fixYoutubeEmbeds.enable = true;
          forceOwnerCrown.enable = true;
          gameActivityToggle.enable = true;
          implicitRelationships.enable = true;
          messageLogger.enable = true;
          noTypingAnimation.enable = true;
          openInApp.enable = true;
          permissionFreeWill.enable = true;
          platformIndicators.enable = true;
          silentTyping.enable = true;
          spotifyCrack.enable = true;
          spotifyShareCommands.enable = true;
          typingIndicator.enable = true;
          userVoiceShow.enable = true;
          voiceMessages.enable = true;
          volumeBooster.enable = true;
          youtubeAdblock.enable = true;
          showHiddenChannels.enable = true;

          notificationVolume = {
            enable = true;
            notificationVolume = 25.00;
          };
        };
      };
    };
  };
}