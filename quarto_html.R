files <-
  c("/Users/max/zsh-r-scripts/resources/_quarto.yml",
    "/Users/max/zsh-r-scripts/resources/main.qmd",
    "/Users/max/zsh-r-scripts/resources/style.scss"
    )

print("Copying files...")
for (file in files) {
  fs::file_copy(file, ".")
}

