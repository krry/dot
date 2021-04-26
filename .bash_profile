
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
if [ "${BASH_VERSINFO[0]}" -gt 4 ] || ([ "${BASH_VERSINFO[0]}" -eq 4 ] && [ "${BASH_VERSINFO[1]}" -ge 1 ])
then
source <("/opt/homebrew/bin/starship" init bash --print-full-init)
else
source /dev/stdin <<<"$("/opt/homebrew/bin/starship" init bash --print-full-init)"
