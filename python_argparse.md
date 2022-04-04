
# Python Argument Parser

Some basic examples of instantiating the parser and parsing positional args as well as a list of params

```python
import argparse

parser = argparse.ArgumentParser(
    description='Does beautiful things.',
)

parser.add_argument(
    'beautiful_arg',
    type=str,
    default='default_val', #remove this if arg required
    nargs='?',
    help='A beautiful positional argument',
    metavar='BARG',
)


args = parser.parse_args()


parser.add_argument(
    '--some-param', '-p',
    type=str,
    action='append',
    default=[],
    help='a parameter',
    metavar='PARAM',
)

args = parser.parse_args(['--some-param', 'val1', '--some-param', 'val2', '--some-param', 'val3'])
# Namespace(some_param=['val1', 'val2', 'val3'])

args = parser.parse_args(['-p', 'val1', '-p', 'val2', '-p', 'val3'])

print(args.arg)
print(args.some_param)
```
