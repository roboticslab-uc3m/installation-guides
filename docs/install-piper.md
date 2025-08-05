# Install Piper

Lightweight neural network-based speech synthesis (TTS) system that can run offline. The official repository is [OHF-Voice/piper1-gpl](https://github.com/OHF-Voice/piper1-gpl), but we have forked it ([roboticslab-uc3m/piper1-gpl](https://github.com/roboticslab-uc3m/piper1-gpl)) to properly export its C++ library and headers for use by our [speech-related applications](https://github.com/roboticslab-uc3m/speech).

## Install Piper (Ubuntu)

```bash
git clone https://github.com/roboticslab-uc3m/piper1-gpl
mkdir -p piper1-gpl/libpiper/build && cd $_
cmake ..
make -j
sudo cmake --install .
```

## Download Piper Voices

Piper voice models can be previewed online [here](https://rhasspy.github.io/piper-samples/) and downloaded from [Hugging Face](https://huggingface.co/rhasspy/piper-voices).
