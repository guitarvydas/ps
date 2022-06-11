---

type: experiment
---

```
ltpct tp.file.title pctgt
ltpct tp.date.now("YYYY-MM-DD") pctgt
ltpct tp.frontmatter.type pctgt
```

Play
2022-06-10
experiment

```
callouts 
gt spc lb bang important rb title
gt rest
```

> [!important] title
> the rest


```
callouts collapsed
gt spc lb bang minus important rb title
gt rest
```

> [!important]- title
> the rest

```
callouts expanded
gt spc lb bang plus important rb title
gt rest
```

> [!important]+ title
> the rest

```dataview
TABLE project
WHERE project = "Project X"
SORT file.name ASC
```
```dataview
LIST location
WHERE project = "Project X"
```
```dataview
TABLE location
WHERE project = "Project X"
```
```dataview
TASK
WHERE !completed
```
```dataview
TASK
WHERE completed
```

```dataview
TABLE task
```
