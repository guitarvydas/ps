```
[
  [
    {
      "children": [],
      "connections": [],
      "id":"cell_12",
      "inputs": [],
      "name":"HTML Button",
      "outputs": ["click" ],
      "synccode":"me.send (&quot;click&quot;, true);"
    }
  ],
  [
    {
      "children": [],
      "connections": [],
      "id":"cell_15",
      "inputs": ["go" ],
      "name":"Phrase Faker",
      "outputs": ["short phrase", "long phrase" ],
      "synccode":"&lt;div&gt;&amp;nbsp; &amp;nbsp; me.send (&quot;long phrase&quot;, &quot;I Want A Hamburger With Ketchup And Bacon And Pickles&quot;);&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;"
    }
  ],
  [
    {
      "children": [],
      "connections": [],
      "id":"cell_22",
      "inputs": ["phrase" ],
      "name":"Phrase Parser",
      "outputs": ["order no choices", "order with choices", "parse error", "hook error" ],
      "synccode":""
    }
  ],
  [
    {
      "children": ["HTML Button", "Phrase Faker", "Order Taker" ],
      "connections": [
        {
          "receivers": [ {"receiver": {"component":"Phrase Faker", "port":"go"}} ],
          "senders": [ {"sender": {"component":"HTML Button", "port":"click"}} ]
        },
        {
          "receivers": [ {"receiver": {"component":"Order Taker", "port":"phrase"}} ],
          "senders": [ {"sender": {"component":"Phrase Faker", "port":"short phrase"}} ]
        },
        {
          "receivers": [ {"receiver": {"component":"Order Taker", "port":"phrase"}} ],
          "senders": [ {"sender": {"component":"Phrase Faker", "port":"long phrase"}} ]
        },
        {
          "receivers": [ {"receiver": {"component":"Test Bench", "port":"food order"}} ],
          "senders": [ {"sender": {"component":"Order Taker", "port":"food order"}} ]
        }
      ],
      "id":"cell_6",
      "inputs": [],
      "name":"Test Bench",
      "outputs": ["food order" ],
      "synccode":""
    }
  ],
  [
    {
      "children": ["Phrase Parser" ],
      "connections": [
        {
          "receivers": [ {"receiver": {"component":"Phrase Parser", "port":"phrase"}} ],
          "senders": [ {"sender": {"component":"Order Taker", "port":"phrase"}} ]
        },
        {
          "receivers": [ {"receiver": {"component":"Order Taker", "port":"food order"}} ],
          "senders": [ {"sender": {"component":"Phrase Parser", "port":"order no choices"}} ]
        },
        {
          "receivers": [ {"receiver": {"component":"Order Taker", "port":"food order"}} ],
          "senders": [ {"sender": {"component":"Phrase Parser", "port":"order with choices"}} ]
        }
      ],
      "id":"cell_7",
      "inputs": ["phrase" ],
      "name":"Order Taker",
      "outputs": ["food order" ],
      "synccode":""
    }
  ]
]
```

## Makefile
```
...
testbench.json : tools testbench.drawio
	./generate.bash $(TOOLS) testbench.drawio
	mv out.json testbench.json
...
```

generate.bash
```
#!/bin/bash
# usage: generate.bash <tools root directory> <.drawio file>
#                      $1                     $2

# tools root - takes the place of $PATH
# change this for your own environment
root=`realpath $1`

infile=$2

${root}/d2f/d2f.bash ${root} ${infile} >fb.pl
# from this point on, we can ignore ${infile} since it's been converted to fb.pl
${root}/das2f/run-fb-pipeline.bash ${root} #2>/dev/null
${root}/das2j/layercomponent_query.bash >out.json
echo
echo 'out.json written'
echo

```