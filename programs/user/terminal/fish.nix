{ pkgs, inputs, config, ...}:
let 
  base = config.lib.stylix.colors.base00;
  mantle = config.lib.stylix.colors.base01;
  dark = config.lib.stylix.colors.base02;
  mid = config.lib.stylix.colors.base03;
  light = config.lib.stylix.colors.base04;
  text = config.lib.stylix.colors.base05;
  rosewater = config.lib.stylix.colors.base06;
  lavender = config.lib.stylix.colors.base07;
  red = config.lib.stylix.colors.base08;
  peach = config.lib.stylix.colors.base09;
  yellow = config.lib.stylix.colors.base0A;
  green = config.lib.stylix.colors.base0B;
  teal = config.lib.stylix.colors.base0C;
  blue = config.lib.stylix.colors.base0D;
  mauve = config.lib.stylix.colors.base0E;
  flamingo = config.lib.stylix.colors.base0F;

  test = "000000";
in
{
  stylix.targets.fish.enable = false;
  programs.fish = {
    enable = true;  

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];

    functions = {
      fish_prompt = {
        body = ''string join "" -- (set_color ${teal}) (prompt_pwd -D 2) (set_color ${flamingo})" >> "'';
      };
      fish_greeting = {
        body = ''
          echo "Hey there $(set_color ${flamingo})$hostname $(set_color ${text})"
          echo "It's $(set_color ${blue}; date +%T)$(set_color ${text}), feeling productive?"
          '';
      };
    };

    # I got the base from this from https://github.com/catppuccin/fish/blob/main/themes/Catppuccin%20Macchiato.theme
    # I them modified slightly to make it more nixy I guess??
    interactiveShellInit = ''
      set --universal fish_color_normal ${text}
      set --universal fish_color_command ${mauve}
      set --universal fish_color_param ${teal}
      set --universal fish_color_keyword ${blue}
      set --universal fish_color_quote ${green}
      set --universal fish_color_redirection ${peach}
      set --universal fish_color_end ${peach}
      set --universal fish_color_comment ${light}
      set --universal fish_color_error ${red}
      set --universal fish_color_selection --background=${rosewater}
      set --universal fish_color_selection ${base}
      set --universal fish_color_search_match --background=${rosewater}
      set --universal fish_color_option ${yellow}
      set --universal fish_color_operator ${peach}
      set --universal fish_color_escape ${yellow}
      set --universal fish_color_autosuggestion ${lavender}
      set --universal fish_color_cancel ${red}
      set --universal fish_color_cwd ${teal}
      set --universal fish_color_host_remote ${test}
      set --universal fish_color_status ${red}
      set --universal fish_pager_color_progress ${text}
      set --universal fish_pager_color_prefix ${red}
      set --universal fish_pager_color_completion ${lavender}
      set --universal fish_pager_color_description ${flamingo}
    '';
  };
}