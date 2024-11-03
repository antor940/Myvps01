# Start with the Windows Server Core image with a version compatible with Docker
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set working directory
WORKDIR /app

# Copy local scripts if available (optional, or download them directly in RUN commands below)
# COPY Downloads.bat .
# COPY show.bat .
# COPY time.py .

# Download and run Essentials installer
RUN powershell -Command \
    Invoke-WebRequest -Uri "https://www.dropbox.com/scl/fi/qdyd4p9t6xoabl95n5o3g/Downloads.bat?rlkey=snr74vv1vr8k5suujugvrhjtm&dl=1" -OutFile "Downloads.bat"; \
    cmd /c Downloads.bat

# Run AnyDesk login
RUN cmd /c show.bat

# Run Time Counter script with Python
RUN powershell -Command \
    Invoke-WebRequest -Uri "https://path.to/your.time.script/time.py" -OutFile "time.py"; \
    python time.py

# Default command (for example, to keep container running)
CMD ["cmd.exe"]
