# PLEASE READ THE WIKI FOR DETERMINING
# WHAT TO PUT HERE AS OPTIONS. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  # THINGS YOU NEED TO CHANGE
  username = "marvin";
  hostname = "nixos";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/marvinos";
  waybarStyle = "default"; # simplebar, slickbar, slickbar-num, or default
in {
  # User Variables
  username = "${username}";
  hostname = "${hostname}";
  gitUsername = "martin-gif";
  # gitEmail = "tylerzanekelley@gmail.com";
  # theme = "gigavolt";
  borderAnim = true;
  browser = "firefox";
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  flakeDir = "${flakeDir}";

  # System Settings
  clock24h = true;
  theLocale = "de_DE.UTF-8";
  theKBDLayout = "de";
  theSecondKBDLayout = "de";
  theKBDVariant = "";
  theLCVariables = "de_DE.UTF-8";
  theTimezone = "Europe/Berlin";
  theShell = "zsh"; 
  theKernel = "zen"; # Possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "x11"; # Either x11 or wayland ONLY. Games might require x11 set here
  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  cpuType = "intel";
  gpuType = "amd";

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS! 
  intel-bus-id = "PCI:0:2:0";
  nvidia-bus-id = "PCI:14:0:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # NTP & HWClock Settings
  ntp = true;
  localHWClock = false;

  # Enable Printer & Scanner Support
  printer = false;

  # Enable Terminals
  # If You Disable All You Get Kitty
  wezterm = true;
  alacritty = false;
  kitty = true;

  # Enable Python & PyCharm
  python = false;
  
  # Enable SyncThing
  syncthing = false;

}
