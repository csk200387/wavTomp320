import os
import subprocess

processes = []
for file in os.listdir():
    if file.endswith('.wav'):
        new_filename = os.path.splitext(file)[0] + '.mp3'
        process = subprocess.Popen(['ffmpeg', '-i', file, '-c:a', 'libmp3lame', '-b:a', '320k', new_filename])
        processes.append(process)

for process in processes:
    process.wait()

for file in os.listdir():
    if file.endswith('.wav'):
        os.remove(file)
input('Press ENTER to exit')
