{ ... }:

{
  programs.gallery-dl = {
    enable = true;
    settings = {
      extractor.base-directory = "~/gallery-dl";
    };
  };
}
