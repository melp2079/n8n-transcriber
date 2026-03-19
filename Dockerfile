# Use official n8n image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install FFmpeg (required for audio transcription)
RUN apk add --no-cache ffmpeg

# Install the free transcription node globally
RUN npm install -g n8n-nodes-transcribe-audio

# Create directory for community nodes and set permissions
RUN mkdir -p /home/node/.n8n/nodes && \
    chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Set environment variable to load community nodes
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/nodes
