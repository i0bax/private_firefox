#!/bin/bash

##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal


echo -e "\n\n ${GREEN}[+]${RESET} Configuring ${GREEN} Firefox ${RESET}"

timeout 15 firefox >/dev/null 2>&1                # Start and kill. Files needed for first time run
timeout 5 killall -9 -q -w firefox-esr >/dev/null
file=$(find ~/.mozilla/firefox/*.default*/ -maxdepth 1 -type f -name 'prefs.js' -print -quit)
[ -e "${file}" ] && cp -n $file{,.bkup}   #/etc/firefox-esr/pref/*.js

([[ -e "${file}" && "$(tail -c 1 ${file})" != "" ]]) && echo >> "${file}"	
sed -i 's/^.*browser.startup.page.*/user_pref("browser.startup.page", 0);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.startup.page", 0);' >> "${file}"
sed -i 's/^.*privacy.donottrackheader.enabled.*/user_pref("privacy.donottrackheader.enabled", true);' "${file}" 2>/dev/null \
  || echo 'user_pref("privacy.donottrackheader.enabled", true);' >> "${file}"
sed -i 's/^.media.peerconnection.enabled/user_pref("media.peerconnection.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("media.peerconnection.enabled", false);' >> "${file}"
sed -i 's/^.privacy.resistFingerprinting/user_pref("privacy.resistFingerprinting", true);' "${file}" 2>/dev/null \
  || echo 'user_pref("privacy.resistFingerprinting", true);' >> "${file}"
sed -i 's/^.security.ssl3.rsa_des_ede3_sha/user_pref("security.ssl3.rsa_des_ede3_sha", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("security.ssl3.rsa_des_ede3_sha", false);' >> "${file}"
sed -i 's/^.security.ssl.require_safe_negotiation/user_pref("security.ssl.require_safe_negotiation", true);' "${file}" 2>/dev/null \
  || echo 'user_pref("security.ssl.require_safe_negotiation", true);' >> "${file}"
sed -i 's/^.security.tls.version.min/user_pref("security.tls.version.min", 3);' "${file}" 2>/dev/null \
  || echo 'user_pref("security.tls.version.min", 3);' >> "${file}"
sed -i 's/^.security.tls.enable_0rtt_data/user_pref("security.tls.enable_0rtt_data", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("security.tls.enable_0rtt_data", false);' >> "${file}"
sed -i 's/^.browser.formfill.enable/user_pref("browser.formfill.enable", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.formfill.enable", false);' >> "${file}"
sed -i 's/^.browser.cache.disk.enable/user_pref("browser.cache.disk.enable", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.cache.disk.enable", false);' >> "${file}"
sed -i 's/^.browser.cache.disk_cache_ssl/user_pref("browser.cache.disk_cache_ssl", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.cache.disk_cache_ssl", false);' >> "${file}"
sed -i 's/^.browser.cache.memory.enable/user_pref("browser.cache.memory.enable", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.cache.memory.enable", false);' >> "${file}"
sed -i 's/^.browser.cache.offline.enable/user_pref("browser.cache.offline.enable", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.cache.offline.enable", false);' >> "${file}"
sed -i 's/^.browser.cache.offline.insecure.enable/user_pref("browser.cache.offline.insecure.enable", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.cache.offline.insecure.enable", false);' >> "${file}"
sed -i 's/^.geo.enabled/user_pref("geo.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("geo.enabled", false);' >> "${file}"
sed -i 's/^.plugin.scan.plid.all/user_pref("plugin.scan.plid.all", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("plugin.scan.plid.all", false);' >> "${file}"
sed -i 's/^.browser.newtabpage.activity-stream.feeds.telemetry/user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);' >> "${file}"
sed -i 's/^.browser.newtabpage.activity-stream.telemetry/user_pref("browser.newtabpage.activity-stream.telemetry", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.newtabpage.activity-stream.telemetry", false);' >> "${file}"
sed -i 's/^.browser.ping-centre.telemetry/user_pref("browser.ping-centre.telemetry", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.ping-centre.telemetry", false);' >> "${file}"
sed -i 's/^.devtools.onboarding.telemetry.logged/user_pref("devtools.onboarding.telemetry.logged", true);' "${file}" 2>/dev/null \
  || echo 'user_pref("devtools.onboarding.telemetry.logged", true);' >> "${file}"
sed -i 's/^.toolkit.telemetry.archive.enabled/user_pref("toolkit.telemetry.archive.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.archive.enabled", false);' >> "${file}"
sed -i 's/^.toolkit.telemetry.bhrping.enabled/user_pref("toolkit.telemetry.bhrping.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.bhrping.enabled", false);' >> "${file}"
sed -i 's/^.toolkit.telemetry.firstShutdownPing.enabled/user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);' >> "${file}"
sed -i 's/^.toolkit.telemetry.hybridContent.enabled/user_pref("toolkit.telemetry.hybridContent.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.hybridContent.enabled", false);' >> "${file}"
sed -i 's/^.toolkit.telemetry.newProfilePing.enabled/user_pref("toolkit.telemetry.newProfilePing.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.newProfilePing.enabled", false);' >> "${file}"
sed -i 's/^.toolkit.telemetry.unified/user_pref("toolkit.telemetry.unified", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.unified", false);' >> "${file}"
sed -i 's/^.toolkit.telemetry.updatePing.enabled/user_pref("toolkit.telemetry.updatePing.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.updatePing.enabled", false);' >> "${file}"
sed -i 's/^.toolkit.telemetry.shutdownPingSender.enabled/user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);' >> "${file}"
sed -i 's/^.network.dns.disablePrefetch/user_pref("network.dns.disablePrefetch", true);' "${file}" 2>/dev/null \
  || echo 'user_pref("network.dns.disablePrefetch", true);' >> "${file}"
sed -i 's/^.network.prefetch-next/user_pref("network.prefetch-next", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("network.prefetch-next", false);' >> "${file}"
sed -i 's/^.network.http.sendRefererHeader/user_pref("network.http.sendRefererHeader", 0);' "${file}" 2>/dev/null \
  || echo 'user_pref("network.http.sendRefererHeader", 0);' >> "${file}"
sed -i 's/^.webgl.disabled/user_pref("webgl.disabled", true);' "${file}" 2>/dev/null \
  || echo 'user_pref("webgl.disabled", true);' >> "${file}"
  sed -i 's/^.browser.privatebrowsing.autostart/user_pref("browser.privatebrowsing.autostart", true);' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.privatebrowsing.autostart", true);' >> "${file}"
sed -i 's/^.dom.battery.enabled/user_pref("dom.battery.enabled", false);' "${file}" 2>/dev/null \
  || echo 'user_pref("dom.battery.Enabled", false);' >> "${file}"
sed -i 's/^.permissions.default.camera/user_pref("permissions.default.camera", 2);' "${file}" 2>/dev/null \
  || echo 'user_pref("permissions.default.camera", 2);' >> "${file}"
sed -i 's/^.permissions.default.desktop-notification/user_pref("permissions.default.desktop-notification", 2);' "${file}" 2>/dev/null \
  || echo 'user_pref("permissions.default.desktop-notification", 2);' >> "${file}"
sed -i 's/^.permissions.default.geo/user_pref("permissions.default.geo", 2);' "${file}" 2>/dev/null \
  || echo 'user_pref("permissions.default.geo", 2);' >> "${file}"
sed -i 's/^.permissions.default.microphone/user_pref("permissions.default.microphone", 2);' "${file}" 2>/dev/null \
  || echo 'user_pref("permissions.default.microphone", 2);' >> "${file}"
sed -i 's/^.browser.urlbar.placeholderName/user_pref("browser.urlbar.placeholderName", "DuckDuckGo");' "${file}" 2>/dev/null \
  || echo 'user_pref("browser.urlbar.placeholderName", "DuckDuckGo");' >> "${file}"  

#--- Clear bookmark cache
find ~/.mozilla/firefox/*.default*/ -maxdepth 1 -mindepth 1 -type f -name "places.sqlite" -delete
find ~/.mozilla/firefox/*.default*/bookmarkbackups/ -type f -delete

##### Setup firefox's plugins
echo -e "\n ${GREEN}[+]${RESET} Installing ${GREEN}firefox's plugins${RESET} ~ useful addons"
#--- Configure firefox
#export DISPLAY=:0.0
#--- Download extensions
ffpath="$(find ~/.mozilla/firefox/*.default*/ -maxdepth 0 -mindepth 0 -type d -name '*.default*' -print -quit)/extensions"
[ "${ffpath}" == "/extensions" ] \
  && echo -e ' '${RED}'[!]'${RESET}" Couldn't find Firefox folder" 1>&2
mkdir -p "${ffpath}/"
#--- Cookies Manager+
echo -n 'Cookies Manager+'; timeout 300 curl --progress -k -L -f "https://addons.mozilla.org/firefox/downloads/latest/92079/addon-92079-latest.xpi?src=dp-btn-primary" \
  -o "${ffpath}/{bb6bc1bb-f824-4702-90cd-35e2fb24f25d}.xpi" \
    || echo -e ' '${RED}'[!]'${RESET}" Issue downloading 'Cookies Manager+'" 1>&2
#--- HTTPS Everywhere
echo -n 'HTTPS Everywhere'; timeout 300 curl --progress -k -L -f "https://addons.mozilla.org/firefox/downloads/file/1132037/https_everywhere-2018.10.31-an+fx.xpi?src=search" \
  -o "${ffpath}/https-everywhere@eff.org.xpi" \
    || echo -e ' '${RED}'[!]'${RESET}" Issue downloading 'HTTPS Everywhere'" 1>&2
#--- uBlock Origin
echo -n 'uBlock Origin'; timeout 300 curl --progress -k -L -f "https://addons.mozilla.org/firefox/downloads/file/1114441/ublock_origin-1.17.2-an+fx.xpi?src=dp-btn-primary" \
  -o "${ffpath}/uBlock0@raymondhill.net.xpi" \
    || echo -e ' '${RED}'[!]'${RESET}" Issue downloading 'uBlock Origin'" 1>&2
#--- uMatrix
echo -n 'uMatrix'; timeout 300 curl --progress -k -L -f "https://addons.mozilla.org/firefox/downloads/file/1057194/umatrix-1.3.14-an+fx.xpi?src=search" \
  -o "${ffpath}/uMatrix@raymondhill.net.xpi" \
    || echo -e ' '${RED}'[!]'${RESET}" Issue downloading 'uMatrix'" 1>&2
#--- Privacy Badger
echo -n 'Privacy Badger'; timeout 300 curl --progress -k -L -f "https://addons.mozilla.org/firefox/downloads/file/1099313/privacy_badger-2018.10.3.1-an+fx.xpi?src=search" \
  -o "${ffpath}/jid1-MnnxcxisBPnSXQ@jetpack.xpi" \
    || echo -e ' '${RED}'[!]'${RESET}" Issue downloading 'Privacy Badger'" 1>&2
#--- Disable Add-on Compatibility Checks
echo -n 'Disable Add-on Compatibility Checks'; timeout 300 curl --progress -k -L -f "https://addons.mozilla.org/firefox/downloads/latest/300254/addon-300254-latest.xpi?src=dp-btn-primary" \
  -o "${ffpath}/check-compatibility@dactyl.googlecode.com.xpi" \
    || echo -e ' '${RED}'[!]'${RESET}" Issue downloading 'Disable Add-on Compatibility Checks'" 1>&2
#--- Installing extensions
for FILE in $(find "${ffpath}" -maxdepth 1 -type f -name '*.xpi'); do
  d="$(basename "${FILE}" .xpi)"
  mkdir -p "${ffpath}/${d}/"
  unzip -q -o -d "${ffpath}/${d}/" "${FILE}"
  rm -f "${FILE}"
done

file=$(find ~/.mozilla/firefox/*.default*/ -maxdepth 1 -type f -name 'extensions.json' -print -quit)   #&& [ -e "${file}" ] && cp -n $file{,.bkup}
if [[ -e "${file}" ]] || [[ -n "${file}" ]]; then
  echo -e " ${YELLOW}[i]${RESET} Enabled ${YELLOW}Firefox's extensions${RESET} (via method #2 - extensions.json)"
  sed -i 's/"active":false,/"active":true,/g' "${file}"                # Force them all!
  sed -i 's/"userDisabled":true,/"userDisabled":false,/g' "${file}"    # Force them all!
fi

#--- Remove cache
file=$(find ~/.mozilla/firefox/*.default*/ -maxdepth 1 -type f -name 'prefs.js' -print -quit)   #&& [ -e "${file}" ] && cp -n $file{,.bkup}
[ -n "${file}" ] \
  && sed -i '/extensions.installCache/d' "${file}"

#--- Wipe session (due to force close)
find ~/.mozilla/firefox/*.default*/ -maxdepth 1 -type f -name 'sessionstore.*' -delete 	