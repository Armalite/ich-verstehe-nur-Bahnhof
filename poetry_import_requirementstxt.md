# Poetry - Import Requirements.txt
If you use poetry and wish to import the requirements.txt of a related/dependent project, you can import some of these packages like so.

If the packages are versioned:
```bash
cat requirements.txt | xargs -I % sh -c 'poetry add "%"'
```

If no versions:
```bash
cat requirements.txt|xargs poetry add
```
