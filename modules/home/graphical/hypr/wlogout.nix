{ 
  pkgs,
  ... 
}:

{
  programs.wlogout = {
    enable = true;
    style = ''
          * {
              background-image: none;
              box-shadow: none;
          }

          window {
              background-color: rgba(12, 12, 12, 0.9);
          }

          button {
              border-radius: 0;
              border-color: black;
              text-decoration-color: #FFFFFF;
              color: #FFFFFF;
              background-color: #222222;
              border-style: solid;
              border-width: 1px;
              background-repeat: no-repeat;
              background-position: center;
              background-size: 25%;
          }

          button:focus, button:active, button:hover {
              background-color: #121212;
              outline-style: none;
          }

          #lock {
              background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"), url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
          }

          #logout {
              background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"), url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
          }

          #suspend {
              background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"), url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
          }

          #hibernate {
              background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"), url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
          }

          #shutdown {
              background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"), url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
          }

          #reboot {
              background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"), url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
          }
    '';
  };
}