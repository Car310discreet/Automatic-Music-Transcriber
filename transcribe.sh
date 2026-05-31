#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./transcribe <path-to-audio-file>"
    exit 1
fi

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

INPUT=$(realpath "$1")

FILE_NAME=$(basename -- "$INPUT")
FILENAME_NO_EXT="${FILE_NAME%.*}"

CWD=$(pwd)
STEMS_OUT_DIR="$CWD/isolated-stems"
MIDI_OUT_DIR="$CWD/transcribed-midi"


mkdir -p "$STEMS_OUT_DIR"
mkdir -p "$MIDI_OUT_DIR"

echo "Current Directory: $CWD"
echo "Processing File:   $INPUT"

uv --project "$SCRIPT_DIR" run demucs -n htdemucs_6s -o "$STEMS_OUT_DIR" "$INPUT"

TARGET_STEM="$STEMS_OUT_DIR/htdemucs_6s/$FILENAME_NO_EXT/piano.wav"

if [ ! -f "$TARGET_STEM" ]; then
    echo "Error: Demucs output file missing at $TARGET_STEM"
    exit 1
fi

uv --project "$SCRIPT_DIR" run basic-pitch "$MIDI_OUT_DIR" "$TARGET_STEM"

mv "$MIDI_OUT_DIR/piano_basic_pitch.mid" "$MIDI_OUT_DIR/$FILENAME_NO_EXT-piano.mid"