{ pkgs, inputs, ... }:

{
    #programs.browserpass.enable = true;
    programs.firefox = {
        enable = true;
        profiles.default = {
            id = 0;
            name = "default";
            settings = {
                # Enable HTTPS-Only Mode
                "dom.security.https_only_mode" = true;
                "dom.security.https_only_mode_ever_enabled" = true;
                # Privacy settings
                "privacy.donottrackheader.enabled" = true;
                "privacy.trackingprotection.enabled" = true;
                "privacy.trackingprotection.socialtracking.enabled" = true;
                "privacy.partition.network_state.ocsp_cache" = true;
                # Disable all sorts of telemetry
                "browser.newtabpage.activity-stream.feeds.telemetry" = false;
                "browser.newtabpage.activity-stream.telemetry" = false;
                "browser.ping-centre.telemetry" = false;
                "toolkit.telemetry.archive.enabled" = false;
                "toolkit.telemetry.bhrPing.enabled" = false;
                "toolkit.telemetry.enabled" = false;
                "toolkit.telemetry.firstShutdownPing.enabled" = false;
                "toolkit.telemetry.hybridContent.enabled" = false;
                "toolkit.telemetry.newProfilePing.enabled" = false;
                "toolkit.telemetry.reportingpolicy.firstRun" = false;
                "toolkit.telemetry.shutdownPingSender.enabled" = false;
                "toolkit.telemetry.unified" = false;
                "toolkit.telemetry.updatePing.enabled" = false;
                # As well as Firefox 'experiments'
                "experiments.activeExperiment" = false;
                "experiments.enabled" = false;
                "experiments.supported" = false;
                "network.allow-experiments" = false;
            };
            bookmarks = { };
            extensions = with inputs.firefox-addons.packages."${pkgs.system}"; [
                keepassxc-browser
                ublock-origin
            ];
        };
    };
}
