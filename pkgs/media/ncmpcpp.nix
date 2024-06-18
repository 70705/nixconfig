{
  pkgs-unstable, 
  ... 
}:

{

  programs = {
    ncmpcpp = {
      enable = true;
      package = pkgs-unstable.ncmpcpp; 
    };
  };
}
