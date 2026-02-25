{ config, pkgs, ... }:

{
  home.username = "uright";
  home.homeDirectory = "/home/uright";

  home.packages = with pkgs;[
    # 如下是我常用的一些命令行工具，你可以根据自己的需要进行增删
    neofetch
    nnn

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses
    clash-verge-rev # proxy tools for bypasing GFW

    # misc
    microsoft-edge
    synology-drive-client
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    alsa-utils

    # media
    audacious
    audacious-plugins
    vlc
    mpv

    # SMS
    telegram-desktop
    qq
    wechat

    # java
    zulu
    gradle

    # game
    steam
    lutris
    protontricks
    wine-staging
    hmcl

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
    vscode # editer

    # monitoring
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one # markdown support
      ms-python.python
      ms-vscode.cpptools-extension-pack
      esbenp.prettier-vscode
      ms-azuretools.vscode-docker
      twxs.cmake
      redhat.java
      eamodio.gitlens
      ms-vscode-remote.remote-ssh
      jnoortheen.nix-ide
    ];
  };
  programs.starship = {
    enable = true;
    # 自定义配置
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
  programs.git = {
    enable = true;
    settings.user = {
        name = "Qing Xu";
        email = "admin@uright.icu";
    };
    signing = {
      signByDefault = true;
      key = "7FC8941B14BFC9DE";
    };
  };
  services = {
      ## Enable gpg-agent with ssh support
      gpg-agent = {
        enable = true;
        enableSshSupport = true;
        enableZshIntegration = true;
        # pinentry is a collection of simple PIN or passphrase dialogs used for
        # password entry
        pinentryPackage = pkgs.pinentry-qt;
      };
    };
  home.stateVersion = "25.11"; # You can update Home Manager without changing this value
}
