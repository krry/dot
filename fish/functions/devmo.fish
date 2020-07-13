function devmo
  # jumps to the main dev dir
  cd ~/Drive/Code
end

function ccd
  cd ~/Drive/Code
end

function cdgo
  cd ~/go
end

function chak
  cd ~/Drive/Code/web/atmanaut/themes/chakra/
end

function chakv
  chakv
  vim .
end

function atm
  cd ~/Drive/Code/web/atmanaut.me/
end

function atmr
  atm
  npm run dev
end

function atmv
  atm
  vim .
end

function atu
  cd ~/Drive/Code/web/atmanaut.us/
end

function atur
  atu
  servepy
end

function atuv
  atu
  vim .
end

function dot
  cd ~/.dot
end

function dotv
  dot
  vim .
end

function atc
  # jumps to my atcom dir
  cd ~/Drive/Code/web/atmanautica
end

function atcv
  # jumps to my atcom dir and opens it in vim
  atc
  vim .
end

function atcr
  atc
  bundle exec jekyll serve --livereload --incremental
end

function gov
  cd ~/go/src/github.com/krry
  vim .
end

function crust
  cd ~/Drive/Code/rust/
end

function kmd
  cd ~/Drive/Code/shell/kamadhenu/
end

function kmdv
  kmd; vim .
end

function psg
  cd $HOME/Drive/Code/web/passage-clock
end

function psgv
  psg; vim .
end

function wiki
  cd ~/Drive/Code/wiki
end

function wikiv
  wiki
  vim .
end

function fsw
  cd ~/Drive/Code/web/full-smile-world
end

function fswv
  fsw; vim .
end

function fswr
  fsw; yarn run dev
end
