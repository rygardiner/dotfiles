# Set XDG Base Directory
$env:XDG_CONFIG_HOME = "$HOME/.config"

# Homebrew
/opt/homebrew/bin/brew shellenv pwsh | Out-String | Invoke-Expression

# Add .local/bin to $PATH for Claude Code
$env:PATH = "$HOME/.local/bin:" + $env:PATH

# Add alias to use nvim with vim command
Set-Alias -Name vim -Value nvim

# Use tab for autocomplete suggestions
Set-PSReadLineKeyHandler -Key Tab -Function AcceptSuggestion

# Shell Prompt
function prompt {
    $path = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($path.StartsWith($HOME)) { $path = '~' + $path.Substring($HOME.Length) }
    "`e[0;36m$path `e[38;5;208m→`e[0m "
}

# Auto-start tmux
if ((Get-Command tmux -ErrorAction SilentlyContinue) -and -not $env:TMUX) {
    tmux attach -t default
    if ($LASTEXITCODE -ne 0) { tmux new -s default }
}

# start zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
