{...}: {
  fileSystems."/media/gamedisk1" = {
    device = "/dev/disk/by-uuid/7CDC89CEDC8982DE";
    fsType = "ntfs3";
    options = ["async" "prealloc" "windows_names" "nocase" "nofail" "relatime" "rw" "uid=1000" "gid=100"];
  };

  fileSystems."/media/gamedisk2" = {
    device = "/dev/disk/by-uuid/D8129D31129D161A";
    fsType = "ntfs3";
    options = ["async" "prealloc" "windows_names" "nocase" "nofail" "relatime" "rw" "uid=1000" "gid=100"];
    #fsType = "lowntfs-3g";
    #options = [ "async" "big_writes" "nofail" "noatime" "rw" "uid=1000"];
  };
}
