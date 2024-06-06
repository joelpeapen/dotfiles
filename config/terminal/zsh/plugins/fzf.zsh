[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd -t d -LH"
export FZF_DEFAULT_OPTS="--preview \
'case \$(file --mime-type -Lb {}) in
    image/*) kitty icat --clear --transfer-mode stream --place \${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES}@0x0 {};;
    video/*) vidthumb {} | kitty icat --clear --transfer-mode file --stdin yes --place \${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES}@0x0;;
    text/csv) csview {};;
    inode/directory) eza -l --icons --no-user --no-time --color=always {} | bat -n;;
    *) bat -n --color=always {};;
esac' \
--multi
--reverse
--bind=change:first,\
tab:down,btab:up,\
alt-i:select,\
alt-e:deselect,\
alt-a:select-all,\
alt-A:deselect-all,\
alt-space:toggle+down,\
alt-h:deselect+up,\
alt-j:half-page-down,\
alt-k:half-page-up,\
ctrl-e:offset-down,\
ctrl-y:offset-up,\
alt-m:jump,\
alt-M:jump-accept,\
alt-d:preview-down,\
alt-u:preview-up,\
ctrl-space:toggle-preview"

export FZF_CTRL_T_COMMAND="fd -t f -LH"
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_R_OPTS="--preview ''"

bindkey '\es' fzf-file-widget
