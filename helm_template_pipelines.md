# Helm Template Pipelines

Function calls and other commands can be chained in the helm config by piping (pipelines) one command to the next
e.g.
```Helm
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
  drink: {{ .Values.favorite.drink | quote }}
  food: {{ .Values.favorite.food | upper | quote }}
```

The last line of the example above passes the favorite food field to the upper function, and then in turn to the quote function.
