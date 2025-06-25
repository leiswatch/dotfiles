user_user_pref("browser.download.useDownloadDir", true);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.startup.page", 3);
user_pref("browser.tabs.hoverPreview.showThumbnails", false);
user_pref("browser.translations.automaticallyPopup", false);
user_pref("browser.translations.enable", true);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.warnOnQuitShortcut", true);

user_pref("general.autoScroll", true);
user_pref("middlemouse.paste", false);

user_pref("full-screen-api.warning.timeout", 0);
user_pref("full-screen-api.warning.delay", 0);

user_pref("identity.fxaccounts.enabled", true);

user_pref("intl.regional_prefs.use_os_locales", true);

user_pref("layout.spellcheckDefault", 0);

user_pref("media.eme.enabled", true);
user_pref("media.peerconnection.enabled", false);
user_pref("media.autoplay.blocking_policy", 0);

user_pref("network.trr.mode", 2);
user_pref("network.trr.uri", "https://dns.mullvad.net/dns-query");
user_pref("network.trr.default_provider_uri", "https://doh.dns4all.eu/dns-query"); // Define a fallback DoH server (used only in mode 1)
user_pref("network.trr.strict_native_fallback", false); // Allow native fallback
user_pref("network.trr.retry_on_recoverable_errors", true); // Retry on recoverable errors
user_pref("network.trr.disable-heuristics", true); // Disables the canary telemetry detection request "use-application-dns.net" for DOH
user_pref("network.trr.allow-rfc1918", true); // Allows the use of private IP addresses (RFC 1918) in DOH responses

user_pref("privacy.clearOnShutdown.downloads", false);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false);
user_pref("privacy.resistFingerprinting", false);
user_pref("privacy.resistFingerprinting.letterboxing", false);

user_pref("ui.key.menuAccessKey", 9999);
user_pref("ui.key.menuAccessKeyFocuses", false);

user_pref("webgl.disabled", false);

// Smoothfox recommended for 90hz+ displays
user_pref("apz.overscroll.enabled", true); // DEFAULT NON-LINUX
user_pref("general.smoothScroll", true); // DEFAULT
user_pref("general.smoothScroll.msdPhysics.enabled", true);
user_pref("mousewheel.default.delta_multiplier_y", 300); // 250-400; adjust this number to your liking

// Fastfox
user_pref("content.notify.interval", 100000);
user_pref("gfx.canvas.accelerated.cache-size", 512); // default=256; Chrome=512
user_pref("gfx.content.skia-font-cache-size", 20); // default=5; Chrome=250
user_pref("browser.cache.disk.enable", false);
user_pref("browser.sessionhistory.max_total_viewers", 4);
user_pref("media.memory_cache_max_size", 65536); // default=8192; AF=65536; alt=131072
user_pref("media.cache_readahead_limit", 7200); // 120 min; default=60; stop reading ahead when our buffered data is this many seconds ahead of the current playback
user_pref("media.cache_resume_threshold", 3600); // 60 min; default=30; when a network connection is suspended, dont resume it until the amount of buffered data falls below this cache_resume_threshold

user_pref("image.mem.decode_bytes_at_a_time", 32768); // default=16384; alt=65536; chunk size for calls to the image decoders

user_pref("network.http.max-connections", 1800); // default=900
user_pref("network.http.max-persistent-connections-per-server", 10); // default=6; download connections; anything above 10 is excessive
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5); // default=3

user_pref("network.http.pacing.requests.enabled", false);
user_pref("network.dnsCacheExpiration", 3600); // keep entries for 1 hour
user_pref("network.ssl_tokens_cache_capacity", 10240); // default=2048; more TLS token caching (fast reconnects)

user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true); // [FF127+ false]
user_pref("browser.urlbar.speculativeConnect.enabled", false);

user_pref("browser.places.speculativeConnect.enabled", false);
user_pref("network.prefetch-next", false);
user_pref("network.predictor.enabled", false);
user_pref("layout.css.grid-template-masonry-value.enabled", true);

// Securefox
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.download.start_downloads_in_tmp_dir", true); // [FF102+]
user_pref("browser.helperApps.deleteTempFileOnExit", true)
user_pref("browser.uitour.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("security.OCSP.enabled", 0);
user_pref("security.pki.crlite_mode", 2);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("security.tls.enable_0rtt_data", false);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("browser.sessionstore.interval", 60000);
user_pref("browser.privatebrowsing.resetPBM.enabled", true);
user_pref("privacy.history.custom", true);
user_pref("browser.urlbar.trimHttps", true);
user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
user_pref("browser.urlbar.update2.engineAliasRefresh", true); // HIDDEN
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.groupLabels.enabled", false);
user_pref("browser.formfill.enable", false);
user_pref("network.IDN_show_punycode", true);
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.privateBrowsingCapture.enabled", false);
user_pref("network.auth.subresource-http-auth-allow", 1);
user_pref("editor.truncate_user_pastes", false);
user_pref("security.mixed_content.block_display_content", true);
user_pref("pdfjs.enableScripting", false);
user_pref("extensions.enabledScopes", 5);
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
user_pref("privacy.userContext.ui.enabled", true);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
user_pref("browser.search.update", false);
user_pref("permissions.manager.defaultsUrl", "");
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("datareporting.usage.uploadEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);

