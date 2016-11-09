import oopmacro

class Animal:
  var age: int
  var name: string
  method speak {.base.} = echo "..."
  proc get_age: int = self.age
  proc get_name: string = self.name
  proc set_age(newage: int) = self.age = newage
  proc set_name(newname: string) = self.name = newname
  proc `$`: string = "animal:" & self.name & ":" & $self.age

class Cat of Animal:
  method speak = echo "Meow"
  proc `$`: string = "cat:" & self.name & ":" & $self.age

class Rabbit of Animal:
  method speak = echo "Meep"
  proc `$`: string = "rabbit:" & self.name & ":" & $self.age

class Person of Animal:
  var friends: seq[Animal]
  method speak = echo "Hello"
  proc get_friends: seq[Animal] = self.friends
  proc add_friend(friend: Animal) =
    if friend notin self.friends:
      self.friends.add(friend)
  proc age_diff(other: Person) =
    let diff = self.age - other.age
    if self.age > other.age:
      echo self.name, " is ", diff, " years older than ", other.name
    else:
      echo self.name, " is ", -diff, " years younger than ", other.name
  proc `$`: string = "person:" & self.name & ":" & $self.age

# Constructor procs
proc newCat(name: string, age: int): Cat =
  result = Cat(name: name, age: age)
proc newRabbit(name: string, age: int): Rabbit =
  result = Rabbit(name: name, age: age)
proc newPerson(name: string, age: int): Person =
  result = Person(name: name, age: age, friends: @[])


let c = Cat(name: "Tom")
c.set_age(2)
echo c.get_name(), " ", c.get_age()

let eric = newPerson("Eric", 45)
eric.speak()

let john = newPerson("John", 55)
eric.age_diff(john)
john.add_friend(eric)
echo john.get_friends()
