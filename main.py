from faker import Faker
import mysql.connector


class Database:

    def __init__(self):
        self.fake = Faker()
        self.cnx = mysql.connector.connect(
            user='root',
            password='Enurox123',
            host='localhost',
            database='P6DB',
        )

    def insert_categories(self):
        cursor = self.cnx.cursor()
        sql_cat = "Insert IGNORE INTO category (name) VALUES (%(cat_name)s)"
        categories_list = ['Pizza', 'Dessert', 'Boissons', 'Snack']
        for cat in categories_list:
            cat_add = {'cat_name': cat}
            cursor.execute(sql_cat, cat_add)
        self.cnx.commit()
        cursor.close()

    def insert_delivery_mode(self):
        cursor = self.cnx.cursor()
        sql_delivery_mode = ("INSERT IGNORE INTO Delevery_mode (name)"
                             " VALUES (%(mode_n)s)"
                             )
        mode = ['à emporter', 'sur place', 'livraison']
        for mod in mode:
            mode_add = {'mode_n': mod}
            cursor.execute(sql_delivery_mode, mode_add)
        self.cnx.commit()
        cursor.close()

    def insert_payment_mode(self):
        cursor = self.cnx.cursor()
        sql_payment_mode = ("INSERT IGNORE INTO payment_mode (name) "
                            "VALUES (%(mode_payment)s)"
                            )
        mode_p = ['à la livraison', 'en ligne', 'sur place']
        for mode in mode_p:
            md = {'mode_payment': mode}
            cursor.execute(sql_payment_mode, md)
        self.cnx.commit()
        cursor.close()

    def insert_status(self):
        cursor = self.cnx.cursor()
        sql_status = "INSERT IGNORE INTO Status (name) VALUES (%(stat)s)"
        status = ['En attente de validation', 'En cours de préparation',
                  'En cours de livraison']
        for i in status:
            stat_add = {'stat': i}
            cursor.execute(sql_status, stat_add)
        self.cnx.commit()
        cursor.close()

    def insert_right(self):
        cursor = self.cnx.cursor()
        sql_right = "INSERT IGNORE INTO Right (name) VALUES (%(right_n)s)"
        right_names = ['Connexion', 'Regarder la carte', 'Passer commande',
                       'Voir recettes', 'Consulter stock']
        for name in right_names:
            name_add = {'right_n': name}
            cursor.execute(sql_right, name_add)
        self.cnx.commit()
        cursor.close()

    def insert_role(self):
        cursor = self.cnx.cursor()
        role = ['invité', 'client', 'employé']
        sql_role = ("INSERT IGNORE INTO Role (name) "
                    "VALUES (%(role_n)s)"
                    )
        for r in role:
            role_add = {'role_n': r}
            cursor.execute(sql_role, role_add)
        self.cnx.commit()
        cursor.close()

    def insert_role_right(self):
        cursor = self.cnx.cursor()
        sqlrole_r = "INSERT IGNORE INTO Role_has_Right Role_id"

    def insert_user(self):
        for _ in range(10):
            self.fake.first_name()
            self.fake.last_name()
            self.fake.ascii_email()
            self.fake.phone_number()
            self.fake.password(length=12)


db = Database()

db.insert_right()
