{
  pkgs-unstable, 
  ... 
}:

{

  programs = {
    ncmpcpp = {
      enable = true;
      packages = pkgs-unstable.ncmpcpp; 
    };
  };
}
