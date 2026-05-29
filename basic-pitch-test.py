import os
import warnings

os.environ["TF_CPP_MIN_LOG_LEVEL"] = "3"

os.environ["TF_ENABLE_ONEDNN_OPTS"] = "0"

warnings.filterwarnings("ignore", category=UserWarning, module="resampy")

import librosa
from basic_pitch.inference import predict

AUDIO_FILE = "audio-assets/Emotional_piano.wav"

if not os.path.exists(AUDIO_FILE):
    print(f"Error: Could not find '{AUDIO_FILE}'")
    exit(1)

print("Starting transcription...")
print("Analyzing audio frequencies...")

model_output, midi_data, note_events = predict(AUDIO_FILE)

print(f"\nSuccess! Found {len(note_events)} total notes.\n")
print(f"{'Note':<6} | {'Starts At':<10} | {'Ends At':<10} | {'Amplitude':<10}")
print("-" * 48)

for start_time_s, end_time_s, pitch_midi, amplitude, _ in note_events[:15]:
    readable_note = librosa.midi_to_note(int(pitch_midi))
    
    start = round(start_time_s, 2)
    end = round(end_time_s, 2)
    amp = round(amplitude, 2)
    
    print(f"{readable_note:<6} | {start:>8}s | {end:>8}s | {amp:>10}")