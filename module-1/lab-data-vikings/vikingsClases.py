import random
# Soldier
class Soldier:
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
        pass
    def attack(self):
        return self.strength
    def receiveDamage(self,damage):
        self.health= self.health - damage
        pass

# Viking
class Viking(Soldier):
    def __init__(self, name, health, strength):
        self.name = name
        self.health = health
        self.strength = strength
    def receiveDamage(self, damage):
        self.health = self.health - damage
        if self.health <= 0:
            return "{} has died in act of combat".format(self.name)
        else:
            return "{} has received {} points of damage".format(self.name, damage)
    def battleCry(self):
        return "Odin Owns You All!"

# Saxon
class Saxon(Soldier):
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
    pass
    def receiveDamage(self, damage):
        self.health = self.health - damage
        if self.health <= 0:
            return "A Saxon has died in combat"
        else:
            return "A Saxon has received {} points of damage".format(damage)

# War
class War:
    def __init__(self):
        self.vikingArmy = []
        self.saxonArmy = []
        pass
    def addViking(self,Viking):
        self.vikingArmy.append(Viking)
        pass
    def addSaxon(self,Saxon):
        self.saxonArmy.append(Saxon)
        pass
    def vikingAttack(self):
        Saxon1 = random.choice(self.saxonArmy)
        Viking1 = random.choice(self.vikingArmy)
        Saxon1.receiveDamage(Viking1.strength)
        if Saxon1.health <= 0:
            self.saxonArmy.remove(Saxon1)
            return "A Saxon has died in combat"
        pass
    def saxonAttack(self):
        Saxon1 = random.choice(self.saxonArmy)
        Viking1 = random.choice(self.vikingArmy)
        Viking1.receiveDamage(Saxon1.strength)
        if Viking1.health <= 0:
            self.vikingArmy.remove(Viking1)
        else:
            return "{} has received {} points of damage".format(Viking1.name, Saxon1.strength)
        pass
    def showStatus(self):
        if self.saxonArmy == []:
            return "Vikings have won the war of the century!"
        elif self.vikingArmy == []:
            return "Saxons have fought for their lives and survive another day..."
        else:
            return "Vikings and Saxons are still in the thick of battle."
        pass