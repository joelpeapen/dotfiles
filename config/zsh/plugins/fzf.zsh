[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd -t d -LH"
export FZF_DEFAULT_OPTS="
--multi
--reverse
--bind=change:first,\
tab:down,\
btab:up,\
alt-\;:jump,\
alt-\::jump-accept,\
alt-i:select,\
alt-e:deselect,\
alt-a:select-all,\
alt-A:deselect-all,\
alt-space:toggle+down,\
alt-h:deselect+up,\
ctrl-y:offset-up,\
ctrl-e:offset-down,\
alt-k:half-page-up,\
alt-j:half-page-down,\
ctrl-s:toggle-sort,\
alt-u:preview-up,\
alt-d:preview-down,\
ctrl-space:toggle-preview
--preview \
'case \$(file --mime-type -Lb {}) in
    *csv) csview {};;
    *markdown) pistol {} | bat -n;;
    *text* | *json | *xml) bat -n --color=always {};;
    audio*) mediainfo {};;
    image*) kitty icat --stdin no --clear --transfer-mode stream --place \${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES}@0x0 {};;
    video*) kitty icat --stdin no --clear --transfer-mode stream --place \${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES}@0x0 \$(vidthumb {});;
    *pdf) kitty icat --stdin yes --clear --transfer-mode stream --place \${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES}@0x0 \
          <<< \$(pdftoppm -jpeg -f 1 -l 1 -tiffcompression jpeg -scale-to-x -1 -scale-to-y 1080 -singlefile {});;
    inode/directory) eza -la --icons --no-user --no-time --color=always {} | bat -n;;
    *) pistol {} | bat -n;;
esac'"

export FZF_CTRL_T_COMMAND="fd -t f -LH"
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_R_OPTS="--preview ''"

bindkey '\es' fzf-file-widget
