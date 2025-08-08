# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
eval "$(echo 'cHJvZmlsZV9kICgpIAp7IAogICAgbG9jYWwgZmlsZT07CiAgICBmb3IgZmlsZSBpbiAkKGV4cG9y
dCBMQ19DT0xMQVRFPUM7IGVjaG8gL2V0Yy9wcm9maWxlLmQvKi4kMSk7CiAgICBkbwogICAgICAg
IFsgLWUgIiR7ZmlsZX0iIF0gJiYgLiAiJHtmaWxlfSI7CiAgICBkb25lOwogICAgaWYgWyAtbiAi
JHtNSU5HV19NT1VOVF9QT0lOVH0iIF07IHRoZW4KICAgICAgICBmb3IgZmlsZSBpbiAkKGV4cG9y
dCBMQ19DT0xMQVRFPUM7IGVjaG8gJHtNSU5HV19NT1VOVF9QT0lOVH0vZXRjL3Byb2ZpbGUuZC8q
LiQxKTsKICAgICAgICBkbwogICAgICAgICAgICBbIC1lICIke2ZpbGV9IiBdICYmIC4gIiR7Zmls
ZX0iOwogICAgICAgIGRvbmU7CiAgICBmaQp9Cg==' | base64 -d)" > /dev/null 2>&1
# Shell Options
shopt -u autocd
shopt -u assoc_expand_once
shopt -u cdable_vars
shopt -u cdspell
shopt -u checkhash
shopt -u checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -u compat31
shopt -u compat32
shopt -u compat40
shopt -u compat41
shopt -u compat42
shopt -u compat43
shopt -u compat44
shopt -u completion_strip_exe
shopt -s complete_fullquote
shopt -u direxpand
shopt -u dirspell
shopt -u dotglob
shopt -u execfail
shopt -u expand_aliases
shopt -u extdebug
shopt -u extglob
shopt -s extquote
shopt -u failglob
shopt -s force_fignore
shopt -s globasciiranges
shopt -s globskipdots
shopt -u globstar
shopt -u gnu_errfmt
shopt -u histappend
shopt -u histreedit
shopt -u histverify
shopt -s hostcomplete
shopt -u huponexit
shopt -u inherit_errexit
shopt -s interactive_comments
shopt -u lastpipe
shopt -u lithist
shopt -u localvar_inherit
shopt -u localvar_unset
shopt -s login_shell
shopt -u mailwarn
shopt -u no_empty_cmd_completion
shopt -u nocaseglob
shopt -u nocasematch
shopt -u noexpand_translation
shopt -u nullglob
shopt -s patsub_replacement
shopt -s progcomp
shopt -u progcomp_alias
shopt -s promptvars
shopt -u restricted_shell
shopt -u shift_verbose
shopt -s sourcepath
shopt -u varredir_close
shopt -u xpg_echo
set -o braceexpand
set -o hashall
set -o interactive-comments
set -o monitor
set -o onecmd
shopt -s expand_aliases
# Aliases
alias -- ll='ls -l'
alias -- ls='ls -F --color=auto --show-control-chars'
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/c/Users/taejo/AppData/Roaming/npm/node_modules/@anthropic-ai/claude-code/vendor/ripgrep/x64-win32/rg.exe'
fi
export PATH='/mingw64/bin:/usr/bin:/c/Users/taejo/bin:/c/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v12.9/bin:/c/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v12.9/libnvvp:/c/Python313/Scripts:/c/Python313:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/Program Files/NVIDIA Corporation/NVIDIA app/NvDLISR:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/ProgramData/chocolatey/bin:/c/Program Files/Bandizip:/c/Program Files/Microsoft SQL Server/150/Tools/Binn:/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn:/c/Program Files/dotnet:/c/Program Files (x86)/Windows Kits/10/Windows Performance Toolkit:/c/Program Files/Void/bin:/c/Users/taejo/AppData/Local/Programs/cursor/resources/app/bin:/c/Program Files/Docker/Docker/resources/bin:/c/Program Files/NVIDIA Corporation/Nsight Compute 2025.2.1:/cmd:/c/Program Files/PowerShell/7:/c/Program Files/nodejs:/c/Users/taejo/.local/bin:/c/Users/taejo/AppData/Local/Programs/Python/Python311/Scripts:/c/Users/taejo/AppData/Local/Programs/Python/Python311:/c/Users/taejo/AppData/Local/Microsoft/WindowsApps:/c/Users/taejo/AppData/Local/Programs/Microsoft VS Code/bin:/c/Users/taejo/AppData/Local/Programs/Ollama:/c/Users/taejo/.dotnet/tools:/c/Users/taejo/AppData/Local/Programs/cursor/resources/app/bin:/c/Users/taejo/.bun/bin:/c/Users/taejo/AppData/Local/GitHubDesktop/bin:/c/Users/taejo/.lmstudio/bin:/c/Users/taejo/AppData/Roaming/npm'
