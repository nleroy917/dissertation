# My dissertation
This is my dissertation for my PhD at the University of Virginia on the Atacformer project. It is written in typst.

## Building
To build the dissertation, you need three things:

1. `typst` installed,
2. my dissertation template, and
3. my references

### Install typst
You can install `typst` using their [installation guide](https://github.com/typst/typst?tab=readme-ov-file#installation). Its probably easiest to just grab from crates.io if you have the Rust toolchain installed:
```bash
cargo install --locked typst-cli
```

### Get my dissertation template (the hardest part)
You'll need [my dissertation template](https://github.com/nleroy917/dissertation-typst-template). You can put it in your [typst local packages dir](https://github.com/typst/packages?tab=readme-ov-file#local-packages). Local packages are stored in `{data-dir}/typst/packages/{namespace}/{name}/{version}` to make them available locally on your system. Here, `{data-dir}` is

- `$XDG_DATA_HOME` or `~/.local/share` on Linux
- `~/Library/Application Support` on macOS
- `%APPDATA%` on Windows


So, for example, on Linux you can make a directory for the template and clone the repository there:
```bash
mkdir -p $XDG_DATA_HOME/typst/packages/local/dissertation
git clone git@github.com:nleroy917/dissertation-typst-template.git $XDG_DATA_HOME/typst/packages/local/dissertation
```

### Install my references
Finally, grab my references from GitHub. I'll need to add you to the repo since its private, but then you can bring those down locally

```bash
curl -O https://raw.githubusercontent.com/nathanleroy/dissertation-template/main/refs.bib
```
