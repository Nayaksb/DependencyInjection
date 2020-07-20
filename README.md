Defining Dependency Injection

Many developers get fear when they hear the word dependency injection. It's a difficult pattern and it's not meant for beginners. That's what you are made to believe. The truth is that dependency injection is a fundamental pattern that is very easy to adopt.

When I first heard about dependency injection, I also figured it was a technique too advanced for my needs at the time. I could do without dependency injection, whatever it was.
I later learned that, if reduced to its bare essentials, dependency injection is a simple concept. 
James Shore offers a succinct and straightforward definition of dependency injection.
Dependency injection means giving an object its instance variables. Really. That's it. - James Shore

Dependency Injection (DI) is a technique which allows to populate a class with objects, rather than relying on the class to create the objects itself.

dependency injection cannot be considered without Dependency inversion principle. The principle states that implementation details should depend on and implement higher level abstractions, rather than the other way around. It is foundational when creating loosely-coupled applications

a class depends on an interface, having an implementation supplied from the outside.

Three important ways to use Dependency Injection in Swift

Dependency Injection is used ubiquitously in Cocoa too, and in the following examples, we’ll see code snippets both from Cocoa and typical client-side code. Let’s take a look at the following four sections to learn how to use Dependency Injection.
Constructor Injection
The first way to do DI is to pass the collaborators in the constructor, where they are then saved in private properties. Let’s have as an example on e-commerce app, whose Basket is handled both locally and remotely.
In the end, Dependency Injection as defined by James Shore is all here: define the collaborators with protocols and then pass them in the constructor. This is the best way to do DI. After the construction, the object is fully formed and it has a consistent state. Also, by just looking at the signature of init, the dependencies of this object are clear.
Actually, the Constructor Injection is not only the most effective, but it’s also the easiest.
The only problem is who has to create the object graph? The parent object? The AppDelegate?
We’ll discuss that point in the Where to bind the dependencies section.
Property Injection
We have already agreed that Construction Injection is the best way to do DI, so why bother finding other methods? Well, it is not always possible to define the constructor the way we want.
This pattern is less elegant than the previous one:
The ViewController isn’t in the right state until all the properties are set
Properties introduce mutability, and immutable classes are simpler and more efficient
The properties must be defined as optional, leading to add question marks everywhere
They are set by an external object, so they must be writeable and this could potentially permit something else to overwrite the value set at the beginning after a while
There is no way to enforce the validity of the setup at compile-time
Method Injection
This pattern just passes a collaborator in the method:
This is useful when the object has several collaborators, but most of them are just temporary and it isn’t worth having the relationship set up for the whole life cycle of the object.
