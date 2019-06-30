# icepick
pull out relevant pip requirements from the root of a python project

# has this ever happened to you?
ever created a python project and realized you forgot to create a virtual environment, so now your project's actual dependencies are hidden deep in a maze of half-working conda environments and GDAL install attempts that work better on mars than on earth? yeah, me too.

# what does `icepick` do?
- searches the python files in your project directory for any `import` or `from <module> import` statements, then
- runs `pip freeze` or `pip3 freeze` (the "ice"), and 
- chooses the entries found in your current project (the "pick")
