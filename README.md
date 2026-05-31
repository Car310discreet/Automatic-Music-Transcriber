# Automated Music Transcriber CLI

A portable, ultra-fast command-line interface tool that strips instruments away from any audio track using Meta's **Demucs 6-Stem Neural Network**, isolates pure piano frequencies, and automatically transcribes the performance into a highly accurate **MIDI file** using Spotify's **Basic Pitch AI**.

---

## Prerequisites

This project leverages `uv`, an ultra-fast, modern Python package manager that handles Python version management and package isolation automatically.

Before running the tool, make sure you have `ffmpeg` installed on your system (required by Demucs for audio encoding/decoding):

**Ubuntu/Debian:**
```bash
sudo apt update && sudo apt install ffmpeg
```

macOS (via Homebrew):
    
  ```bash
brew install ffmpeg
  ```
Setup & Installation

  Install uv (if you don't have it globally on your machine):
  ```bash
curl -LsSf [https://astral.sh/uv/install.sh](https://astral.sh/uv/install.sh) | sh
  ```

  Clone the repository:
    
```bash
git clone [https://github.com/Car310discreet/Automatic-Music-Transcriber.git](https://github.com/Car310discreet/Automatic-Music-Transcriber.git)
cd Automatic-Music-Transcriber
```

  Initialize and sync the environment:
  
```bash
uv sync
```
  Grant Execution Permissions:
  
```bash
chmod +x transcribe
```
Usage: How to Run It

You can run the transcriber from any directory on your machine. Pass the script the absolute or relative path to your multi-instrument target audio file (.mp3, .wav, .flac, etc.):
```bash
./transcribe /path/to/your/song.mp3
```
