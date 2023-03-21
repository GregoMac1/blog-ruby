editor1 = User.create(email: "juan@gmail.com", name: "Juan Pérez", password: "Ruby2022")
editor2 = User.create(email: "carlos@gmail.com", name: "Carlos Sánchez", password: "Ruby2022")
reader = User.create(email: "marcos@gmail.com", name: "Marcos García", password: "Ruby2022")

editor1.remove_roles
editor1.add_role :editor

editor2.remove_roles
editor2.add_role :editor
