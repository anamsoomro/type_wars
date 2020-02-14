User.destroy_all 
Game.destroy_all
Theme.destroy_all  

u1 = User.create(username: "2fast2furious")
u2 = User.create(username: "dumdum")
u3 = User.create(username: "MuchFast_VeryType")
u4 = User.create(username: "FastButWrong")
u5 = User.create(username: "RightButSlow")
u5 = User.create(username: "raul")


t1 = Theme.create(name: "Star Wars", words: "Force, Jedi, Troopers, lightsaber, Naboo, X-win, Leia, Skywalker, Chewbacca, R2-D2, Greedo, Darklighter, Stormtrooper, Kylo, Force Awakens, Last Jedi, Qui-gon, Empire, Republic, Mos Eisley, Space Port, Corellian, Spaceship, Father, New Hope, Lucas, Saga, Clones, Droids, Galaxies, Resistance, Snoke, Lando")
t2 = Theme.create(name: "Runtime Terror", words: "Blake, Caleb, Cornelius, Georgii, Gian, Placido, Raul, Jeannie, Somaia, Stephen, Steven, Vidhi, Mitchell, Paul, Vien, Kahoot, Lectures, Whiteboard, Ego-less, Teamwork, Code Challenge, Pair Programming, Discussions, Labs, learn.co, Flatiron, WeWork, 708 Main St, Houston, Jones Bldg")
t3 = Theme.create(name: "The Office", words: "Bears, Beets, Chili, Jim, Dwight, Angela, Meredith, Stanley, Paper, Beesly, Halpert, Kevin, Andy, Creed, Kelly, Holly, Creed, Sales, Sabre, Pyramid, Scranton, Jello, Astrid, Chrysller, WUPHF.com, Dunder Mifflin, Parkour, Netflix, Miracle Legumes, Fire Drill")
t4 = Theme.create(name: "Coding", words: "ActiveRecord, initialize, origin, attr_accessor, attr_reader, attr_writer, has_many, belongs_to, \#{speedy}, GitHub, C#, JavaScript, Ruby, mongoDB, SQLite3, binding.pry, Sinatra, React, Redux, NodeJS, AngularJS, end, elsif, API, Scraping, macOS, linux, windows, database, keyboard, mouse, SQL, mySQL, binary, AI")
t5 = Theme.create(name: "Jibberish", words: "Bzidk!!, aoiemm, boqler, panii, Aoogur, ABHP, PLEWNFO, Poubmu, Aiubg, POAAAA, muaopue, baogun, enoyeu, dsfi, oanve, obtmerm, dosueo, anr, adns, PSFeh, diof, pehte, powow, dshfpw, PITE, AOHRBD")
t6 = Theme.create(name: "Numbers", words: "34297, 0000000, 2134, 0793, 13946, 387, 12345, 60038, 110981, 20163, 73756, 657, 09821, 7490, 74940, 8754, 86459, 7599, 27037, 47475, 549327, 459245, 47507, 4711118, 84027, 76703, 12345, 98765") #Array.new(20){rand(1..100000)}
t7 = Theme.create(name: "Russian", words: "Dobraye, Spaseeba, Bal'shoye, Neechevo, Gavareetye, Pazhivayesh?, Gavaryoo, Prasteete, Neeploha!, blyad, poluchish, paneemayoo, rooskee, Paka, Eezveeneete, srashnava")




Game.create(user_id: u1.id, theme_id: t1.id, score: 20)
Game.create(user_id: u1.id, theme_id: t2.id, score: 10)
Game.create(user_id: u1.id, theme_id: t3.id, score: 8)
Game.create(user_id: u1.id, theme_id: t4.id, score: 11)


Game.create(user_id: u2.id, theme_id: t1.id, score: 9)
Game.create(user_id: u2.id, theme_id: t2.id, score: 10)
Game.create(user_id: u2.id, theme_id: t7.id, score: 20)
Game.create(user_id: u2.id, theme_id: t6.id, score: 16)
Game.create(user_id: u2.id, theme_id: t5.id, score: 18)



Game.create(user_id: u3.id, theme_id: t4.id, score: 20)
Game.create(user_id: u3.id, theme_id: t3.id, score: 15)
Game.create(user_id: u3.id, theme_id: t2.id, score: 5)
Game.create(user_id: u3.id, theme_id: t7.id, score: 20)

Game.create(user_id: u4.id, theme_id: t6.id, score: 10)
Game.create(user_id: u4.id, theme_id: t5.id, score: 12)
Game.create(user_id: u4.id, theme_id: t4.id, score: 14)


Game.create(user_id: u4.id, theme_id: t3.id, score: 18)
Game.create(user_id: u4.id, theme_id: t2.id, score: 12)
Game.create(user_id: u4.id, theme_id: t1.id, score: 5)