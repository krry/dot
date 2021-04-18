scriptencoding utf-8

set formatlistpat=^\\s*                     " Optional leading whitespace
set formatlistpat+=[                        " Start character class
set formatlistpat+=\\[({]\\?                " \  Optionally match opening punctuation
set formatlistpat+=\\(                      " \  Start group
set formatlistpat+=[0-9]\\+                 " \  \  Numbers
set formatlistpat+=\\\|                     " \  \  or
set formatlistpat+=[a-zA-Z]\\+              " \  \  Letters
set formatlistpat+=\\)                      " \  End group
set formatlistpat+=[\\]:.)}                 " \  Closing punctuation
set formatlistpat+=]                        " End character class
set formatlistpat+=\\s\\+                   " One or more spaces
set formatlistpat+=\\\|                     " or
set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points
