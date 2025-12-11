# download_model.py
import os
import gdown

MODEL_PATH = "trained_vae.pth"
DRIVE_ID = "https://drive.google.com/drive/folders/18DcgugC5LcuNE1-OO0xp7ciMe6q937VP?usp=drive_link"

def main():
    if os.path.exists(MODEL_PATH):
        print(f"{MODEL_PATH} already exists, skipping download.")
        return
    url = f"https://drive.google.com/uc?id={DRIVE_ID}"
    gdown.download(url, MODEL_PATH, quiet=False)

if __name__ == "__main__":
    main()
