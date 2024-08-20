# Postgres 
FROM postgres:bookworm
RUN sed -i -e 's/db = false/db = true/g' /root/.config/nvim/lua/plugins/config/local_config.lua

