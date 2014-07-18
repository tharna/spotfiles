" Vim syntax file
" Language: Project
" Maintainer:   Abhijit Nadgouda (http://ifacethoughts.net/)

syntax clear

syn match projTag            "\*[a-zA-zöäÖÄ0-9.,\- ]*\*"
syn match projJump           "|[a-zA-z]*|"

syn match projDate           "=\d\d\d\d\d\d\d\d" contained
syn match projDone           "=done" contained
syn match projHigh           "=high" contained
syn match projLater          "=later" contained

syn match projKeyword        ":phone" contained
syn match projKeyword        ":email" contained
syn match projKeyword        ":chat" contained
syn match projKeyword        ":meet" contained

syn match projTask      "\-\s.*" contains=projDate,projDone,projHigh,projKeyword
syn match projTaskInfo  "\->\s.*" contains=projDate,projDone,projHigh,projKeyword
syn match projTaskH     "\-\s.*=high" contains=projDate,projHigh,projKeyword
syn match projTaskD     "\-\s.*=done" contains=projDate,projDone,projKeyword
syn match projTaskL     "\-\s.*=later" contains=projDate,projDone,projKeyword
syn region projTaskDoc  matchgroup=Comment start=/\[/ end=/\]/
syn region projTaskCode  matchgroup=Comment start=/ < / end=/ > /


hi def link projTag          String
hi def link projJump         String

hi def link projDate         Constant
hi def link projDone         SpecialChar
hi def link projHigh         SpecialChar
hi def link projLater        SpecialChar
hi def link projKeyword      SpecialChar

hi def link projTask         Identifier
hi def link projTaskInfo     NonText
hi def link projTaskDoc      Statement
hi def link projTaskCode     PreProc

hi def link projTaskD        Comment
hi def link projTaskH        Special
hi def link projTaskH        Comment

