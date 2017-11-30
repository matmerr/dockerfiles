if [ ! -d ".vscode" ]; then
  # vscode does not exist
  sudo mv ../.vscode .
fi
cat .vscode/terminal/.shell >> ~/.bashrc && \
cat .vscode/terminal/.dir_colors > ~/.dir_colors 
