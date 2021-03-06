{ config, pkgs, ... }:
  {
    networking.hostName = "kocka";

    # Use the systemd-boot efi boot loader.
    imports = [ ../../modules/systemd-boot.nix ];

    # Need to allow for nix-serve to work
    networking.firewall.allowedTCPPorts = [ 5000 ];

    services = {
      fstrim.enable = true;

      sshd.enable = true;

      foldingathome = {
        enable = true;
        user = "cumber";
      };

      nix-serve = {
        enable = true;
        secretKeyFile = "/etc/nixos/secrets/nix-serve.sec";
      };

      # Use proprietary nvidia driver
      xserver = {
        videoDrivers = [ "nvidia" ];

        screenSection = ''
          Option         "metamodes" "DP-2: nvidia-auto-select +1200+240 {AllowGSYNCCompatible=On}, DP-4: nvidia-auto-select +0+0 {rotation=left}"
        '';

        xrandrHeads = [
          {
            output = "DP-4";
            monitorConfig = ''Option "Rotate" "left"'';
          }
          {
            output = "DP-2";
            primary = true;
            monitorConfig = ''Option "RightOf" "DP-4"'';
          }
        ];
      };
    };

    virtualisation.docker.enable = true;

    # Set your time zone.
    time.timeZone = "Pacific/Auckland";
  }
