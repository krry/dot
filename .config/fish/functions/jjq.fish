function jjq
    jq -RrC '. as $line | try fromjson catch $line'
end