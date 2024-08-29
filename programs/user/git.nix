{ pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName  = "joseporcar";
    userEmail = "joseaporcar@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}