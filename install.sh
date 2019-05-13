SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=false
REPLACE="
"
RIRU_PATH="/data/misc/riru"
print_modname() {
  ui_print "*******************************"
  ui_print "*       Riru - EdXposed       *"
  ui_print "*******************************"
}
check_riru_version() {
  [[ ! -f "$RIRU_PATH/api_version" ]] && abort "! Please Install Riru - Core v19 or above"
  VERSION=$(cat "$RIRU_PATH/api_version")
  ui_print "- Riru API version is $VERSION"
  [[ "$VERSION" -ge 4 ]] || abort "! Please Install Riru - Core v19 or above"
}
check_architecture() {
  if [[ "$ARCH" != "arm" && "$ARCH" != "arm64" && "$ARCH" != "x86" && "$ARCH" != "x64" ]]; then
    abort "! Unsupported platform: $ARCH"
  else
    ui_print "- Device platform: $ARCH"
  fi
}
on_install() {
  check_architecture
  check_riru_version
  if [[ "$ARCH" == "x86" || "$ARCH" == "x64" ]]; then
    ui_print "- Extracting x86/64 libraries"
    unzip -o "$ZIPFILE" 'system_x86/*' -d $MODPATH >&2
    mv "$MODPATH/system_x86/lib" "$MODPATH/system/lib"
    mv "$MODPATH/system_x86/lib64" "$MODPATH/system/lib64"
  else
    ui_print "- Extracting arm/arm64 libraries"
    unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  fi
  if [[ "$IS64BIT" = false ]]; then
    ui_print "- Removing 64-bit libraries"
    rm -rf "$MODPATH/system/lib64"
  fi
  ui_print "- Extracting extra files"
  unzip -o "$ZIPFILE" 'data/*' -d "$TMPDIR" >&2
  TARGET="$RIRU_PATH/modules"
  [[ -d "$TARGET" ]] || mkdir -p "$TARGET" || abort "! Can't mkdir -p $TARGET"
  cp -af "$TMPDIR$TARGET/." "$TARGET" || abort "! Can't cp -af $TMPDIR$TARGET/. $TARGET"
  ui_print "- Files copied"
}
set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}
