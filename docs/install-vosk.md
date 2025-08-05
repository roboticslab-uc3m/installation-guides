# Install Vosk

Vosk is a lightweight speech recognition (ASR) toolkit based on Kaldi that supports multiple languages and can run offline. The API is hosted at [alphacep/vosk-api](https://github.com/alphacep/vosk-api). We use it in our [speech-related applications](https://github.com/roboticslab-uc3m/speech).

## Install Dependencies

Vosk depends on Kaldi (see [Install Kaldi](install-kaldi.md)).

## Install Vosk (Ubuntu)

Assuming you have downloaded and built Kaldi in `/opt/kaldi` (or whatever directory of your choice; make sure this path contains the `src/` directory), you can build Vosk as follows:

```bash
git clone https://github.com/alphacep/vosk-api
cd vosk-api/src
make -j KALDI_ROOT=/opt/kaldi
```

This will generate a *libvosk.so* file you can then link against in other libraries and applications.

### Add GPU support

Assuming Kaldi has been built with GPU support, you can add it to Vosk by passing an additional flag to the `make` command. However, first inspect `src/Makefile` and remove `-lnvToolsExt` (like [here](https://github.com/alphacep/vosk-api/blob/0f364e3a4407fbc837f37423223dff9c7b3e8557/src/Makefile#L104)).

```bash
make -j KALDI_ROOT=/opt/kaldi HAVE_CUDA=1
```

## Download Vosk Models

All Vosk models can be downloaded from [here](https://alphacephei.com/vosk/models).
