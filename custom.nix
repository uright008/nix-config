{ config, pkgs, ... }:
{
  # ALSA
  hardware.alsa.controls.FreeDSP.maxVolume = -100;
}
