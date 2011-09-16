" Vim color file
" Converted from Textmate theme Hunch Dark dimmed using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Hunch Dark dimmed"

hi Cursor  guifg=NONE guibg=#00f7f7 gui=NONE
hi Visual  guifg=NONE guibg=#3c4043 gui=NONE
hi CursorLine  guifg=NONE guibg=#24241d gui=NONE
hi CursorColumn  guifg=NONE guibg=#24241d gui=NONE
hi LineNr  guifg=#767676 guibg=#141414 gui=NONE
hi VertSplit  guifg=#393939 guibg=#393939 gui=NONE
hi MatchParen  guifg=#71bbda guibg=NONE gui=NONE
hi StatusLine  guifg=#d8d8d8 guibg=#393939 gui=bold
hi StatusLineNC  guifg=#d8d8d8 guibg=#393939 gui=NONE
hi Pmenu  guifg=#cac1a3 guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#3c4043 gui=NONE
hi IncSearch  guifg=NONE guibg=#464b54 gui=NONE
hi Search  guifg=NONE guibg=#464b54 gui=NONE
hi Directory  guifg=#d397a9 guibg=NONE gui=NONE
hi Folded  guifg=#7d7d7d guibg=#141414 gui=NONE

hi Normal  guifg=#d8d8d8 guibg=#141414 gui=NONE
hi Boolean  guifg=#d397a9 guibg=NONE gui=NONE
hi Character  guifg=#d397a9 guibg=NONE gui=NONE
hi Comment  guifg=#7d7d7d guibg=NONE gui=italic
hi Conditional  guifg=#71bbda guibg=NONE gui=NONE
hi Constant  guifg=#d397a9 guibg=NONE gui=NONE
hi Define  guifg=#71bbda guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#d397a9 guibg=NONE gui=NONE
hi Function  guifg=#85e1cb guibg=#161d21 gui=NONE
hi Identifier  guifg=#f9efc0 guibg=NONE gui=NONE
hi Keyword  guifg=#71bbda guibg=NONE gui=NONE
hi Label  guifg=#8dac88 guibg=NONE gui=NONE
hi NonText  guifg=#4f4f4f guibg=#24241d gui=NONE
hi Number  guifg=#d397a9 guibg=NONE gui=NONE
hi Operator  guifg=#71bbda guibg=NONE gui=NONE
hi PreProc  guifg=#71bbda guibg=NONE gui=NONE
hi Special  guifg=#d8d8d8 guibg=NONE gui=NONE
hi SpecialKey  guifg=#4f4f4f guibg=#24241d gui=NONE
hi Statement  guifg=#71bbda guibg=NONE gui=NONE
hi StorageClass  guifg=#f9efc0 guibg=NONE gui=NONE
hi String  guifg=#8dac88 guibg=NONE gui=NONE
hi Tag  guifg=#cac1a3 guibg=NONE gui=NONE
hi Title  guifg=#d8d8d8 guibg=NONE gui=bold
hi Todo  guifg=#7d7d7d guibg=NONE gui=inverse,bold,italic
hi Type  guifg=#cac1a3 guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#71bbda guibg=NONE gui=NONE
hi rubyFunction  guifg=#85e1cb guibg=#161d21 gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#d397a9 guibg=NONE gui=NONE
hi rubyConstant  guifg=#c9adcc guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#8dac88 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#abbcd7 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#abbcd7 guibg=NONE gui=NONE
hi rubyInclude  guifg=#71bbda guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#abbcd7 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#e9d1a2 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#e9d1a2 guibg=NONE gui=NONE
hi rubyEscape  guifg=#d397a9 guibg=NONE gui=NONE
hi rubyControl  guifg=#71bbda guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#abbcd7 guibg=NONE gui=NONE
hi rubyOperator  guifg=#71bbda guibg=NONE gui=NONE
hi rubyException  guifg=#71bbda guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#abbcd7 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#c9adcc guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#e9df6e guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#e9df6e guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#e9df6e guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#e9df6e guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#7d7d7d guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#e9df6e guibg=NONE gui=NONE
hi htmlTag  guifg=#ac885b guibg=NONE gui=NONE
hi htmlEndTag  guifg=#ac885b guibg=NONE gui=NONE
hi htmlTagName  guifg=#ac885b guibg=NONE gui=NONE
hi htmlArg  guifg=#ac885b guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#d397a9 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#f9efc0 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#e9df6e guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#cac1a3 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#abbcd7 guibg=NONE gui=NONE
hi yamlAlias  guifg=#abbcd7 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#8dac88 guibg=NONE gui=NONE
hi cssURL  guifg=#abbcd7 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#e9df6e guibg=NONE gui=NONE
hi cssColor  guifg=#d397a9 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#cac1a3 guibg=NONE gui=NONE
hi cssClassName  guifg=#cac1a3 guibg=NONE gui=NONE
hi cssValueLength  guifg=#d397a9 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#ace0ba guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE