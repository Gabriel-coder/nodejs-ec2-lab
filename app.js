const http = require('http');
const port = 3000;

const requestHandler = (request, response) => {
  response.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
  response.end('Aplicação Node.js executando via PM2 na EC2!');
};

const server = http.createServer(requestHandler);

server.listen(port, () => {
  console.log(`Servidor escutando em http://localhost:${port}`);
});

