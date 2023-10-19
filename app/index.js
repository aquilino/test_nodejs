const express = require('express');
const app = express();
const Docker = require('dockerode');
const docker = new Docker();

app.get('/', async (req, res) => {
  try {
    const containers = await docker.listContainers();
    const containerNames = containers.map((container) => container.Names[0]);
    res.json(containerNames);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(8080, () => {
  console.log('Server is running on port 8080');
});