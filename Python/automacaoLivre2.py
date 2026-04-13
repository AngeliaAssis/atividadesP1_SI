
# PRÉ REQUISITOS
#pip install pyautogui
#pip install SpeechRecognition
#pip install pyttsx3
#pip install pyaudio


import pyautogui as py
import time as t
import speech_recognition as sr
import pyttsx3
from datetime import datetime


# CONFIGURAR VOZ

engine = pyttsx3.init()
engine.setProperty('rate', 180)

def falar(texto):
    engine.say(texto)
    engine.runAndWait()


# OUVIR USUARIO

def ouvir():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Ouvindo...")
        r.adjust_for_ambient_noise(source)
        audio = r.listen(source)

    try:
        texto = r.recognize_google(audio, language="pt-BR")
        print("Você disse:", texto)
        return texto.lower()
    except:
        print("Não entendi")
        return ""


# ABRIR BLOCO DE NOTAS

def abrir_bloco():
    py.press("win")
    t.sleep(1)
    py.write("bloco de notas")
    t.sleep(1)
    py.press("enter")
    t.sleep(2)


# SALVAR ARQUIVO

def salvar_arquivo():
    nome = "ideias_" + datetime.now().strftime("%d-%m-%Y_%H-%M") + ".txt"
    
    py.hotkey("ctrl", "s")
    t.sleep(1)
    
    py.write(nome)
    t.sleep(1)
    
    py.press("enter")
    t.sleep(1)

    falar("Arquivo salvo com sucesso")


# COMANDOS DE VOZ

def executar_comando(texto):
    
    if "nova linha" in texto:
        py.press("enter")
        return True

    elif "apagar" in texto:
        py.press("backspace")
        return True

    elif "salvar" in texto:
        salvar_arquivo()
        return True

    elif "fechar" in texto:
        py.hotkey("alt", "f4")
        return True

    elif "parar" in texto:
        return False

    else:
        py.write(texto + " ")
        return True


# PROGRAMA PRINCIPAL

t.sleep(2)

falar("Abrindo bloco de notas")
abrir_bloco()

falar("Pode começar a falar suas ideias. Diga parar para encerrar.")

rodando = True

while rodando:
    texto = ouvir()
    
    if texto != "":
        rodando = executar_comando(texto)

# salvar automaticamente ao sair
salvar_arquivo()

falar("Programa encerrado")