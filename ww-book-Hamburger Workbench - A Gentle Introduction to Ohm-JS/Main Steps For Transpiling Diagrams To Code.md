A diagram can be transpiled to code roughly by,
1. convert the diagram to raw text
2. inference facts about the contents of the diagram
3. convert the inferenced details into JSON
4. use text-based compilation tools to transpile the JSON data into a target text language (like Javascript, Python, etc.)