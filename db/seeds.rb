User.destroy_all 
Game.destroy_all
Theme.destroy_all  

u1 = User.create(username: "2fast2furious")
u2 = User.create(username: "dumdum")
u3 = User.create(username: "MuchFast_VeryType")
u4 = User.create(username: "FastButWrong")
u5 = User.create(username: "RightButSlow")
u5 = User.create(username: "raul")


t1 = Theme.create(name: "star wars", words: "Force, Jedi, Troopers, Lightsaber, Naboo, X-win, Leia, Skywalker, Chewbacca, R2-D2, Greedo, Darklighter, Stormtrooper, Kylo, Qui-gon, Empire, Republic, Eisley, Space, Corellian, Spaceship, Father, Lucas, Saga, Clones, Droids, Galaxies, Resistance, Snoke, Lando")
t2 = Theme.create(name: "runtime terror", words: "Blake, Caleb, Cornelius, Georgii, Gian, Placido, Raul, Jeannie, Somaia, Stephen, Steven, Vidhi, Mitchell, Paul, Vien, kahoot, lectures, whiteboarding, challenges, programming, discussions, labs, learn.co, flatiron, WeWork, Houston, binding.cry,\#{cohort_name}, job.include?")
t3 = Theme.create(name: "the office", words: "bears, beets, chili, Jim, Dwight, Angela, Meredith, Stanley, paper, Beesly, Halpert, Kevin, Andy, Creed, Kelly, Holly, Creed, sales, Sabre, pyramid, Scranton, jello, Astrid, chrysller, WUPHF.com, parkour, Netflix, legumes")
t4 = Theme.create(name: "coding", words: "ActiveRecord, initialize, origin, attr_accessor, attr_reader, attr_writer, has_many, belongs_to, \#{speedy}, GitHub, C#, JavaScript, Ruby, mongoDB, SQLite3, binding.pry, Sinatra, React, Redux, NodeJS, AngularJS, end, elsif, API, scraping, macOS, linux, windows, database, keyboard, mouse, SQL, mySQL, binary")
t5 = Theme.create(name: "jibberish", words: "Bzidk!!, aoiemm, boqler, panii, Aoogur, ABHP, PLEWNFO, Poubmu, Aiubg, POAAAA, muaopue, baogun, enoyeu, dsfi, oanve, obtmerm, dosueo, anr, adns, PSFeh, diof, pehte, powow, dshfpw, PITE, AOHRBD")
t6 = Theme.create(name: "numbers", words: "34297, 0000000, 2134, 0793, 13946, 387, 12345, 60038, 110981, 20163, 73756, 657, 09821, 7490, 74940, 8754, 86459, 7599, 27037, 47475, 549327, 459245, 47507, 4711118, 84027, 76703, 12345, 98765") #Array.new(20){rand(1..100000)}
t7 = Theme.create(name: "russian", words: "dobraye,spaseeba, bal'shoye, neechevo, gavareetye, pazhivayesh?, gavaryoo, prasteete, neeploha!, blyad, poluchish, paneemayoo, rooskee, paka, eezveeneete, srashnava")
t8 = Theme.create(name: "dutch", words: "apetrots, boterham, eekhoorntjesbrood, eekhorn, spiegelei, klokhuis, pindakaas, oorlog, oorbellon, kapsalon, olibollen, tandpasta, handschoenen, monster, schoonmoeder, bakfiets, geluzak, ziekenauto, mulipeer, toiletbril, kikker, wasbeer, vleermuis, zeewolf")
t9 = Theme.create(name: "americans speaking dutch", words: "kettle, kanoofullin, polizi, muff, dankewal, alshiblief, panekook, slappin, khikhillen, kittlen, khazalach, lecherthang, khawaldakh, tonys, chocoloney, loaves")




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