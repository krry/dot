
" ____ ___  ___  ____ ____ _  _ ____
" |__| |__] |__] |__/ |___ |  | [__
" |  | |__] |__] |  \ |___  \/  ___]

    " Abbrevs autofill as you type in INSERT mode.
    iab <expr> hugotime strftime("%Y-%m-%dT%H:%M%:%S%z")
    " 2020-07-27T19:08:02-0700
    iab <expr> w3time strftime("%FT%T%z")
    " 2020-07-27T19:07:52-0700
    iab <expr> nowtime strftime("%c")
    " Mon Jul 27 19:07:35 2020
    iab <expr> blogtime strftime("%Y-%m-%d %H:%M:%S %z")
    " 2020-07-27 19:07:23 -0700
    iab <expr> blogdate strftime("%Y-%m-%d")
    " 2020-07-27
