" Vim color file
" Converted from Textmate theme Hunch Dark bright using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Hunch Dark bright"

hi Cursor  guifg=NONE guibg=#ca0004 gui=NONE
hi Visual  guifg=NONE guibg=#c0e0ec gui=NONE
hi CursorLine  guifg=NONE guibg=#ebf3f7 gui=NONE
hi CursorColumn  guifg=NONE guibg=#ebf3f7 gui=NONE
hi LineNr  guifg=#808080 guibg=#ffffff gui=NONE
hi VertSplit  guifg=#cfcfcf guibg=#cfcfcf gui=NONE
hi MatchParen  guifg=#0078b2 guibg=NONE gui=NONE
hi StatusLine  guifg=#000000 guibg=#cfcfcf gui=bold
hi StatusLineNC  guifg=#000000 guibg=#cfcfcf gui=NONE
hi Pmenu  guifg=#9e5f4f guibg=NONE gui=bold
hi PmenuSel  guifg=NONE guibg=#c0e0ec gui=NONE
hi IncSearch  guifg=NONE guibg=#cdcde8 gui=NONE
hi Search  guifg=NONE guibg=#cdcde8 gui=NONE
hi Directory  guifg=#e52f86 guibg=NONE gui=NONE
hi Folded  guifg=#c59da0 guibg=#ffffff gui=NONE

hi Normal  guifg=#000000 guibg=#ffffff gui=NONE
hi Boolean  guifg=#e52f86 guibg=NONE gui=NONE
hi Character  guifg=#e52f86 guibg=NONE gui=NONE
hi Comment  guifg=#c59da0 guibg=#fff0ef gui=italic
hi Conditional  guifg=#0078b2 guibg=NONE gui=NONE
hi Constant  guifg=#e52f86 guibg=NONE gui=NONE
hi Define  guifg=#0078b2 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#e52f86 guibg=NONE gui=NONE
hi Function  guifg=#d46700 guibg=#ffffff gui=bold
hi Identifier  guifg=#a86500 guibg=NONE gui=NONE
hi Keyword  guifg=#0078b2 guibg=NONE gui=NONE
hi Label  guifg=#428d44 guibg=NONE gui=NONE
hi NonText  guifg=#ffc3bf guibg=#ebf3f7 gui=NONE
hi Number  guifg=#e52f86 guibg=NONE gui=NONE
hi Operator  guifg=#0078b2 guibg=NONE gui=NONE
hi PreProc  guifg=#0078b2 guibg=NONE gui=NONE
hi Special  guifg=#000000 guibg=NONE gui=NONE
hi SpecialKey  guifg=#ffc3bf guibg=#ebf3f7 gui=NONE
hi Statement  guifg=#0078b2 guibg=NONE gui=NONE
hi StorageClass  guifg=#a86500 guibg=NONE gui=NONE
hi String  guifg=#428d44 guibg=NONE gui=NONE
hi Tag  guifg=#9e5f4f guibg=NONE gui=bold
hi Title  guifg=#000000 guibg=NONE gui=bold
hi Todo  guifg=#c59da0 guibg=#fff0ef gui=inverse,bold,italic
hi Type  guifg=#9e5f4f guibg=NONE gui=bold
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#0078b2 guibg=NONE gui=NONE
hi rubyFunction  guifg=#d46700 guibg=#ffffff gui=bold
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#e52f86 guibg=NONE gui=NONE
hi rubyConstant  guifg=#8e60b4 guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#428d44 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#6667ba guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#6667ba guibg=NONE gui=NONE
hi rubyInclude  guifg=#0078b2 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#6667ba guibg=NONE gui=NONE
hi rubyRegexp  guifg=#e34a4a guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#e34a4a guibg=NONE gui=NONE
hi rubyEscape  guifg=#e52f86 guibg=NONE gui=NONE
hi rubyControl  guifg=#0078b2 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#6667ba guibg=NONE gui=NONE
hi rubyOperator  guifg=#0078b2 guibg=NONE gui=NONE
hi rubyException  guifg=#0078b2 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#6667ba guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#8e60b4 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#796c52 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#796c52 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#796c52 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#796c52 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#c59da0 guibg=#fff0ef gui=italic
hi erubyRailsMethod  guifg=#796c52 guibg=NONE gui=NONE
hi htmlTag  guifg=#94564c guibg=NONE gui=NONE
hi htmlEndTag  guifg=#94564c guibg=NONE gui=NONE
hi htmlTagName  guifg=#94564c guibg=NONE gui=NONE
hi htmlArg  guifg=#94564c guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#e52f86 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#a86500 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#796c52 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#9e5f4f guibg=NONE gui=bold
hi yamlAnchor  guifg=#6667ba guibg=NONE gui=NONE
hi yamlAlias  guifg=#6667ba guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#428d44 guibg=NONE gui=NONE
hi cssURL  guifg=#6667ba guibg=NONE gui=NONE
hi cssFunctionName  guifg=#796c52 guibg=NONE gui=NONE
hi cssColor  guifg=#e52f86 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#9e5f4f guibg=NONE gui=bold
hi cssClassName  guifg=#9e5f4f guibg=NONE gui=bold
hi cssValueLength  guifg=#e52f86 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#768132 guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE