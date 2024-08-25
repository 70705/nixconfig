{ 
  inputs,
  ... 
}:

{
  imports = [ 
	./rnnoise.nix 
	inputs.nix-gaming.nixosModules.pipewireLowLatency
      ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    lowLatency = {
      enable = true;
      quantum = 1024;
      rate = 48000;
    };
  };
}

