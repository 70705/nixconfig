{
  pkgs, 
  ... 
}:

{

  programs = {
    ncmpcpp = {
      enable = true;
      package = pkgs.ncmpcpp; 
    };
  };
}
