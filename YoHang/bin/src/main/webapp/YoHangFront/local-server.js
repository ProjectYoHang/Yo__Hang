const express = require('express');
const path = require('path');
const app = express();

app.use('/static', express.static(path.join(__dirname, 'build')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'build','html','index.html'));
});

app.listen(9000, () => console.log(`Example app listening on port 9000!`));