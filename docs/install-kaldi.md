# Install Kaldi

Kaldi is a toolkit for speech recognition (ASR) written in C++. The official repository is [kaldi-asr/kaldi](https://github.com/kaldi-asr/kaldi), but we have forked it ([roboticslab-uc3m/kaldi](https://github.com/roboticslab-uc3m/kaldi)) to fix some compilation issues on top of [alphacep/kaldi](https://github.com/alphacep/kaldi/tree/vosk) for use with the [Vosk speech recognition toolkit](https://github.com/alphacep/vosk-api) by our [speech-related applications](https://github.com/roboticslab-uc3m/speech).

## Install Kaldi (Ubuntu)

These instructions have been adapted from the [Vosk installation guide](https://alphacephei.com/vosk/install) and its [Dockerfile](https://github.com/alphacep/vosk-server/blob/47998a26f232252f7baaed53dd8ce89d38bbfbce/docker/Dockerfile.kaldi-vosk-server).

```bash
git clone https://github.com/roboticslab-uc3m/kaldi
cd kaldi-vosk-rl/tools
make -j openfst cub
extras/install_openblas_clapack.sh
cd ../src
./configure --shared --mathlib=OPENBLAS
sed -i 's: -O1 : -O3 :g' kaldi.mk
make -j online2 lm rnnlm
```

### Add GPU support for Vosk

If available, the CUDA Toolkit is automatically detected and included in the configure step. After following the previous instructions, issue the following command in the `src` directory:

```bash
make -j cudafeat cudadecoder
```

You can now proceed with [Install Vosk](install-vosk.md) to complete the setup.
