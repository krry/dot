# Defined in - @ line 1
function nr --wraps=npm --description 'alias nr=npm run'
  npm run $argv;
end
