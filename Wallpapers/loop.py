import subprocess

for i in range(3, 9):
    subprocess.run(["magick", f"{i}.png", "-blur", "0x10", f"{i}-blurred.jpg"])
    print("done")
