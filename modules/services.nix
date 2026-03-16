{config, pkgs, inputs, lib, ... }: {
  
  services = {
    #thermald
    thermald.enable = true;

    #Enable the OpenSSH Daemon
    openssh.enable = false;
    
    #enable warp daemons
    cloudflare-warp.enable = true;
      
    #mbpfan -- fan controller daemon for Apple Macs and MacBook
    mbpfan = {
      enable = true;
      aggressive = false;
      settings = {
        general = {
          low_temp = 63;  # If temperature is below this, fans will run at minimum speed.
          high_temp = 66; # If temperature is above this, fan speed will gradually increase.
          max_temp = 86; # If temperature is above this, fans will run at maximum speed.
        };
      };
    };
  };

  systemd.services.low-battery-notification = {
    description = "Running an low-battery-notification";
    wantedBy = [ "multi-user.target" ];
    
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash ${../dotfiles/shell/low-battery-notification.sh}";
      Type = "oneshot";
    };
  };

  systemd.timers.low-battery-notification = {
    description = "Run low-battery-notification every 5 minutes";
    wantedBy = [ "timers.target" ]; # This starts the timer on boot
    
    timerConfig = {
      OnBootSec = "2m";       # Wait 2 mins after boot before first run
      OnUnitActiveSec = "5m"; # Then run every 5 mins after that
      Unit = "low-battery-notification.service";
    };
  };
  #systemd.services."my-custom-service" = {
  #  description = "My Custom Shell Script Service";
  #  
  #  # Ensure the service starts after the network is up (optional)
  #  after = [ "network.target" ];
  #  wantedBy = [ "multi-user.target" ];
  #  
  #  serviceConfig = {
  #    Type = "simple";
  #    User = "root"; # Change to your username if root isn't needed
  #    Restart = "on-failure";
  #    RestartSec = "5s";
  #  };
  #  # This is where your .sh content goes
  #  script = ''
  #    #!/bin/sh
  #    echo "Service is starting..."
  #    ${pkgs.coreutils}/bin/mkdir -p /tmp/my-service
  #    while true; do
  #      echo "The time is $(date)" >> /tmp/my-service/log.txt
  #      sleep 60
  #    done
  #  '';
  #};
}