#-------------------------------------------
# Dockerfile for deploying an Nginx web app
#-------------------------------------------

# Use the official Nginx image as the base image
FROM nginx:alpine

MAINTAINER mansourka (mansour.ka.devops@gmail.com)

# Set Working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy webapp files to  into the container
COPY app/ ./

# Ensure permissions are set correctly for security
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80 for the Nginx web server
EXPOSE 80

# Specify a health check to ensure the container is running correctly
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD curl -f http://localhost/ || exit 1

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
