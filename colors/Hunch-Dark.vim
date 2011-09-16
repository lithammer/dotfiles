" Vim color file
" Converted from Textmate theme Hunch Dark using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Hunch Dark"

hi Cursor  guifg=NONE guibg=#00f7f7 gui=NONE
hi Visual  guifg=NONE guibg=#3c4043 gui=NONE
hi CursorLine  guifg=NONE guibg=#24241d gui=NONE
hi CursorColumn  guifg=NONE guibg=#24241d gui=NONE
hi LineNr  guifg=#818181 guibg=#141414 gui=NONE
hi VertSplit  guifg=#3d3d3d guibg=#3d3d3d gui=NONE
hi MatchParen  guifg=#66c8f0 guibg=NONE gui=NONE
hi StatusLine  guifg=#ededed guibg=#3d3d3d gui=bold
hi StatusLineNC  guifg=#ededed guibg=#3d3d3d gui=NONE
hi Pmenu  guifg=#eb7962 guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#3c4043 gui=NONE
hi IncSearch  guifg=NONE guibg=#3f454f gui=NONE
hi Search  guifg=NONE guibg=#3f454f gui=NONE
hi Directory  guifg=#ef7aa0 guibg=NONE gui=NONE
hi Folded  guifg=#7d7d7d guibg=#141414 gui=NONE

hi Normal  guifg=#ededed guibg=#141414 gui=NONE
hi Boolean  guifg=#ef7aa0 guibg=NONE gui=NONE
hi Character  guifg=#ef7aa0 guibg=NONE gui=NONE
hi Comment  guifg=#7d7d7d guibg=NONE gui=italic
hi Conditional  guifg=#66c8f0 guibg=NONE gui=NONE
hi Constant  guifg=#ef7aa0 guibg=NONE gui=NONE
hi Define  guifg=#66c8f0 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#ef7aa0 guibg=NONE gui=NONE
hi Function  guifg=#58f3c3 guibg=#243037 gui=NONE
hi Identifier  guifg=#f9ee98 guibg=NONE gui=NONE
hi Keyword  guifg=#66c8f0 guibg=NONE gui=NONE
hi Label  guifg=#9bca7e guibg=#141614 gui=NONE
hi NonText  guifg=#4f4f4f guibg=#24241d gui=NONE
hi Number  guifg=#ef7aa0 guibg=NONE gui=NONE
hi Operator  guifg=#66c8f0 guibg=NONE gui=NONE
hi PreProc  guifg=#66c8f0 guibg=NONE gui=NONE
hi Special  guifg=#ededed guibg=NONE gui=NONE
hi SpecialKey  guifg=#4f4f4f guibg=#24241d gui=NONE
hi Statement  guifg=#66c8f0 guibg=NONE gui=NONE
hi StorageClass  guifg=#f9ee98 guibg=NONE gui=NONE
hi String  guifg=#9bca7e guibg=#141614 gui=NONE
hi Tag  guifg=#eb7962 guibg=NONE gui=NONE
hi Title  guifg=#ededed guibg=NONE gui=bold
hi Todo  guifg=#7d7d7d guibg=NONE gui=inverse,bold,italic
hi Type  guifg=#eb7962 guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#66c8f0 guibg=NONE gui=NONE
hi rubyFunction  guifg=#58f3c3 guibg=#243037 gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#ef7aa0 guibg=NONE gui=NONE
hi rubyConstant  guifg=#c194ce guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#9bca7e guibg=#141614 gui=NONE
hi rubyBlockParameter  guifg=#95a7c7 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#95a7c7 guibg=NONE gui=NONE
hi rubyInclude  guifg=#66c8f0 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#95a7c7 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape  guifg=#ef7aa0 guibg=NONE gui=NONE
hi rubyControl  guifg=#66c8f0 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#95a7c7 guibg=NONE gui=NONE
hi rubyOperator  guifg=#66c8f0 guibg=NONE gui=NONE
hi rubyException  guifg=#66c8f0 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#95a7c7 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#c194ce guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#e9a992 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#e9a992 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#e9a992 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#e9a992 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#7d7d7d guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#e9a992 guibg=NONE gui=NONE
hi htmlTag  guifg=#ac885b guibg=NONE gui=NONE
hi htmlEndTag  guifg=#ac885b guibg=NONE gui=NONE
hi htmlTagName  guifg=#ac885b guibg=NONE gui=NONE
hi htmlArg  guifg=#ac885b guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#ef7aa0 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#f9ee98 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#e9a992 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#eb7962 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#95a7c7 guibg=NONE gui=NONE
hi yamlAlias  guifg=#95a7c7 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#9bca7e guibg=#141614 gui=NONE
hi cssURL  guifg=#95a7c7 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#e9a992 guibg=NONE gui=NONE
hi cssColor  guifg=#ef7aa0 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#eb7962 guibg=NONE gui=NONE
hi cssClassName  guifg=#eb7962 guibg=NONE gui=NONE
hi cssValueLength  guifg=#ef7aa0 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#daac65 guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE