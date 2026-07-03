FROM nginx:alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy our pre-built app into nginx's web root
COPY dist/ /usr/share/nginx/html/

# Replace default nginx config to listen on port 3000 instead of 80
RUN sed -i 's/listen       80;/listen       3000;/' /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
