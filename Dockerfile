FROM fedora:37

# Execution user name after container startup
ARG USER_NAME

# Repository Update
RUN dnf update -y

# Install sudo
RUN dnf install sudo -y

# Install git
RUN dnf install git -y

# Add User
RUN adduser ${USER_NAME} --badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" | tee /etc/sudoers

ENTRYPOINT tail -f /dev/null