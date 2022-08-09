# Awaitable Python Classes
To make awaitable Python classes, create a class that inherits from the following class:
```Python
class AsyncObject(object):
    """Inheriting this class allows defining an async __init__"""

    async def __new__(cls, *a: dict, **kw: dict):
        instance = super().__new__(cls)
        await instance.__init__(*a, **kw)  # type: ignore
        return instance

    async def __init__(self):
        pass
```

For example:

```Python
class MyAwaitableClass(AsyncObject):
    """
        Class that inherits AsyncObject in order to be able to make its init function awaitable
    """

    async def __init__(self, some_arg):
        self.some_arg = some_arg
```

Now you can instantiate this object like so:

```Python

my_awesome_async_object = await MyAwaitableClass()

```