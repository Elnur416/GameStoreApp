//
//  GameDatas.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import Foundation

class GameDatas {
    let categoryData = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    let gameData = CoreDataForGame(context: AppDelegate().persistentContainer.viewContext)
    
    func loadData() {
//        categories
        let category1 = CategoryModel(name: "Heist",
                                      image: "heist",
                                      colour: "systemOrange")
        categoryData.saveData(category: category1)
        
        let category2 = CategoryModel(name: "Action",
                                      image: "action",
                                      colour: "systemBrown")
        categoryData.saveData(category: category2)
        
        let category3 = CategoryModel(name: "Survival",
                                      image: "survival",
                                      colour: "systemBlue")
        categoryData.saveData(category: category3)
        
        let category4 = CategoryModel(name: "Shooter",
                                      image: "shooter",
                                      colour: "systemGrey2")
        categoryData.saveData(category: category4)
        
        let category5 = CategoryModel(name: "Adventure",
                                      image: "adventure",
                                      colour: "systemRed")
        categoryData.saveData(category: category5)
        
        let category6 = CategoryModel(name: "Fighting",
                                      image: "fighting",
                                      colour: "systemYellow")
        categoryData.saveData(category: category6)
  
//        games
        let game1 = GameModel(name: "Elden Ring",
                              mainImage: "eldenring",
                              customImage: "eldenring2",
                              price: 22.99,
                              about: "The Lands Between are part of a vast continent where magnificent open fields and huge dungeons with complex and three-dimensional designs are seamlessly connected. As you explore, the joy of discovering unknown and overwhelming threats awaits you. Mastery of the terrain and knowledge of its secrets can help you overcome enemies and defeat formidable bosses or lead invading players into traps.",
                              isLiked: false,
                              category: category5)
        gameData.saveData(game: game1)

        let game2 = GameModel(name: "COD 3",
                              mainImage: "cod3",
                              customImage: "cod32",
                              price: 39.99,
                              about: "Developed by Treyarch and Raven, Black Ops 6 is a spy action thriller set in the early 90s, a period of transition and upheaval in global politics, characterized by the end of the Cold War and the rise of the United States as a single superpower. With a mind-bending narrative, and unbound by the rules of engagement, this is signature Black Ops. The Black Ops 6 Campaign provides dynamic moment-to-moment gameplay that includes a variety of play spaces with blockbuster set pieces and action-packed moments, high-stakes heists, and cloak-and-dagger spy activity.",
                              isLiked: false,
                              category: category2)
        gameData.saveData(game: game2)
        
        let game3 = GameModel(name: "Uncharted 4",
                              mainImage: "uncharted4",
                              customImage: "uncharted42",
                              price: 29.99,
                              about: "Seek your fortune and leave your mark on the map in the UNCHARTED: Legacy of Thieves Collection. Uncover the thrilling cinematic storytelling and the largest blockbuster action set pieces in the UNCHARTED franchise, packed with all the wit, cunning, and over the top moments of the beloved thieves – Nathan Drake and Chloe Frazer.",
                              isLiked: false,
                              category: category5)
        gameData.saveData(game: game3)
        
        let game4 = GameModel(name: "Until Daylight",
                              mainImage: "untilDaylight",
                              customImage: "untilDaylight2",
                              price: 19.99,
                              discountedPrice: 8.99,
                              about: "To win, you have to survive for about 30 game days, fending off all the attacks on the base. At first, it'll be small packs of creatures, and by the end, you'll have to fight a sweeping horde of mutants. Also, the game will end early if our hero, Ivan, dies or if the power generator, the heart of the base, is destroyed.",
                              isLiked: false,
                              category: category3)
        gameData.saveData(game: game4)
        
        let game5 = GameModel(name: "Deus Ex",
                              mainImage: "deusex",
                              customImage: "deusex2",
                              price: 25.99,
                              discountedPrice: 14.99,
                              about: "The year is 2029, and mechanically augmented humans have now been deemed outcasts, living a life of complete and total segregation from the rest of society. Now an experienced covert operative, Adam Jensen is forced to operate in a world that has grown to despise his kind. Armed with a new arsenal of state-of-the-art weapons and augmentations, he must choose the right approach, along with who to trust, in order to unravel a vast worldwide conspiracy.",
                              isLiked: false,
                              category: category1)
        gameData.saveData(game: game5)
        
        let game6 = GameModel(name: "The Last of Us",
                              mainImage: "thelastofus",
                              customImage: "thelastofus2",
                              price: 45.99,
                              about: "The developers describe the content like this: Players use weapons such as pistols, rifles, and crafted explosives as well as melee attacks with chokeholds, bats, and metal pipes to defend themselves from the infected and other human survivors. Players can also engage in stealth combat sequences involving a close-up camera view. Weapon and explosive attacks can result in decapitation and/or dismemberment. Scenes depict intense acts of violence, including themes of suicide and torture. During the game, a character makes sexual remarks about an adult magazine and a young character is shown drinking alcohol. Strong language is used frequently in dialogue.",
                              isLiked: false,
                              category: category3)
        gameData.saveData(game: game6)
        
        let game7 = GameModel(name: "Gardians",
                              mainImage: "gardians",
                              customImage: "gardians2",
                              price: 22.99,
                              discountedPrice: 12.99,
                              about: "Fire up a wild ride across the cosmos with a fresh take on Marvel’s Guardians of the Galaxy. In this third-person action-adventure game, you are Star-Lord, and thanks to your bold yet questionable leadership, you have persuaded an oddball crew of unlikely heroes to join you. Some jerk (surely not you) has set off a chain of catastrophic events, and only you can hold the unpredictable Guardians together long enough to fight off total interplanetary meltdown. Use Element Blasters, tag-team beat downs, jet boot-powered dropkicks, nothing’s off-limits.",
                              isLiked: false,
                              category: category2)
        gameData.saveData(game: game7)
        
        let game8 = GameModel(name: "Diablo",
                              mainImage: "diablo",
                              customImage: "diablo2",
                              price: 39.99,
                              about: "Diablo® IV is the ultimate action-RPG experience with endless evil to slaughter, countless abilities to master, nightmarish dungeons, and legendary loot. Embark on the epic campaign solo or with friends, meeting memorable characters through a gripping story in a beautifully dark world, or explore an expansive end game: battle iconic bosses for powerful loot, fight back the encroaching onslaught of Hell in Helltides, master the Forge to create your ultimate weapons and progress powerful characters, with cross-play and cross-progression on all available platforms.",
                              isLiked: false,
                              category: category6)
        gameData.saveData(game: game8)
        
        let game9 = GameModel(name: "The Quarry",
                              mainImage: "thequarry",
                              customImage: "thequarry2",
                              price: 35.99,
                              about: "As the sun sets on the last day of summer camp, the teenage counselors of Hackett’s Quarry throw a party to celebrate. No kids. No adults. No rules. Things quickly take a turn for the worse. Hunted by blood-drenched locals and something far more sinister, the teens' party plans unravel into an unpredictable night of horror. Friendly banter and flirtations give way to life-or-death decisions, as relationships build or break under the strain of unimaginable choices.",
                              isLiked: false,
                              category: category5)
        gameData.saveData(game: game9)
        
        let game10 = GameModel(name: "Arcane",
                              mainImage: "arcane",
                              customImage: "arcane2",
                              price: 22.99,
                               discountedPrice: 14.99,
                              about: "Arcane is a fast-paced fantasy action game with both ranged and melee combat. Choose your weapons, learn their unique mechanics, hone your playstyle and ascend the mountain.",
                               isLiked: false,
                               category: category4)
        gameData.saveData(game: game10)
        
        let game11 = GameModel(name: "COD MW3",
                              mainImage: "codmw3",
                              customImage: "codmw32",
                               price: 35.99,
                              about: "Welcome to Call of Duty®: Warzone™, the massive free-to-play combat arena. Experience thrilling modes & new gameplay features in Area 99, Urzikstan and Rebirth Island. Turn the Heat Up Welcome to the brand-new Resurgence map, Area 99. This fast-paced and frenetic map is ready for nuclear-powered action. Prepare to take the battle to a massive metropolis in Urzikstan, the Battle Royale map. Or jump into the fan favorite Resurgence map, Rebirth Island. No matter where you land, these locales are sure to excite veterans and newcomers alike.",
                               isLiked: false,
                               category: category4)
        gameData.saveData(game: game11)
        
        let game12 = GameModel(name: "Dark Souls",
                              mainImage: "darksouls",
                              customImage: "darksouls2",
                               price: 35.99,
                              about: "Get the DARK SOULS™ III Season Pass now and challenge yourself with all the available content! Winner of gamescom award 2015 Best RPG and over 35 E3 2015 Awards and Nominations. DARK SOULS™ III continues to push the boundaries with the latest, ambitious chapter in the critically-acclaimed and genre-defining series.",
                               isLiked: false,
                               category: category1)
        gameData.saveData(game: game12)
        
        let game13 = GameModel(name: "Battlefield 3",
                              mainImage: "battlefield3",
                              customImage: "battlefield32",
                               price: 49.99,
                              about: "Ramp up the intensity in Battlefield™ 3 and enjoy total freedom to fight the way you want. Explore 29 massive multiplayer maps and use loads of vehicles, weapons, and gadgets to help you turn up the heat. Plus, every second of battle gets you closer to unlocking tons of extras and moving up in the Ranks. So get in the action.",
                               isLiked: false,
                               category: category4)
        gameData.saveData(game: game13)
        
        let game14 = GameModel(name: "The Last of Us Trials",
                               mainImage: "thelastofustrials",
                               customImage: "thelastofustrials2",
                               price: 49.99,
                               about: "The developers describe the content like this: Players use weapons such as pistols, rifles, and crafted explosives as well as melee attacks with chokeholds, bats, and metal pipes to defend themselves from the infected and other human survivors. Players can also engage in stealth combat sequences involving a close-up camera view. Weapon and explosive attacks can result in decapitation and/or dismemberment. Scenes depict intense acts of violence, including themes of suicide and torture. During the game, a character makes sexual remarks about an adult magazine and a young character is shown drinking alcohol. Strong language is used frequently in dialogue.",
                               isLiked: false,
                               category: category3)
        gameData.saveData(game: game14)
        
        let game15 = GameModel(name: "Nim",
                               mainImage: "nim",
                               customImage: "nim2",
                               price: 19.99,
                               discountedPrice: 8.99,
                               about: "In a vast, inhospitable alien world, you are the expendable. Cloned from DNA for a single purpose: to test the most devastating, over-the-top, and downright absurd weaponry known to the galaxy. Welcome to NIMRODS, the ultimate survival roguelite shooter where the guns you craft are the legacy you leave.",
                               isLiked: false,
                               category: category5)
        gameData.saveData(game: game15)
        
        let game16 = GameModel(name: "Alien",
                               mainImage: "alien",
                               customImage: "alien2",
                               price: 69.99,
                               about: "Discover the true meaning of fear in Alien: Isolation, a survival horror set in an atmosphere of constant dread and mortal danger. Fifteen years after the events of Alien™, Ellen Ripley’s daughter, Amanda enters a desperate battle for survival, on a mission to unravel the truth behind her mother's disappearance. As Amanda, you will navigate through an increasingly volatile world as you find yourself confronted on all sides by a panicked, desperate population and an unpredictable, ruthless Alien.",
                               isLiked: false,
                               category: category6)
        gameData.saveData(game: game16)
        
        let game17 = GameModel(name: "Mortal Kombat X",
                               mainImage: "mortalkombatx",
                               customImage: "mortalkombatx2",
                               price: 49.99,
                               about: "MK is back and better than ever in the next evolution of the iconic franchise. The all new Custom Character Variations give you unprecedented control of your fighters to make them your own. The new graphics engine showcases every skull-shattering, eye-popping moment, bringing you so close to the fight you can feel it. Featuring a roster of new and returning Klassic Fighters, Mortal Kombat's best-in-class cinematic story mode continues the epic saga over 25 years in the making.",
                               isLiked: false,
                               category: category6)
        gameData.saveData(game: game17)
        
        let game18 = GameModel(name: "Spider Man",
                               mainImage: "spiderman",
                               customImage: "spiderman2",
                               price: 69.99,
                               about: "Developed by Insomniac Games in collaboration with Marvel, and optimized for PC by Nixxes Software, Marvel's Spider-Man Remastered on PC introduces an experienced Peter Parker who’s fighting big crime and iconic villains in Marvel’s New York. At the same time, he’s struggling to balance his chaotic personal life and career while the fate of Marvel’s New York rests upon his shoulders.",
                               isLiked: false,
                               category: category2)
        gameData.saveData(game: game18)
        
        let game19 = GameModel(name: "Fortnite",
                               mainImage: "fortnite",
                               customImage: "fortnite2",
                               price: 19.99,
                               discountedPrice: 5.99,
                               about: "One of the most popular online action games of all time, Fortnite delivers constant free updates—new game modes, maps, equipment and, most importantly, hats. Nine distinct classes provide a broad range of tactical abilities and personalities, and lend themselves to a variety of player skills.",
                               isLiked: false,
                               category: category3)
        gameData.saveData(game: game19)
        
        let game20 = GameModel(name: "Tomb Raider",
                               mainImage: "tombraider",
                               customImage: "tombraider2",
                               price: 49.99,
                               about: "Rise of the Tomb Raider: 20 Year Celebration includes the base game and Season Pass featuring all-new content. Explore Croft Manor in the new “Blood Ties” story, then defend it against a zombie invasion in “Lara’s Nightmare”. Survive extreme conditions with a friend in the new online Co-Op Endurance mode, and brave the new “Extreme Survivor” difficulty. Also features an outfit and weapon inspired by Tomb Raider III, and 5 classic Lara skins. ",
                               isLiked: false,
                               category: category1)
        gameData.saveData(game: game20)
    }
}
