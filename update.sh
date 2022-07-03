#!/bin/sh

# setup or update packer configuration 

nvim --headless \
  -c 'autocmd User PackerComplete quitall' \
  -c 'PackerSync'
