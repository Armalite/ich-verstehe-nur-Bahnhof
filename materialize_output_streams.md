# Materialize - Output Streams

You can output stream of processed data (e.g. from materialize view) by tailing the view to stdout:
```
COPY (TAIL my_beautiful_view) TO stdout;
```
Note: This requires that you first connect to the materialize instance using a supported cli such as `psql`

If you want a make target for this instead, echopipe the above command to the Materialize instance cli connect command. e..g if you are using a postgres client:
```bash
mz-stream-show:
    echo "COPY (TAIL $(view)) TO stdout;" | psql -U materialize -h localhost -p 6875 materialize
```
Then you can call this make target with: `make mz-stream-show view=my_beautiful_view`
