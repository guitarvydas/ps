![[walkthroughs-container-testbench.png]]
```
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
```

![[../Recording 20220511045152.webm]]
![[../Recording 20220511045320.webm]]
![[../Recording 20220511045906.webm]]

