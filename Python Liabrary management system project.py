import os
def add_book():
    
    
    Author=input("Enter author name: ")
    Title=input("Enter  book title: ")
    Year=input("Enter book publishing year: ")
    with open("library.txt","a")as file:
        file.write(f"{Title},{Author},{Year}\n")
    print("Book Add Successfully")
    
def view_books():
    try:
        with open("library.txt","r")as file:
            books = file.readlines()
            if not books:
                print("There are no books available")
            else:
                print("Book available")
                for book in books:
                    con= book.split(",")
                    if len(con) == 3:
                        Title, Author, Year = con
                        print(f"Title- {Title},Author- {Author},Year- {Year}")
                    else:
                        print(f"Invalid: {book}")
                        

    except FileNotFoundError:
        print("No Books to display..!!")

def search_book():
    search_title=input("Enter the title of the Book: ")
    found= False
    try:
        with open("library.txt","r") as file:
            for book in file:
                con = book.split(",")
                if len(con) == 3:
                    Title, Author, Year = con
                if Title.lower()==search_title.lower():
                    print(f"Book Found: Title- {Title},Author-  {Author},Year- {Year}")
                    found= True
                    break
        if not found:
            print("No Book Found..!!")
    except FileNotFoundError :
        print("File Not Found from your search..!!")

def delete_book():
    delete_title=input("Enter the title you want to delete: ")
    found= False
    try:
        with open("library.txt","r") as file:
            books= file.readlines()
        with open("library.txt","w") as file:
            for book in books:
                con = book.split(",")
                if len(con) == 3:
                    Title, Author, Year = con
                    if Title.lower() != delete_title.lower():
                        file.write(book)
                    else:
                       found= True
        if found:
            print("Book Deleted Successfully")
        else:
            print("No Book Found...!!")
    except FileNotFoundError:
        print("No File Found in Library..!!")
        
def menu():
    while True:
        print("\nLibrary Management System")
        print("1.Add a Book.")
        print("2.View All Books.")
        print("3.Search for a Book.")
        print("4.Delete a Book.")
        print("5.Exit")
        choice=input("Enter your choice: ")
        if choice == "1":
            add_book()
        elif choice == "2":
            view_books()
        elif choice == "3":
            search_book()
        elif choice == "4":
            delete_book()
        elif choice == "5":
            print("Exiting the system......")
            break
        else:
            print("Invalid choice. please try again..!!")
            

if __name__ == "__main__":
    menu()

              
    

        
