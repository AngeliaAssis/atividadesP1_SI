# PRÉ REQUISITOS
#pip install pyautogui
#pip install SpeechRecognition
#pip install pyaudio

import pyautogui as py
import time as t
import speech_recognition as sr


# FUNCAO: OUVIR USUARIO

def ouvir():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Fale algo...")
        audio = r.listen(source)

    try:
        texto = r.recognize_google(audio, language="pt-BR")
        print("Você disse:", texto)
        return texto
    except:
        print("Não entendi...")
        return ""


# ABRIR BLOCO DE NOTAS

t.sleep(2)  

py.press("win")
t.sleep(1)

py.write("bloco de notas")
t.sleep(1)

py.press("enter")
t.sleep(2)

# DIGITAR TEXTO POR VOZ

print("Comece a falar. Diga 'parar' para finalizar.")

while True:
    texto = ouvir()

    if texto != "":
        if "parar" in texto.lower():
            break
        
        py.write(texto + "\n")
        t.sleep(0.5)

# SALVAR ARQUIVO

py.hotkey("ctrl", "s")
t.sleep(1)

py.write("ideias.txt")
t.sleep(1)

py.press("enter")
t.sleep(1)


# FECHAR BLOCO DE NOTAS
py.hotkey("alt", "f4")