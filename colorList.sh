#!/bin/bash

for i in {0..255}
do
  printf "\x1b[38;5;${i}mcolour${i} "
  j=`expr $i % 10`
  if [ $j -eq 0 ] ;then
      printf "\n"
  fi
done
printf "\n"


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.014  000.014: --- VIM STARTING ---
000.100  000.086: Allocated generic buffers
000.479  000.379: locale set
000.494  000.015: window checked
001.081  000.587: inits 1
001.216  000.135: parsing arguments
001.221  000.005: expanding arguments
001.242  000.021: shell init
001.869  000.627: Termcap init
001.896  000.027: inits 2
002.018  000.122: init highlight
002.314  000.207  000.207: sourcing $VIM/vimrc
003.304  000.549  000.549: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/autoload/neobundle/util.vim
004.447  001.852  001.303: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/autoload/neobundle.vim
004.782  000.216  000.216: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/autoload/neobundle/init.vim
005.796  000.747  000.747: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/autoload/neobundle/config.vim
006.337  000.306  000.306: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/autoload/neobundle/autoload.vim
006.981  000.383  000.383: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/autoload/neobundle/parser.vim
007.738  000.448  000.448: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/autoload/neobundle/types/git.vim
032.183  029.735  025.783: sourcing /Users/rtakasuke/dotfiles/.vimrc.neobundle
036.648  004.354  004.354: sourcing /Users/rtakasuke/dotfiles/.vimrc.statusline
055.912  000.043  000.043: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/ftdetect/vimrecipe.vim
056.028  019.131  019.088: sourcing /usr/share/vim/vim73/filetype.vim
056.214  000.014  000.014: sourcing /usr/share/vim/vim73/filetype.vim
056.470  000.089  000.089: sourcing /usr/share/vim/vim73/indent.vim
056.640  000.013  000.013: sourcing /usr/share/vim/vim73/filetype.vim
056.852  000.051  000.051: sourcing /usr/share/vim/vim73/ftplugin.vim
057.018  000.013  000.013: sourcing /usr/share/vim/vim73/indent.vim
058.279  000.485  000.485: sourcing /Users/rtakasuke/.vim/bundle/Colour-Sampler-Pack/colors/desert.vim
059.198  000.249  000.249: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
059.652  000.214  000.214: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
059.846  001.157  000.694: sourcing /Users/rtakasuke/.vim/bundle/Colour-Sampler-Pack/colors/desert.vim
059.961  001.383  000.226: sourcing /usr/share/vim/vim73/syntax/synload.vim
060.001  001.632  000.249: sourcing /usr/share/vim/vim73/syntax/syntax.vim
084.302  081.918  026.401: sourcing $HOME/.vimrc
084.335  000.192: sourcing vimrc file(s)
088.722  003.807  003.807: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/unite.vim
088.826  004.108  000.301: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/plugin/unite/bookmark.vim
089.026  000.151  000.151: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/plugin/unite/buffer.vim
089.129  000.062  000.062: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/plugin/unite/history_yank.vim
089.257  000.091  000.091: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/plugin/unite/mru.vim
089.380  000.086  000.086: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/plugin/unite/window.vim
089.914  000.496  000.496: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/plugin/unite.vim
090.234  000.160  000.160: sourcing /Users/rtakasuke/.vim/bundle/vim-startify/plugin/startify.vim
090.660  000.315  000.315: sourcing /Users/rtakasuke/.vim/bundle/ack.vim/plugin/ack.vim
091.644  000.375  000.375: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/autoload/nerdtree.vim
093.106  000.607  000.607: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/path.vim
093.351  000.161  000.161: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/menu_controller.vim
093.533  000.105  000.105: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/menu_item.vim
093.752  000.143  000.143: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/key_map.vim
094.103  000.275  000.275: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/bookmark.vim
094.537  000.354  000.354: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/tree_file_node.vim
405.116  000.970  000.970: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/tree_dir_node.vim
405.806  000.532  000.532: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/opener.vim
406.522  000.564  000.564: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/creator.vim
406.738  000.097  000.097: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/flag_set.vim
406.923  000.070  000.070: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/nerdtree.vim
407.450  000.415  000.415: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/ui.vim
407.600  000.036  000.036: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/event.vim
407.790  000.077  000.077: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/lib/nerdtree/notifier.vim
408.807  000.880  000.880: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/autoload/nerdtree/ui_glue.vim
434.615  000.134  000.134: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/nerdtree_plugin/exec_menuitem.vim
435.217  000.555  000.555: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/nerdtree_plugin/fs_menu.vim
435.606  344.833  338.483: sourcing /Users/rtakasuke/.vim/bundle/nerdtree/plugin/NERD_tree.vim
442.895  007.158  007.158: sourcing /Users/rtakasuke/.vim/bundle/vim-easymotion/plugin/EasyMotion.vim
444.155  001.124  001.124: sourcing /Users/rtakasuke/.vim/bundle/matchit/plugin/matchit.vim
444.647  000.211  000.211: sourcing /Users/rtakasuke/.vim/bundle/neocomplcache/plugin/neocomplcache/buffer_complete.vim
444.761  000.075  000.075: sourcing /Users/rtakasuke/.vim/bundle/neocomplcache/plugin/neocomplcache/dictionary_complete.vim
444.872  000.074  000.074: sourcing /Users/rtakasuke/.vim/bundle/neocomplcache/plugin/neocomplcache/include_complete.vim
444.980  000.072  000.072: sourcing /Users/rtakasuke/.vim/bundle/neocomplcache/plugin/neocomplcache/syntax_complete.vim
445.086  000.070  000.070: sourcing /Users/rtakasuke/.vim/bundle/neocomplcache/plugin/neocomplcache/tags_complete.vim
446.016  000.893  000.893: sourcing /Users/rtakasuke/.vim/bundle/neocomplcache/plugin/neocomplcache.vim
448.255  002.100  002.100: sourcing /Users/rtakasuke/.vim/bundle/Colour-Sampler-Pack/plugin/color_sample_pack.vim
450.659  002.336  002.336: sourcing /Users/rtakasuke/.vim/bundle/Colour-Sampler-Pack/plugin/mimicpak.vim
450.994  000.194  000.194: sourcing /Users/rtakasuke/.vim/bundle/quickrun.vim/plugin/quickrun.vim
455.729  004.615  004.615: sourcing /Users/rtakasuke/.vim/bundle/tComment/plugin/tcomment.vim
456.634  000.248  000.248: sourcing /Users/rtakasuke/.vim/bundle/vim-gitgutter/autoload/gitgutter/highlight.vim
457.983  002.110  001.862: sourcing /Users/rtakasuke/.vim/bundle/vim-gitgutter/plugin/gitgutter.vim
458.349  000.208  000.208: sourcing /Users/rtakasuke/.vim/bundle/yanktmp.vim/plugin/yanktmp.vim
459.460  000.839  000.839: sourcing /Users/rtakasuke/.vim/bundle/vim-visualstar/plugin/visualstar.vim
460.001  000.316  000.316: sourcing /Users/rtakasuke/.vim/bundle/vimproc.vim/plugin/vimproc.vim
462.107  001.884  001.884: sourcing /Users/rtakasuke/.vim/bundle/surround.vim/plugin/surround.vim
463.313  001.022  001.022: sourcing /Users/rtakasuke/.vim/bundle/snipmate.vim/plugin/snipMate.vim
471.239  007.705  007.705: sourcing /Users/rtakasuke/.vim/bundle/Align/plugin/AlignMapsPlugin.vim
471.460  000.151  000.151: sourcing /Users/rtakasuke/.vim/bundle/Align/plugin/AlignPlugin.vim
472.423  000.920  000.920: sourcing /Users/rtakasuke/.vim/bundle/Align/plugin/cecutil.vim
472.729  000.152  000.152: sourcing /Users/rtakasuke/.vim/bundle/lightline.vim/plugin/lightline.vim
472.922  000.065  000.065: sourcing /Users/rtakasuke/.vim/bundle/colorswatch.vim/plugin/colorswatch.vim
478.992  005.947  005.947: sourcing /Users/rtakasuke/.vim/bundle/vim-fugitive/plugin/fugitive.vim
479.449  000.112  000.112: sourcing /usr/share/vim/vim73/plugin/getscriptPlugin.vim
479.723  000.230  000.230: sourcing /usr/share/vim/vim73/plugin/gzip.vim
479.985  000.218  000.218: sourcing /usr/share/vim/vim73/plugin/matchparen.vim
480.798  000.768  000.768: sourcing /usr/share/vim/vim73/plugin/netrwPlugin.vim
480.893  000.019  000.019: sourcing /usr/share/vim/vim73/plugin/rrhelper.vim
480.968  000.034  000.034: sourcing /usr/share/vim/vim73/plugin/spellfile.vim
481.191  000.182  000.182: sourcing /usr/share/vim/vim73/plugin/tarPlugin.vim
481.296  000.062  000.062: sourcing /usr/share/vim/vim73/plugin/tohtml.vim
481.563  000.226  000.226: sourcing /usr/share/vim/vim73/plugin/vimballPlugin.vim
481.789  000.149  000.149: sourcing /usr/share/vim/vim73/plugin/zipPlugin.vim
482.031  000.082  000.082: sourcing /Users/rtakasuke/.vim/bundle/neobundle.vim/plugin/neobundle.vim
482.968  000.816  000.816: sourcing /Users/rtakasuke/.vim/bundle/snipmate.vim//after/plugin/snipMate.vim
482.976  005.200: loading plugins
482.982  000.006: inits 3
483.301  000.319: reading viminfo
483.327  000.026: setting raw mode
146440.949  145958.622: waiting for return
146440.961  000.012: start termcap
146441.097  000.136: clearing screen
146445.714  001.054  001.054: sourcing /usr/share/vim/vim73/scripts.vim
146446.306  000.029  000.029: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/vital.vim
146447.029  000.264  000.264: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/vital/_dbf7878.vim
146467.688  000.554  000.554: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/vital/_dbf7878/prelude.vim
146499.794  000.292  000.292: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/vital/_dbf7878/data/list.vim
146504.694  058.509  057.370: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/unite/util.vim
146505.061  058.993  000.484: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/unite/sources/buffer.vim
146505.396  000.158  000.158: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/unite/sources/window.vim
146506.031  000.442  000.442: sourcing /Users/rtakasuke/.vim/bundle/lightline.vim/autoload/lightline.vim
146506.865  000.070  000.070: sourcing /Users/rtakasuke/.vim/bundle/lightline.vim/autoload/lightline/tab.vim
146507.671  000.276  000.276: sourcing /Users/rtakasuke/.vim/bundle/lightline.vim/autoload/lightline/colorscheme.vim
146508.054  000.933  000.657: sourcing /Users/rtakasuke/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/wombat.vim
146511.681  008.934: opening buffers
146539.515  027.586  027.586: sourcing /Users/rtakasuke/.vim/bundle/unite.vim/autoload/unite/sources/mru.vim
146541.787  000.247  000.247: sourcing /Users/rtakasuke/.vim/bundle/vim-gitgutter/autoload/gitgutter.vim
146542.395  000.287  000.287: sourcing /Users/rtakasuke/.vim/bundle/vim-gitgutter/autoload/gitgutter/utility.vim
146542.927  000.219  000.219: sourcing /Users/rtakasuke/.vim/bundle/vim-gitgutter/autoload/gitgutter/sign.vim
146546.826  000.559  000.559: sourcing /Users/rtakasuke/.vim/bundle/vim-gitgutter/autoload/gitgutter/diff.vim
146558.820  000.214  000.214: sourcing /Users/rtakasuke/.vim/bundle/vim-gitgutter/autoload/gitgutter/hunk.vim
146558.938  018.145: BufEnter autocommands
146558.944  000.006: editing files in windows
146559.939  000.668  000.668: sourcing /Users/rtakasuke/.vim/bundle/vim-startify/autoload/startify.vim
146560.133  000.521: VimEnter autocommands
146560.135  000.002: before starting main loop
146562.367  002.232: first screen update
146562.371  000.004: --- VIM STARTED ---
