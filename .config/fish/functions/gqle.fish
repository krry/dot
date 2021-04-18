function gqle
cd ~/Code/github/graphql-engine/server; cabal new-run -- exe:graphql-engine --database-url='postgres://hasurauser@localhost:5432/outline3' serve --console-assets-dir=../console/static/dist --enable-console | jq -RrC '. as $line | try fromjson catch $line'
end
