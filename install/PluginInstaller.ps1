$VIM_HOME="$env:USERPROFILE\.vim"
$PLUGIN="$VIM_HOME\plugin.vim"
$TEMPLATE_HOME="$VIM_HOME\template"

function ClearPlugin() {

}

function InstallPluginHeader() {
    Get-Content -Path "$TEMPLATE_HOME\plugin-header-template.vim" | Add-Content -Path $PLUGIN
}

function InstallPluginFooter() {
    Get-Content -Path "$TEMPLATE_HOME\plugin-footer-template.vim" | Add-Content -Path $PLUGIN
}
