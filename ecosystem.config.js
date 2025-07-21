cat <<EOF > ecosystem.config.js
module.exports = {
  apps: [{
    name: "node-app",
    script: "app.js",
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: "200M"
  }]
}
EOF
