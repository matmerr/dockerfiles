if [ ! -d ".vscode" ]; then
  # vscode does not exist
  cp -R ../.vscode .
fi
cat .vscode/terminal/.shell >> ~/.bashrc && cat .vscode/terminal/.dir_colors > ~/.dir_colors
