AUTOMOUNT=true
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=false
print_modname() {
  ui_print "************************************"
  ui_print " Riru - Ed Xposed v0.2.9.8            "
  ui_print "************************************"
}
REPLACE="
"
set_permissions() {
  set_perm_recursive  $MODPATH  0  0  0755  0644
}
fail() {
  echo "$1"
  exit 1
}
check_architecture() {
  if [[ "$ARCH" != "arm" && "$ARCH" != "arm64" && "$ARCH" != "x86" && "$ARCH" != "x64" ]]; then
    ui_print "- Unsupported platform: $ARCH"
    exit 1
  else
    ui_print "- Device platform: $ARCH"
  fi
}
copy_files() {
  if [[ "$ARCH" == "x86" || "$ARCH" == "x64" ]];
  then
	ui_print "- Removing arm/arm64 libraries"
    rm -rf "$MODPATH/system/lib"
    rm -rf "$MODPATH/system/lib64"
    mv "$MODPATH/system_x86/lib" "$MODPATH/system/lib"
    mv "$MODPATH/system_x86/lib64" "$MODPATH/system/lib64"
  else
    ui_print "- Removing x86/x64 libraries"
  fi
  rm -rf "$MODPATH/system_x86"
  if [[ "$IS64BIT" = false ]];
  then
	ui_print "- Removing 64-bit libraries"
	rm -rf "$MODPATH/system/lib64"
  fi
  ui_print "- Extracting extra files"
  unzip -o "$ZIP" 'data/*' -d "$MODPATH" >&2
  TARGET="/data/misc/riru/modules"
  [[ -d "$TARGET" ]] || mkdir -p "$TARGET" || fail "- Can't mkdir -p $TARGET"
  cp -af "$MODPATH$TARGET/." "$TARGET" || fail "- Can't cp -af $MODPATH$TARGET/. $TARGET"
  rm -rf "$MODPATH/data" 2>/dev/null
  ui_print "- Files copied"
}