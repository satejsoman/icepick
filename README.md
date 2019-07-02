# icepick
pull out relevant pip requirements from the root of a python project

# has this ever happened to you?
ever created a python project and realized you forgot to create a virtual environment, so now your project's actual dependencies are hidden deep in a maze of half-working conda environments and GDAL install attempts that work better on mars than on earth? yeah, me too.

# what does `icepick` do?
- searches the python files in your project directory for any `import` or `from <module> import` statements, then
- runs `pip freeze` or `pip3 freeze` (the "ice"), and 
- chooses the entries found in your current project (the "pick")

# install 
clone the repo/download the script somewhere safe, and add an alias in your shell config or active session to point to the script: 
```bash
alias icepick=/path/to/script/icepick.sh
```
i'll figure out how to properly package and release this later

# use 
## basic
at the root of a python project directory, run `icepick`:
```bash 
cd my-cool-python-project
icepick
```

## pass in `pip freeze` options
all script options are passed through to `pip freeze`
```
icepick --exclude-editable
```


## set `pip` executable
set the desired executable in your shell before calling `icepick`:
```bash
pip=pip3 icepick
pip=./venv/bin/pip3 icepick 
```

# caveats
the tool can't handle module aliases e.g. `PIL` provided by `Pillow` 
