{ config, pkgs, ... }:

{
  security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel"))
          return polkit.Result.YES;
      });
    '';
  security.sudo.wheelNeedsPassword = false;
}
