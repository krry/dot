#!fish
#
# git-flow-completion
# ===================
#
# Fish completion support for [git-flow](http://github.com/nvie/gitflow)
#
# The contained completion routines provide support for completing:
#
#  * git-flow init and version
#  * feature, hotfix and release branches
#  * remote feature, hotfix and release branch names
#
#
# Installation
# ------------
#
# To achieve git-flow completion nirvana:
#
#  1. Install this file in your `~/.config/fish/completions` folder.
#
#
# The Fine Print
# --------------
#
# Copyright (c) 2012-2015 [Justin Hileman](http://justinhileman.com)
#
# Distributed under the [MIT License](http://creativecommons.org/licenses/MIT/)

for prefix in /usr /usr/local /opt/local
  if test -f $prefix/share/fish/completions/git.fish
    source $prefix/share/fish/completions/git.fish
    break
  end
end

if not functions -q __fish_git_branches
  echo \nError: git completion not found >&2
  exit
end

## GIT completions
### Fish completions for Git ###

function __fish_git_branches
  git branch --no-color -a 2>/dev/null | sed 's/^..//'
end

function __fish_git_tags
  git tag
end

function __fish_git_heads
  __fish_git_branches
  __fish_git_tags
end

function __fish_git_remotes
  git remote
end

function __fish_git_ranges
  set from (commandline -ot | perl -ne 'my @parts = split(/\.\./); print $parts[0]')
  set to (commandline -ot | perl -ne 'my @parts = split(/\.\./); print $parts[1]')
  if [ "$from" = "" ]
    __fish_git_branches
    return 0
  end

  for from_ref in (__fish_git_heads | grep -e "$from")
    for to_ref in (__fish_git_heads | grep -e "$to")
      printf "%s..%s\n" $from_ref $to_ref
    end
  end
end

function __fish_git_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'git' ]
    return 0
  end
  return 1
end

function __fish_git_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

## General options
complete -f -c git -n 'not __fish_git_needs_command' -l help -d 'Display the manual of a git command'

## git fetch
complete -f -c git -n '__fish_git_needs_command' -a fetch -d 'Download objects and refs from another repository'
complete -f -c git -n '__fish_git_using_command fetch' -a '(__fish_git_remotes)' -d 'Remote'
complete -f -c git -n '__fish_git_using_command fetch' -s q -l quiet -d 'Be quiet'
complete -f -c git -n '__fish_git_using_command fetch' -s v -l verbose -d 'Be verbose'
complete -f -c git -n '__fish_git_using_command fetch' -s a -l append -d 'Append ref names and object names'
complete -f -c git -n '__fish_git_using_command fetch' -s f -l force -d 'Force update of local branches'

## git remote
complete -f -c git -n '__fish_git_needs_command' -a remote -d 'Manage set of tracked repositories'
complete -f -c git -n '__fish_git_using_command remote' -a '(__fish_git_remotes)'
complete -f -c git -n '__fish_git_using_command remote' -s v -l verbose -d 'Be verbose'
complete -f -c git -n '__fish_git_using_command remote' -a add -d 'Adds a new remote'
complete -f -c git -n '__fish_git_using_command remote' -a rm -d 'Removes a remote'
complete -f -c git -n '__fish_git_using_command remote' -a show -d 'Shows a remote'
complete -f -c git -n '__fish_git_using_command remote' -a prune -d 'Deletes all stale tracking branches'
complete -f -c git -n '__fish_git_using_command remote' -a update -d 'Fetches updates'

## git show
complete -f -c git -n '__fish_git_needs_command' -a show -d 'Shows the last commit of a branch'
complete -f -c git -n '__fish_git_using_command show' -a '(__fish_git_branches)' -d 'Branch'

## git show-branch
complete -f -c git -n '__fish_git_needs_command' -a show-branch -d 'Shows the commits on branches'
complete -f -c git -n '__fish_git_using_command show-branch' -a '(__fish_git_heads)' --description 'Branch'

## git add
complete -c git -n '__fish_git_needs_command' -a add -d 'Add file contents to the index'

## git checkout
complete -f -c git -n '__fish_git_needs_command' -a checkout -d 'Checkout and switch to a branch'
complete -c git -n '__fish_git_using_command checkout'  -a '(__fish_git_branches)' --description 'Branch'
complete -c git -n '__fish_git_using_command checkout'  -a '(__fish_git_tags)' --description 'Tag'
complete -c git -n '__fish_git_using_command checkout' -s b -d 'Create a new branch'

## git apply
complete -f -c git -n '__fish_git_needs_command' -a apply -d 'Apply a patch on a git index file and a working tree'

## git archive
complete -f -c git -n '__fish_git_needs_command' -a archive -d 'Create an archive of files from a named tree'

## git bisect
complete -f -c git -n '__fish_git_needs_command' -a bisect -d 'Find the change that introduced a bug by binary search'

## git branch
complete -f -c git -n '__fish_git_needs_command' -a branch -d 'List, create, or delete branches'
complete -f -c git -n '__fish_git_using_command branch' -a '(__fish_git_branches)' -d 'Branch'
complete -f -c git -n '__fish_git_using_command branch' -s d -d 'Delete Branch'
complete -f -c git -n '__fish_git_using_command branch' -s D -d 'Force deletion of branch'
complete -f -c git -n '__fish_git_using_command branch' -s m -d 'Rename branch'
complete -f -c git -n '__fish_git_using_command branch' -s M -d 'Force renaming branch'
complete -f -c git -n '__fish_git_using_command branch' -s a -d 'Lists both local and remote branches'

## git cherry-pick
complete -f -c git -n '__fish_git_needs_command' -a cherry-pick -d 'Apply the change introduced by an existing commit'
complete -f -c git -n '__fish_git_using_command cherry-pick' -a '(__fish_git_branches)' -d 'Branch'

## git clone
complete -f -c git -n '__fish_git_needs_command' -a clone -d 'Clone a repository into a new directory'

## git commit
complete -c git -n '__fish_git_needs_command' -a commit -d 'Record changes to the repository'
complete -c git -n '__fish_git_using_command commit' -l amend -d 'Amend the log message of the last commit'

## git diff
complete -c git -n '__fish_git_needs_command' -a diff -d 'Show changes between commits, commit and working tree, etc'
complete -c git -n '__fish_git_using_command diff' -a '(__fish_git_ranges)' -d 'Branch'
complete -c git -n '__fish_git_using_command diff' -l cached -d 'Show diff of changes in the index'

## git grep
complete -c git -n '__fish_git_needs_command' -a grep -d 'Print lines matching a pattern'

## git init
complete -f -c git -n '__fish_git_needs_command' -a init -d 'Create an empty git repository or reinitialize an existing one'

## git log
complete -c git -n '__fish_git_needs_command'    -a log -d 'Show commit logs'
complete -c git -n '__fish_git_using_command log' -a '(__fish_git_heads) (__fish_git_ranges)' -d 'Branch'
complete -f -c git -n '__fish_git_using_command log' -l pretty -a 'oneline short medium full fuller email raw format:'

## git merge
complete -f -c git -n '__fish_git_needs_command' -a merge -d 'Join two or more development histories together'
complete -f -c git -n '__fish_git_using_command merge' -a '(__fish_git_branches)' -d 'Branch'
complete -f -c git -n '__fish_git_using_command merge' -l commit -d "Autocommit the merge"
complete -f -c git -n '__fish_git_using_command merge' -l no-commit -d "Don't autocommit the merge"
complete -f -c git -n '__fish_git_using_command merge' -l stat -d "Show diffstat of the merge"
complete -f -c git -n '__fish_git_using_command merge' -s n -l no-stat -d "Don't show diffstat of the merge"
complete -f -c git -n '__fish_git_using_command merge' -l squash -d "Squash changes from other branch as a single commit"
complete -f -c git -n '__fish_git_using_command merge' -l no-squash -d "Don't squash changes"
complete -f -c git -n '__fish_git_using_command merge' -l ff -d "Don't generate a merge commit if merge is fast forward"
complete -f -c git -n '__fish_git_using_command merge' -l no-ff -d "Generate a merge commit even if merge is fast forward"

## git mv
complete -c git -n '__fish_git_needs_command' -a mv -d 'Move or rename a file, a directory, or a symlink'

## git prune
complete -f -c git -n '__fish_git_needs_command' -a prune -d 'Prune all unreachable objects from the object database'

## git pull
complete -f -c git -n '__fish_git_needs_command' -a pull -d 'Fetch from and merge with another repository or a local branch'

## git push
complete -f -c git -n '__fish_git_needs_command' -a push -d 'Update remote refs along with associated objects'

## git rebase
complete -f -c git -n '__fish_git_needs_command' -a rebase -d 'Forward-port local commits to the updated upstream head'
complete -f -c git -n '__fish_git_using_command rebase' -a '(__fish_git_branches)' -d 'Branch'

## git reset
complete -c git -n '__fish_git_needs_command' -a reset -d 'Reset current HEAD to the specified state'
complete -f -c git -n '__fish_git_using_command reset' -l hard -d 'Reset files in working directory'
complete -c git -n '__fish_git_using_command reset' -a '(__fish_git_branches)'

## git revert
complete -f -c git -n '__fish_git_needs_command' -a revert -d 'Revert an existing commit'

## git rm
complete -c git -n '__fish_git_needs_command' -a rm -d 'Remove files from the working tree and from the index'

## git status
complete -f -c git -n '__fish_git_needs_command' -a status -d 'Show the working tree status'

## git tag
complete -f -c git -n '__fish_git_needs_command' -a tag -d 'Create, list, delete or verify a tag object signed with GPG'
complete -f -c git -n '__fish_git_using_command tag; and __fish_not_contain_opt -s d; and __fish_not_contain_opt -s v; and test (count (commandline -opc | grep -v -e \'^-\')) -eq 3' -a '(__fish_git_branches)' -d 'Branch'
complete -f -c git -n '__fish_git_using_command tag' -s d -d 'Remove a tag'
complete -f -c git -n '__fish_git_using_command tag' -s v -d 'Verify signature of a tag'
complete -f -c git -n '__fish_git_using_command tag' -s f -d 'Force overwriting exising tag'
complete -f -c git -n '__fish_git_using_command tag' -s s -d 'Make a GPG-signed tag'
complete -f -c git -n '__fish_contains_opt -s d' -a '(__fish_git_tags)' -d 'Tag'
complete -f -c git -n '__fish_contains_opt -s v' -a '(__fish_git_tags)' -d 'Tag'

## git config
complete -f -c git -n '__fish_git_needs_command' -a config -d 'Set and read git configuration variables'

## git format-patch
complete -f -c git -n '__fish_git_needs_command' -a format-patch -d 'Generate patch series to send upstream'
complete -f -c git -n '__fish_git_using_command format-patch' -a '(__fish_git_branches)' -d 'Branch'

## git submodule
complete -f -c git -n '__fish_git_needs_command' -a submodule -d 'Initialize, update or inspect submodules'
complete -f -c git -n '__fish_git_using_command submodule' -a 'add status init update summary foreach sync' -d 'Make a GPG-signed tag'

## git whatchanged
complete -f -c git -n '__fish_git_needs_command' -a whatchanged -d 'Show logs with difference each commit introduces'

## Aliases (custom user-defined commands)
complete -c git -n '__fish_git_needs_command' -a '(git config --get-regexp alias | sed -e "s/^alias\.\(\S\+\).*/\1/")' -d 'Alias (user-defined command)'

## Git Flow Completions
## Support functions

function __fish_git_flow_using_command
  set cmd (commandline -opc)
  set subcommands 'flow' $argv
  if [ (count $cmd) = (math (count $subcommands) + 1) ]
    for i in (seq (count $subcommands))
      if not test $subcommands[$i] = $cmd[(math $i + 1)]
        return 1
      end
    end
    return 0
  end
  return 1
end

function __fish_git_flow_prefix
  git config "gitflow.prefix.$argv[1]" 2> /dev/null; or echo "$argv[1]/"
end

function __fish_git_flow_branches
  set prefix (__fish_git_flow_prefix $argv[1])
  __fish_git_branches | grep --color=never "^$prefix" | sed "s,^$prefix,," | sort
end

function __fish_git_flow_remote_branches
  set prefix (__fish_git_flow_prefix $argv[1])
  set origin (git config gitflow.origin 2> /dev/null; or echo "origin")
  git branch -r 2> /dev/null | sed "s/^ *//g" | grep --color=never "^$origin/$prefix" | sed "s,^$origin/$prefix,," | sort
end

function __fish_git_flow_untracked_branches
  set branches (__fish_git_flow_branches $argv[1])
  for branch in (__fish_git_flow_remote_branches $argv[1])
    if not contains $branch $branches
      echo $branch
    end
  end
end

function __fish_git_flow_unpublished_branches
  set branches (__fish_git_flow_remote_branches $argv[1])
  for branch in (__fish_git_flow_branches $argv[1])
    if not contains $branch $branches
      echo $branch
    end
  end
end


## git-flow

complete -f -c git -n '__fish_git_needs_command' -a flow -d 'Manage a git-flow enabled repository'
complete -f -c git -n '__fish_git_flow_using_command' -a version -d 'Show version information'



## git-flow init

complete -f -c git -n '__fish_git_flow_using_command' -a init    -d 'Initialize a new git repo with support for the branching model'
complete -f -c git -n '__fish_git_flow_using_command init' -s f  -d 'Force reinitialization'
complete -f -c git -n '__fish_git_flow_using_command init' -s d  -d 'Use default branch names'



## git-flow feature

complete -f -c git -n '__fish_git_flow_using_command' -a feature      -d 'Manage feature branches'
complete -f -c git -n '__fish_git_flow_using_command feature' -a list -d 'List feature branches'
complete -f -c git -n '__fish_git_flow_using_command feature' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command feature' -a start    -d 'Start a new feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature start' -s F  -d 'Fetch from origin first'

complete -f -c git -n '__fish_git_flow_using_command feature' -a finish   -d 'Finish a feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature finish' -s F -d 'Fetch from origin first'
complete -f -c git -n '__fish_git_flow_using_command feature finish' -s r -d 'Rebase instead of merging'
complete -f -c git -n '__fish_git_flow_using_command feature finish' -a '(__fish_git_flow_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a publish  -d 'Publish a feature branch to remote'
complete -f -c git -n '__fish_git_flow_using_command feature publish' -a '(__fish_git_flow_unpublished_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a track    -d 'Checkout remote feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature track' -a '(__fish_git_flow_untracked_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a diff     -d 'Show all changes'

complete -f -c git -n '__fish_git_flow_using_command feature' -a rebase   -d 'Rebase against integration branch'
complete -f -c git -n '__fish_git_flow_using_command feature rebase' -s i -d 'Do an interactive rebase'

complete -f -c git -n '__fish_git_flow_using_command feature' -a checkout -d 'Checkout local feature branch'
complete -f -c git -n '__fish_git_flow_using_command feature checkout' -a '(__fish_git_flow_branches feature)' -d 'Feature branch'

complete -f -c git -n '__fish_git_flow_using_command feature' -a pull     -d 'Pull changes from remote'
complete -f -c git -n '__fish_git_flow_using_command feature pull' -a '(__fish_git_remotes)' -d 'Remote'



## git-flow release

complete -f -c git -n '__fish_git_flow_using_command' -a release      -d 'Manage release branches'
complete -f -c git -n '__fish_git_flow_using_command release' -a list -d 'List release branches'
complete -f -c git -n '__fish_git_flow_using_command release' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command release' -a start -d 'Start a new release branch'
complete -f -c git -n '__fish_git_flow_using_command release start' -s F  -d 'Fetch from origin first'

complete -f -c git -n '__fish_git_flow_using_command release' -a finish   -d 'Finish a release branch'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s F -d 'Fetch from origin first'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s s -d 'Sign the release tag cryptographically'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s u -d 'Use the given GPG-key for the digital signature (implies -s)'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s m -d 'Use the given tag message'
complete -f -c git -n '__fish_git_flow_using_command release finish' -s p -d 'Push to $ORIGIN after performing finish'
complete -f -c git -n '__fish_git_flow_using_command release finish' -a '(__fish_git_flow_branches release)' -d 'Release branch'

complete -f -c git -n '__fish_git_flow_using_command release' -a publish  -d 'Publish a release branch to remote'
complete -f -c git -n '__fish_git_flow_using_command release publish' -a '(__fish_git_flow_unpublished_branches release)' -d 'Release branch'

complete -f -c git -n '__fish_git_flow_using_command release' -a track    -d 'Checkout remote release branch'
complete -f -c git -n '__fish_git_flow_using_command release track' -a '(__fish_git_flow_untracked_branches release)' -d 'Release branch'



## git-flow hotfix

complete -f -c git -n '__fish_git_flow_using_command' -a hotfix      -d 'Manage hotfix branches'
complete -f -c git -n '__fish_git_flow_using_command hotfix' -a list -d 'List hotfix branches'
complete -f -c git -n '__fish_git_flow_using_command hotfix' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command hotfix' -a start -d 'Start a new hotfix branch'
complete -f -c git -n '__fish_git_flow_using_command hotfix start' -s F  -d 'Fetch from origin first'

complete -f -c git -n '__fish_git_flow_using_command hotfix' -a finish   -d 'Finish a hotfix branch'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s F -d 'Fetch from origin first'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s s -d 'Sign the hotfix tag cryptographically'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s u -d 'Use the given GPG-key for the digital signature (implies -s)'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s m -d 'Use the given tag message'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -s p -d 'Push to $ORIGIN after performing finish'
complete -f -c git -n '__fish_git_flow_using_command hotfix finish' -a '(__fish_git_flow_branches hotfix)' -d 'Hotfix branch'



## git-flow support

complete -f -c git -n '__fish_git_flow_using_command' -a support      -d 'Manage support branches'
complete -f -c git -n '__fish_git_flow_using_command support' -a list -d 'List support branches'
complete -f -c git -n '__fish_git_flow_using_command support' -s v    -d 'Verbose output'

complete -f -c git -n '__fish_git_flow_using_command support' -a start -d 'Start a new support branch'
complete -f -c git -n '__fish_git_flow_using_command support start' -s F  -d 'Fetch from origin first'
