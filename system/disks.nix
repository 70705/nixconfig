{ config, lib, pkgs, ... }:

{

  fileSystems."/media/gamedisk1" =
    { device = "/dev/disk/by-uuid/7CDC89CEDC8982DE";
      fsType = "lowntfs-3g"; 
      options = [ "async" "big_writes" "nofail" "noatime" "rw" "uid=1000"];
    };

  fileSystems."/media/gamedisk2" =
    { device = "/dev/disk/by-uuid/D8129D31129D161A";
      fsType = "lowntfs-3g"; 
      options = [ "async" "big_writes" "nofail" "noatime" "rw" "uid=1000"];
    };
}
