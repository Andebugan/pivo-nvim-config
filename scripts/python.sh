# Python
sudo apt install pip python3-venv -y\
    && mkdir ~/.virtualenvs\
    && cd ~/.virtualenvs\
    && python3 -m venv debugpy
    && debugpy/bin/python -m pip install debugpy
