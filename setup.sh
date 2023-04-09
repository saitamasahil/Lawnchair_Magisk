#!/sbin/sh

###########################
# MMT Reborn Logic
###########################

############
# Config Vars
############

# Set this to true if you want to skip mount for your module
SKIPMOUNT="false"
# Set this to true if you want to clean old files in module before injecting new module
CLEANSERVICE="false"
# Set this to true if you want to load vskel after module info print. If you want to manually load it, consider using load_vksel function
AUTOVKSEL="true"
# Set this to true if you want store debug logs of installation
DEBUG="true"

############
# Replace List
############

# List all directories you want to directly replace in the system
# Construct your list in the following example format
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"
# Construct your own list here
REPLACE="
/system/priv-app/AsusLauncherDev
/system/priv-app/Lawnchair
/system/priv-app/NexusLauncherPrebuilt
/system/priv-app/Lawnicons
/system/product/priv-app/ParanoidQuickStep
/system/product/priv-app/ShadyQuickStep
/system/product/priv-app/TrebuchetQuickStep
/system/product/priv-app/NexusLauncherRelease
/system/product/overlay/PixelLauncherIconsOverlay
/system/system_ext/priv-app/NexusLauncherRelease
/system/system_ext/priv-app/TrebuchetQuickStep
/system/system_ext/priv-app/Lawnchair
/system/system_ext/priv-app/PixelLauncherRelease
/system/system_ext/priv-app/Launcher3QuickStep
"

############
# Permissions
############

# Set permissions
set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0777 0777
  set_perm_recursive "$MODPATH/system/product/overlay" 0 0 0777 0777
}

############
# Info Print
############

# Set what you want to be displayed on header of installation process
info_print() {
  ui_print ""
  ui_print "**********************************************"
  ui_print "• Lawnchair Magisk"
  ui_print "• By saitamasahil @github"
  ui_print "**********************************************"
  ui_print ""

  sleep 2
}

############
# Main
############

# Change the logic to whatever you want
init_main() {
  sdk_version=$(getprop ro.build.version.sdk)

  if [ $sdk_version -eq 32 ]; then
    rm -rf "$MODPATH/system/priv-app/Lawnchair/a13qpr.apk"
    rm -rf "$MODPATH/system/priv-app/Lawnchair/a13qpr2.apk"
    rm -rf "$MODPATH/system/product/overlay/QuickSwitchOverlay/QuickSwitchOverlay13.apk"
    rm -rf "$MODPATH/system/etc/permissions/privapp-permissions-app.lawnchair.debug.xml"
    rm -rf "$MODPATH/system/etc/sysconfig/app.lawnchair.debug-hiddenapi-package-whitelist.xml"
    ui_print "The installation process of Lawnchair Magisk has been started!!"

  elif [ $sdk_version -eq 33 ]; then
    rm -rf "$MODPATH/system/priv-app/Lawnchair/a12.apk"
    rm -rf "$MODPATH/system/product/overlay/QuickSwitchOverlay/QuickSwitchOverlay12.apk"
    rm -rf "$MODPATH/system/etc/permissions/privapp-permissions-app.lawnchair.xml"
    rm -rf "$MODPATH/system/etc/sysconfig/app.lawnchair-hiddenapi-package-whitelist.xml"
    # Get the security patch date from build.prop
    PATCH_DATE=$(getprop ro.build.version.security_patch)

    # Convert it to YYYYMM format
    PATCH_YEAR=${PATCH_DATE:0:4}
    PATCH_MONTH=${PATCH_DATE:5:2}
    PATCH_LEVEL=$PATCH_YEAR$PATCH_MONTH

    if [ $PATCH_LEVEL -le 202202 ]; then
      ui_print "Android 13/13 QPR detected!"
      ui_print "Security Patch - $PATCH_DATE"
      rm -rf "$MODPATH/system/priv-app/Lawnchair/a13qpr2.apk"

    elif [ $PATCH_LEVEL -ge 202303 ]; then
      ui_print "Android 13 QPR2 detected!"
      ui_print "Security Patch - $PATCH_DATE"
      rm -rf "$MODPATH/system/priv-app/Lawnchair/a13qpr.apk"
    fi

    ui_print ""
    ui_print "[*] If the information displayed above is accurate?"
    ui_print "[*] Press volume up to switch to another choice"
    ui_print "[*] Press volume down to continue with that choice"
    ui_print ""

    sleep 0.5

    ui_print "--------------------------------"
    ui_print "[1] Yes"
    ui_print "--------------------------------"
    ui_print "[2] No"
    ui_print "--------------------------------"

    ui_print ""
    ui_print "[*] Select your desired option:"

    SM=1
    while true; do
      ui_print "  $SM"
      "$VKSEL" && SM="$((SM + 1))" || break
      [[ "$SM" -gt "2" ]] && SM=1
    done

    case "$SM" in
    "1") FCTEXTAD1="Yes" ;;
    "2") FCTEXTAD1="No" ;;
    esac

    ui_print "[*] Selected: $FCTEXTAD1"
    ui_print ""

    if [[ "$FCTEXTAD1" == "Yes" ]]; then
      ui_print "The installation process of Lawnchair Magisk has been started!!"

    elif [[ "$FCTEXTAD1" == "No" ]]; then
      ui_print "Tell your rom maintainer to fix"
      ui_print "'getprop ro.build.version.security_patch - $PATCH_DATE' value"
      exit 1
    fi

  else
    echo "Unsupported SDK version: $sdk_version"
    exit 1
  fi

  ui_print ""
  ui_print "[*] Do you want to install Lawnicons Manager App?"
  ui_print "[*] Press volume up to switch to another choice"
  ui_print "[*] Press volume down to continue with that choice"
  ui_print ""

  sleep 0.5

  ui_print "--------------------------------"
  ui_print "[1] Yes"
  ui_print "--------------------------------"
  ui_print "[2] No"
  ui_print "--------------------------------"

  ui_print ""
  ui_print "[*] Select your desired option:"

  SM=1
  while true; do
    ui_print "  $SM"
    "$VKSEL" && SM="$((SM + 1))" || break
    [[ "$SM" -gt "2" ]] && SM=1
  done

  case "$SM" in
  "1") FCTEXTAD1="Yes" ;;
  "2") FCTEXTAD1="No" ;;
  esac

  ui_print "[*] Selected: $FCTEXTAD1"
  ui_print ""

  if [[ "$FCTEXTAD1" == "Yes" ]]; then
    :

  elif [[ "$FCTEXTAD1" == "No" ]]; then
    rm -rf "$MODPATH/system/priv-app/Lawniconsbak"
    rm -rf "$MODPATH/system/priv-app/LawniconsManager"
    rm -rf "$MODPATH/system/etc/permissions/privapp-permissions-app.lawnchair.lawnicons.xml"
    rm -rf "$MODPATH/system/etc/permissions/privapp-permissions-com.saitama.liarach.lawnmagisk.xml"
  fi

  ui_print "[*] Clearing system cache to properly make it work..."
  ui_print ""

  rm -rf "/data/system/package_cache"

  sleep 0.5

  ui_print "[*] Done!"
  ui_print ""

  sleep 0.5

  ui_print " --- Notes --- "
  ui_print ""
  ui_print "[*] Reboot is required"
  ui_print ""
  ui_print "[*] Report issues to @fileschat on Telegram"
  ui_print ""
  ui_print "[*] You can find me at @saitama_96 on Telegram for direct support"

  sleep 2

}
