import tkinter as tk
from tkinter import messagebox

window = tk.Tk()
window.geometry("400x500")
window.title("Вход")

def login ():
    if entry_login.get() != "":
        messagebox.showinfo("Вход", "Добро пожаловать!")
        main()
        window.withdraw()

tk.Label (window, text="Логин").pack()
entry_login = tk.Entry (window)
entry_login.pack()

tk.Button (window, text="Вход", command=login).pack(pady=10)


def main():
    win2 = tk.Toplevel()
    win2.geometry("400x500")
    win2.title("Главное меню")

    def go_katalog():
        win2.destroy()
        katalog()

    def go_korzina():
        win2.destroy()
        korzina()

    tk.Label (win2, text="ГЛАВНОЕ МЕНЮ").pack()
    tk.Button (win2, text="каталог", command=katalog).pack(pady=10)
    tk.Button (win2, text="корзина", ).pack(pady=10)

def katalog():
    win3 = tk.Toplevel()
    win3.geometry("400x500")
    win3.title("каталог")
   
    def go_back():
        win3.destroy()
        main()

    tk.Label (win3, text="КАТАЛОГ").pack()
    tk.Button (win3, text="Выход", command=go_back).pack(pady=50)

def korzina():
    win4 = tk.Toplevel()
    win4.geometry("400x500")
    win4.title("корзина")

    def go_back():
        win4.destroy()
        main()

    tk.Label (win4, text="КОРЗИНА").pack()
    tk.Button (win4, text="выход", command=go_back).pack(pady=50)

window.mainloop()