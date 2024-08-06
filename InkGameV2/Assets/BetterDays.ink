
LIST inventory = photo, shell, cross, bible, okamoto_footprints, elaines_box, claudia_wine_sample, cristina_wine_sample, tracker, red_pill, green_pill, blue_pill, clip, terrells_gun, suit

LIST evidence = corpse_state, richters_comp, claudias_records, astrecamine_sample, bottle_sample_clear, pill_is_astrecamine, daria_document, scene_footprints

LIST statements_ = ritas_arrival, no_missing_property, scanner_malfunction, calm_neighbors, cristina_not_there, hana_saw_cristina, richter_saw_cristina, ritas_late_confession, okamoto_blames_rita, richter_blames_rita, elaines_confession, troys_ex, cristina_accusing_rita

LIST state = neutral, box

LIST profiles = Denis, Rita, Claudia, James, Hana, Cristina

LIST health = dead, alarming, wounded, beat, unharmed

LIST skid_favor = nothing, warning, took_money

LIST suspicion = none, mild, worrying, alarming

LIST stat_levels = one = 1, two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7

LIST timetable = Wednesday, Thursday, Friday, Saturday, Sunday, Monday, Tuesday, Next_Wednesday

VAR day = Wednesday
VAR day_gave_pills = Next_Wednesday

LIST timezones = morning, night

VAR time_of_day = night
VAR mins_in_richters_office = 0
VAR mins_in_okamoto = 0

VAR HP = unharmed
VAR XP = 350

VAR audacious = 4
VAR analytical = 5
VAR sly = 3
VAR empathetic = 2
VAR rogue = 3

VAR handyman = 4
VAR versed = 5
VAR stealthy = 3
VAR rhetor = 4
VAR observant = 5

VAR money = 10000

VAR accused = "Willford"
VAR partner = "RANDOM"

VAR cristinas_call = true 
VAR played_message = false

VAR string_example = "Jennifer"

VAR willford_suspicion = none
VAR okamoto_suspicion = none
VAR cristina_suspicion = none

VAR opened_drawer = false
VAR visited_again = false
VAR claudia_sample = false
VAR cristina_sample = false
VAR found_pick = false
VAR jammed = false
VAR accepted_job = false
VAR custodian_charge = false


LIST interest = low, medium, significant

VAR cristinas_interest = none

VAR troys_trust = low
VAR elroys_trust = low

~ SEED_RANDOM(RANDOM(1,100))


-> get_in_car

=== function change_skill(skill,direction) ===

{
    - direction == two and skill <= six:
        ~skill++
            
    - direction == one and skill >= two:
        ~skill--
}
~ return skill


=== function ending(scene) ===
{
    - scene == "aim":
    Noah tries to instantly aim for Troy's gun, but in the heat of the moment, he misses.
    Kiara watches her husband lying on the floor with a surprised expresssion engraved on his face and a river of blood spurting from his chest. 
    A strange tingle overwhelms Noah. It's not the typical neural discomfort caused by the mechanical arm, this feels a hundred times stronger.
    He can see the wife hysterically crying, trying to help her husband, his partner trying his best to maintain his composure, but he can't hear a thing.
    I gunned down an innocent man. #Thought
    There's no going back. #Thought
    
    "Breaking News, ladies and gentlemen, a police detective shot down an unfortunate 45 year old man in his home in Vo Ngang last night, in front of his wife. Sources say that the helpless victim had sensitive information regarding a case that the deranged detective was working on."
    "The policeman willingly came forward to the local authorities, claiming he acted hastily in self defense. A handgun was found to be in the victim's possession at the scene of the crime, seemingly backing up the perpetrator's claim."
    "Due to the policeman's cooperation and the supporting evidence, it is believed that he will avoid a life sentence, although he could be up to a 15-year sentence."
    "No matter the outcome, the incident sparked a wide outrage with hundreds of people fiercely protesting against police brutality all over the city. We'll be broadcasting live these scenes of chaos in a minute, please with us."
    
    - scene == "handle_troy":
    A thunderous shot is heard momentarily, before a piercing ringing is all that Noah can hear.
    Everything becomes a blur, while he realizes that he's no longer on his feet.
    A brief, strange moment of calmness and peace, as he faces the ceiling.
    And then, darkness...
    
    "Ladies and gentlemen, we're bringing you some breaking news, a police detective was shot down by a 45 year old man last night. The shooting took place in the 45 year old's home, while the detective and his partner were there to interview him about an ongoing case."
    "The perpetrator was escorted to the local police station by the victim's  partner, where he commited suicide in his cell, later in the night, under undisclosed circumstances."
    "The procedural questioning was said to be brief, as the 45 year old man only claimed that he felt threatened and that he acted on self-defense. Oddly enough, his behaviour gave the officers the impression that he just wanted to get the process over with."
    "More details are expected to emerge over the next days surrounding this bleak tragedy. Changing gears to lighten the mood, you can customize your meals into a one-inch pill ! A groundbreaking invention by the faculty of the University of Volaron allows users..." 
    
}

=== function try(a,b) ===
~ temp rand = RANDOM(1,6)
~ temp result = a + rand
    { rand + result >= b:
    (Succeeded:  {a} + dice({rand}) >= {b})
        ~ return true
        
        
      - else :
      (Failed: {a} + dice({rand}) < {b})
        ~ return false
    }
    
=== function timepass() ===

    {
        - time_of_day > morning:
        ~time_of_day--
        - else:
        ~time_of_day++
    }
 


=== function came_from(-> x) ===
    ~ return TURNS_SINCE(x) >= 0
    
=== next_move ===

{
    - time_of_day == day:
        #background
        #dayfont
    - else:
        #background
        #nightfont
}
~state = neutral


{
    - day == Sunday && time_of_day == morning && cristinas_interest == significant && cristinas_call == true:
    Back home, the detective's device starts ringing. It's a call from Cristina Artuso.
    Why would she call me on a Sunday ? #Thought
    
    *[Answer.]
    Noah: Hello, Ms.Artuso. Is everything alright ? #Conv
    Cristina: Hello, detective. I'm very sorry to disturb you, in case you're not on duty. I just feel the need to talk to you, it's important. You can come to my house later in the evening. If it's your day off, I understand, you're human too, after all. #Conv
    
        **[Accept.]
        Noah: Don't worry, I can make it. What time should I be there ? #Conv
        Cristina: Around 20:00 would be good, if it's no problem. #Conv
        Noah: Good, 20:00 it is, then. #Conv
        ->cristina_sunday
        
        **[Decline.]
        Noah: I'm sorry, I won't be able to do so today. You can call the precinct and ask for my partner, {partner}, though. He will brief me tomorrow morning and I will get back to you as soon as possible. #Conv
        Cristina: I see. Alright, detective, have a good evening. Again, my apologies. #Conv
        The call ends.
        Quite odd. She calls me several days after our conversation, let alone on a Sunday. Nevertheless, if it was really urgent, she would have insisted. I guess I'll find out tomorrow.
        ~cristinas_call = false
        -> next_move
    
    - time_of_day == night && skid_favor == warning:
    Noah receives a late voice messsage.
    It's from "Skid"... #Thought
    The detective plays the message.
    ~played_message = true
    Skid: Mr.Taulen ! Thank you for doing business ! A few moments ago, Terrell Foe came here like a dog in heat, so eager to pay his debt . You sure set him straight, ypu little fiend ! #Conv
    Skid: Anyways, I'm a man of my word, so, time to hold my end of the deal. #Conv
    Skid:This guy I told you about, he resides in the eastern suburbs, in the Vietnamese neighborhood of Vo Ngang. #Conv
    Skid: As you take Exit 34 from here and then turn right for Chinzou, at some point you'll see the main square of Vo Ngang. There's quite a few ramen shops, I believe he lives somewhere across one of them. #Conv
    Skid: He changed his name to Troy Berkins, so you can start from that. Hope you find whatever it is you're after. #Conv
    Skid: Oh, and don't forget, next time you come around, drinks and girls are on the house. See ya ! #Conv
    The message ended.
    
    
    ~day++
    ~timepass()
    
    Finally. #Thought
    
    
    - time_of_day == morning && day == Friday && crime_scene.housekeeper3.give_her_money:
    
    ~ timepass()
    -> rita_reveal
    
    - time_of_day == night && day_gave_pills == day:
    This afternoon in Mr.Richter's office gave the detective some perspective. 
    It's time to rest now.
    
    -> examiner_pill_update
    
    - TURNS_SINCE(->sergeant_call.daria_update) == 2 or TURNS_SINCE(->rita_reveal) == 2:
    Noah is contemplating his next move.
    
    - day == Saturday && time_of_day == night && !crime_scene.housekeeper3.give_her_money:
    Another day ends, another day closer to the deadline. Although beat, Noah struggles to fall asleep. Instead, he keeps rolling over from one side of the bed to the other. The pressure has gotten to him.
    Everynight, I've been sleeping less and less. Have a feeling I'm continuing the trend tonight... #Thought
    
    *[...]
    -> rita_died
    
    - day == Thursday && time_of_day == night && get_in_car.ask_sokolov:
    This day is over. Time to rest... #Thought
    
    ~day++
    
    ~timepass()
    
    -> sergeant_call.daria_update
    
    -time_of_day == night:
    
    ~timepass()
    
    ~ day++
    
    {~After a taxing day, Noah finally finds himself home|Just before jumping to bed, Noah needs some time to contemplate|The day is almost over, but before that..}.

    Time to plan for tomorrow... #Thought
    
    - else:
    
        {
             - inventory ? (red_pill, blue_pill, green_pill):
             
            ~ inventory -= red_pill
            ~ inventory -= blue_pill
            ~ inventory -= green_pill
            ~ day_gave_pills = day
            
            -inventory has red_pill:
            ~ inventory -= red_pill
            ~ day_gave_pills = day
        }
    
    ~timepass()
    
    {~ A quick stop to eat and catch a breath.|A busy day for the detective, but it's not over yet.}
    
    I still have a few more hours to take care of business for today. #Thought
    }
    
*{sergeant_call.daria_update and time_of_day == night} [Visit 'Skid'.]
-> rosey_sqr

*{accepted_job} [Visit Terrell Foe.]
I'd be better if I did this alone.{partner} doesn't need to know. #Conv
-> terrell_foe

* {terrell_foe.drop_off_money or played_message or red_hole.shovegun} [Visit Troy Berkins.]

~skid_favor =  nothing
-> cristinas_ex

* {!dr_castello} [Visit Dr.Castello.]
->dr_castello

* {!mr_richter}[Visit Mr.Richter.]
->mr_richter.meet_richter

*{inventory has bible and (analytical >= 3 or versed >=3)} [Look for the coordinates in the bible.]
-> coordinates

=== cristina_sunday ===
#background #cristinas
~timepass()

Noah arrives at Cristina's apartment, 20:00, sharp. Cristina greets him and shows him in. Her outfit looks sleek and compliments her accordingly.
{sly > 4: She put a little too much effort on her appearance, given the occasion. [Sly > 4]} #Thought
Cristina: Thank you so much for coming, detective ! I understand that you're very busy, but it means a lot to me that you still found the time. First of all, would you care for a drink ? I have some very fine Italian amaretto. #Conv
 {rogue < 3: This wouldn't be professional on my part. [Rogue < 3]} #Thought
 
 *(accept_drink) [Accept.]
 
 ~change_skill(rogue,two)
 
 Noah: That would be great, thank you. #Conv
 Soon enough, Cristina returns with two glasses of amaretto and the bottle.
 Cristina: You know, detective, someone could have called me inappropriate, but the other day you struck me as such a class act that you really earned my trust. That's why I feel comfortable talking to you in this setting. #Conv
 
 *(decline_drink) [Decline.]
 
 ~change_skill(rogue,one)

Noah: No, thank you, it wouldn't be appropriate on my part. A glass of water would be fine. #Conv
Cristina: Pardon me for my boldness, detective, it's just that you made a great impression on me the other day with the way you handle the case. #Conv

-  Noah: No problem. What did you want to talk about ? #Conv
Cristina: You know, these last few days have been a real struggle for me and for the other residents, too. Strangely, with each day I'm getting more scared and confused. Is there any update that you can share ? #Conv

-> cristina_dialogue

= cristina_dialogue

* {rita_died} ["Mrs.Willford's housekeeper was found dead this morning."]
Noah: I'm assuming you didn't hear about this, but Mrs.Willford's housekeeper, Rita Stamopoulos was found dead this morning. A boat discovered her in the Hagslow River. #Conv
Cristina: Oh, my God. This is terrible ! But, how, why ? #Conv

    ** [Tell her what you read.]
    Noah: The police is still looking for motive. They don't presume foul play, for now. As far as this continues to be the case, they'll call it suicide. #Conv
    Cristina: I don't know what to say... I'm devastated. Maybe being the one who discovered Claudia's body took a serious toll on her. She worked for the couple for years, after all. Poor woman ! #Conv
    
    -> cristina_dialogue
    
    ** ["Someone wanted her gone."]
    
    ~ XP += 20
    Noah: I believe that someone wanted her gone. Being the person who discovered the body, she probably witnessed something that could incriminate the killer. #Conv
    Cristina: Detective, I don't want to overstep, but that would mean that she either saw or knew the killer. She didn't say anything like that to us. I didn't want to bring this up, especially now, but what if she actually did it ? #Conv
    Noah: How do you support this ?
    Cristina: Besides Claudia taking her own life, it's the only explanation I can think of. Personally, I didn't know the housekeeper that well, but maybe she was capable of doing such a thing and then, she covered it up.
    Cristina: Perhaps, the guilt was eating her up, or, the fear of getting caught drove her paranoid and she decided to take her own life, too. Again, I hate to even mention it, but her potential involvement has crossed my mind before... #Conv
    {empathetic > 5:The moment I suggested that someone could've had the motive to eliminate Rita, she went from feeling for her to passively accusing her.} #Thought
    ~statements_ += cristina_accusing_rita
    
        ***{sly > 4} ["This is an interesting time to accuse her." (Sly > 4)]
        
        Noah: This is an interesting time to accuse her. {okamoto_blames_rita or richter_blames_rita:Not while she was alive, because you're this naive friend, so you let the others throw shade at the housekeeper.}
            Now that she passed so mysteriously, you can easily attribute it to her, because the narrative of her commiting the murder and then taking her own life due to regret seems plausible and she's not around to defend herself anymore. #Conv
            Cristina's laid-back and playful vibe gives way to a fiery temper.
            Cristina: You should be ashamed to speculate so immaturely and have the audacity to come to my house and flat-out accuse me of something like that ! I only wanted an update on my friend's case. Get out of my house, please. Next time you come here, you better have a warrant ! #Conv
            Cristina angrily shows Noah the door and the detective follows protocol. 
            This is the first time I'm seeing her like this and it just so happens to coincide with the first time that I openly put her in my crosshairs. She knows. #Thought
            The detective returns home to review the situation.
            
            -> next_move
        
        ***["She didn't see you when the word got out."]
        Noah: When the neighbors got notified about what happened, she didn't mention seeing you. It felt strange, since she mentioned the other neighbors and you were here, according to you. #Conv
        Cristina: Like I told you the day we met, I was in deep sleep at the time of the incident. It wasn't until much later when I realized what had happened. Maybe she didn't notice me in all that commotion or she simply forgot to mention me, but I was definitely there. You can ask the other residents, they can testify. What is with this distrust all of a sudden ? Did it actually cross your mind that I could do this to my friend ? #Conv
        
        
* ["Is this why you invited me here ?"]
Noah: Is this the reason you invited me here ? For an update ? #Conv
Cristina: Of course. You have to understand, Claudia was a friend. After all, just one floor separated us. Considering the way she died, am I not allowed to feel vulnerable and seek answers ? {cristina_sunday.accept_drink: Consider the drink a token of appreciation for your tireless effort, I believe you needed it. You, too, have needs, after all. } #Conv

{cristina_sunday.accept_drink and observant > 4:Her head is slightly tilted to the side, while she keeps arching her back [Observant > 4]|Right, right, I know...} #Thought
{cristina_sunday.accept_drink and sly > 4:She's trying to flirt with me. Not sure what she's trying to accomplish, though. Maybe I should play along to find out. [Sly > 4]|What does she want to know ?} #Thought

    ** {cristina_sunday.accept_drink}[Ask her if she's single.]
    -> flirt
    
    ** {cristina_sunday.accept_drink}["We're going off-track."]
    Noah: I'm afraid we're going of track, maybe. Thank you for the drink, but let's stick to the case. #Conv
    Cristina: Sorry, I might have given you the wrong idea, I apologize. I'm sure you'll tell this to your companion later and you'll be laughing at me. #Conv
    She chuckles nervously in an attempt to shrug it off.
        
        ***["I have no companion."]
        Noah: I have no companion. #Conv
        Cristina: Pardon me, I naturally assumed you did. You carry yourself with class, you have an esteemed job, you are clearly smart and your looks don't hurt either.  #Conv
            
            ****(flirt_back)["What about you ?"]
            -> flirt
            
            ****["Thank you."]
            Noah: Thank you, but let's not lose focus. #Conv
            -> cristina_dialogue
            
        ***[Move on.]
        The detective keeps a straight face and moves on.
        ->cristina_dialogue
    
    **["I see."]
    Noah: I see. You have a point. #Conv
    -> cristina_dialogue
    
= flirt
Noah:{cristina_dialogue.flirt_back: What about you ? A woman such as yourself can't possibly stay alone.|I don't mean to sound intrusive, by any means, but, if you have a partner, you could ask them to stay with you. It would make you feel more secure.} #Conv

Cristina: Not thrilled to inform you that I am indeed single, haha. You know, focusing on my career doesn't leave me with that much time to fool around. Having said that,  If I'm spending the little time I have left in the week with someone, they have to know what they want, but they are hard to find these days. Do you know what you want, detective ? #Conv
{rogue > 4: What's wrong with a little more "hands-on" investigation ? [Rogue > 4]} #Thought
{empathetic > 3:This seems highly unethical. [Empathetic > 3]} #Thought

* ["Yes."]

~change_skill(rogue,two)

Cristina and the detective come closer to each other. Despite the circumstance, Noah could not deny her appeal. They start kissing, before slowly undressing.
Cristina: I could tell you wanted this from the first day you came here. I promise, it's worth it ! #Conv
{evidence has claudias_records or statements has troys_ex:With Cristina's blouse off, Noah notices a miniscule symbol on Cristina's stomach.}
{evidence has claudias_records or statements has troys_ex:No way ! A symbol resembling the letter "A"! She's indeed a member of the "Arbor" !} #Thought

    **{evidence hasnt claudias_records and statements hasnt troys_ex} [...]
    
    ~change_skill(rogue,two)
    
    -> get_together
    
    **{evidence has claudias_records} [Make her lead you to the crypt. (Rhetor>8)]
    
    {
        -try(rhetor,8) == true:
        Noah: Wait, I have an idea. Let's build some tension, first. It makes it so much better. Meanwhile, there's this place I wanna show you. Let's go and you'll see. I promise you, it's worth it. #Conv
        Cristina: Tension, huh ? I like it when a man sets the night's pace. Take me to that place, detective... #Conv
        As they walk across the building's entrance hall, Noah stops next to the painting.
        {versed > 3: "The Arnolfini Portrait" by Jan van Eyck. You'd always hear rumours about this painting. I wonder if it's the original{cristinas_ex:, or one of Troy Berkins' rip-offs}...} #Thought
        Noah: Hold on, this is a great piece of art. Did you know that if you look inside the circular mirror, you''l find hidden details ? Come, take a look. #Conv
        Artuso shows some uneasiness.
        Cristina: I'm not realy into paintings, to be honest. I prefer other forms of art. Let's go, I want to see what you have in store for me... #Conv
        Noah: No, I really think you should stand here and place your left eyeball in front of the little mirror. #Conv
        Artuso's expression turns more serious than ever. 
        Cristina: I don't know what you're trying to prove, but you'll find nothing. #Conv
        Noah: We can do this right now, or I can have a squad here in 20 minutes and we'll do this the hard way. Your call. #Conv
        Cristina stiffly walks in front of the canvas and places her eyeball accordingly.
        Automatically, a trapdoor appears right next to them.
        Cristina: I understand you want to play supercop, but this has nothing to do with your case. #Conv
        
        -> the_crypt.crypt_with_cristina
        -else:
        -> cristina_refuses
    }
    
    **{evidence has claudias_records or statements has troys_ex} [Go home.]
    Noah: I'm sorry, this isn't right. It's unethical, I shouldn't even be here. I have to go. Let's keep things formal from now on. For anything case related, you can contact the precinct. #Conv
    Cristina: You're right, I don't know what came over me. Excuse me for my behavior, I just liked something about you. #Conv
    The detective grabs his coat and storms out of the apartment. On his way to the car, one thing has become clear in his mind.
    She's way deep into this, whatever this is exactly. Tomorrow, we have to take her in for questioning. #Thought
    -> next_move
    
* ["No. (Leave)"]

~change_skill(empathetic,two)
Noah: No, in your terms, I don't know. Excuse me, I have to go, this was a mistake. #Conv
Cristina: It's ok, detective, nothing happened, you don't need to go ! #Conv
Before Cristina gets the chance to properly finish her sentence, Noah is already walking towards the door. He opens it and disappears with a shameful feeling, in the still of night. 

->side_activity

= get_together
The two of them spend a passionate evening together. During this time, Noah's actions elude his better judgement, while both of them enjoy it for what it is.
It's almost midnight and Noah decides that this is a good time to return home.
Noah: It goes without saying that nobody should know about this. I think you're aware of that. #Conv
Cristina: Of course, detective. Thank you for being here tonight, it helped a lot. #Conv
Noah leaves the residence in the dead of night and walks towards his car like a thief, knowing well that what he did must be buried in the past.
-> next_move

=== cristina_refuses ===
Cristina notices Noah's sudden uncomfort.
Cristina: What's wrong ? #Conv
Noah: It's nothing... I just felt a little rush, it's probably vertigo, I've had it in the past. Would you mind going for some fresh air ? #Conv
Cristina: Well, you can open the window and step out on the balcony here. #Conv
Noah: No, I think I need to walk a little bit. Come with me, a quick stroll around the block and we'll continue where we left off, I promise. #Conv
Cristina: Sorry, my legs are killing me. If you don't want to go to the balcony, another time, maybe. #Conv

*[Tell her to show you the crypt.]
Noah: There have been reports about a crypt inside this building and I believe you can show me where it is. #Conv
Cristina: I don't understand. Now you're worrying me, what are you talking about ? #Conv

Noah: You can drop the act. I saw the "A" on your stomach. If you don't show me now, a squad can be here in no time and we'll find out for ourselves. How does that sound ? #Conv

Artuso's expression changes and a devious look takes form.

Cristina: Really smart, detective, good work. You've been assigned to solve a murder and you choose to study anthropology. You won't find a thing, I promise you. At least, give me a minute to use my restroom. #Conv

Artuso escorts the detective downstairs to the building's entrance hall.
Cristina: You know, we could have had a great time together, but you chose to distrust me, just to play supercop. #Conv
She places her left eyeball looking at the center of the mirror being depicted in the painting.
{versed > 3: "The Arnolfini Portrait" by Jan van Eyck. You'd always hear rumours about this painting. I wonder if it's the original{cristinas_ex:, or one of Troy Berkins' rip-offs}...} #Thought
A trapdoor emerges right next to them.

    **[Get in.]
    -> the_crypt.crypt_with_cristina


*[Leave.]
Noah: Alright, I'm sorry then. I have to leave. For anything case-related, you're free to reach out. #Conv
Cristina: Did anything happen ? Was it something I did ? #Conv
Noah: No, no, it's a condition, it happens sometimes. Good night. #Conv
The detective leaves Cristina's house in a daze. It's clear to him that Claudia's allegations are legitimate. Now, he only needs that defining piece of evidence to arrest the right person, or people. 
-> side_activity

=== the_crypt ===

= crypt_with_cristina

#background #crypt
{once:A large elevator takes them several levels below.}
The detective sees a spacious, dimly lit venue with amphitheatrical architecture. Across the perimeter, there is a digital mural, illustrating the human evolution. On the opposite side, there is a platform with a gothic throne on it. Facing the platform is a half-circular formation of sections of seats, much like a parliament. On the wall behind the platform, there are three doors, one in the middle and one in each corner.

*["What's with the mural ?"]
Noah: What's with the mural ? #Conv
Cristina: It's what we call "The Process". The evolution of humankind, but as you see, it doesn't end with the homo sapiens. We believe in a new hybrid form that is in early development, free from our flaws and self-destructive tendencies. #Conv

    **["You are out of your mind !"]
    Noah: You are out of your mind ! #Conv
    Cristina: You don't have to agree. I'm not trying to force it on you, you came here on your own to disrespect us. #Conv
    -> crypt_with_cristina
    
    **["Tell me more."]
    
    ~XP += 20
    Noah: Tell me more. #Conv
    Cristina: It is all based on our philosophy to become the best versions of ourselves, both physically and mentally. To get rid of our pathogenies, listless habits and moral vices. We pursue that throught specialized and systemic training and education from a young age. #Conv
    Cristina: However, our natural oranism is a limited vessel, prone to wearing down. Through ethical interventionism, we manage to fix, upgrade and renew parts of ourselves, which allows us to keep pursuing and evolving. For us, the Higher Power gave us all these tools for a purpose. To use them to the best of our ability to reach the highest form possible. #Conv
    -> crypt_with_cristina
    
    *["Who is that throne for ?"]
    Noah: Who is that throne for ? #Conv
    Cristina: It's for our leader. A very righteous individual, a renowned figure and a great philanthropist. They deliberately choose to maintain their role in our community undisclosed to avoid becoming a target by political oppositions and government-backed media. #Conv
        
        ** {richter_files.doc3 or try_open_box.unlocked_box} [The "Mentor" ?]
        Noah: You're talking about the "Mentor", right ? #Conv
        Cristina: This is a title some of us chose to give him out of respect, it was our decision. We are not a cult. #Conv
            
            ***["I want to meet them."]
            Noah: I want to meet them. #Conv
            Cristina: {cristina_refuses: Don't worry, you will meet them. All your questions will be answered.| This is up to them, not me. I can't initiate contact.} #Conv
            -> crypt_with_cristina
            
            ***["How are they 'mentoring' you ?"]
            Noah: How are they 'mentoring' you ? #Conv
            Cristina: In every way. First of all, they created the community and with that, our core ideologies. To this day, they create our young peoples' curriculum, they decide upon the community's interventionist practices and they manage the community's funds and political activity. In general, every major decision goes through them. #Conv
            -> crypt_with_cristina
            
        ** ["You're describing a shady manipulator."]
        Noah: You're describing a shady manipulator. #Conv
        Cristina: So, to you, the people who wish to make a change without wanting to expose themselves at the risk of being undercut by the nasty means of the New Republic are the shady manipulators ? Of course, you're law enforcement, what else could you possibly say... #Conv
        ->crypt_with_cristina
            
        **(deal_with_the_devil) {rogue>5} ["Maybe I could cut a deal with your righteous leader. (Rogue > 5)]
        
        ~change_skill(rogue,two)
        Noah: Maybe I could cut a deal with your righteous leader. #Conv
        Cristina: Of course you want something out of this, you're just like every other cop in this city. We'll see about that. #Conv
        -> crypt_with_cristina
    
    * ["What do you do in this room ?"]
    Noah: What do you do in this room ? #Conv
    Cristina: We meet here to discuss the present and the future of the community. Nothing more, nothing less. #Conv
        
        **["Do you need a secret vault for that ?"]
        Noah: Do you need a secret vault for that ? #Conv
        Cristina: People can be wary of our cause and actions, case in point. The system's forces would raid our meetings in a heartbeat. Just like every form of oppression has done to trailblazers throughout history. #Conv
        -> crypt_with_cristina
        
        **["Who is this 'community' ?"]
        
        ~XP += 10
        Noah: Who is in this 'community' that you're rambling about ? #Conv
        Cristina: Intelligent, powerful, virtuous people who share this vision. There's nothing shady or convoluted behind our connection, only our collective aspiration. I'm sure you've met some of them these last few days. #Conv
        -> crypt_with_cristina
    
    *{cristina_refuses} -> ambushed
    *{!cristina_refuses} ->
    
=== ambushed ===
    
-> END

=== cristina_questioning ===

-> END

=== terrell_foe ===
#background #terrells
The detective manages to track down the address that 'Skid' gave him and stands outside the guy's supposed apartment. 
'Skid' said that the guy works night hours, so {time_of_day == morning:I should be able to find him here.|I won't deliver the "message" in person.} #Thought

*[Knock on the door.]

{
    - time_of_day == morning:
    -> terrell_morning
    - else:
    Let's make sure nobody is here. #Thought
    Noah knocks twice, but nobody responds.
    The door is locked, of course. I should find another way to enter. #Thought
    I think this building has a custodian. He must have keys for the apartments. Maybe I could convince him to unlock the door.  #Thought
    
    **[Try to pick the lock. (handyman > 4 or stealthy > 7)]
    -> lockpick_terrell
    
    **[Find the custodian.]
    -> terrell_custodian

}



= lockpick_terrell
{
    -try(handyman,5) == true or try(stealthy,8) == true:
    
    ~XP += 20
    ~rogue ++
    
    Putting his craftiness into use, the detective manages to unlock the apartment's front door.
    -> terrell_night
    -else:
    The detective struggles to handle the lock and he makes a mistake. The door is now jammed.
    Shit. Now I should definitely bring the custodian over.
    
    ~ custodian_charge = true
    
    * [Bring the custodian.]
    -> terrell_custodian
    
}


= terrell_morning
A man's voice is heard from the other side of the door.
Man: Who is it ? #Conv
The man sounds nervous.

*["This is the police."]
-> cops_visit

*[Pretend to be a new neighbor. (Sly >= 7 or Rhetor >= 8)]
Noah: Hello ! My name is Eric, I just moved in two stores above you. I was wondering if you could help me clear some confusion over the payment of the maintenance fees. I'll only take a minute off your time. #Conv

{
    - try(sly,7) == true or try(rhetor,8) == true:
    ~sly++
    ~XP += 10
    The man opens the door.
    Terrell: Look, sir, I'm 'bout to head out for some business, so let's make it quick. #Conv
    
    
    -> pretend_neighbor_success
    
    -else:
    Terrell: Uh... Sorry I'm very busy at the moment. #Conv
    Noah: Crap. That didn't work. Time to drop the masks. #Thought
    **(failed_acting)[Reveal yourself.]
    -> cops_visit
    

}

= pretend_neighbor_success

*{rogue >= 6}[Pull out your pistol and threaten him. (Rogue>=6)]

~rogue++

Noah: I wouldn't be so hasty if I were you. #Conv
The detective quickly grabs his pistol and aims at the man. Terrell raises his hands and takes a few steps backwards, in a defensive state of shock. This gives Noah the opportunity to close the door behind him.
Terrell: Please man, I-I don't any trouble ! Just take whatever you want and leave !! #Conv
Noah: What I want is 'Skid' to have his money back by the end of the day. I believe we've been putting this off forever, haven't we ? #Conv
Terrell: Alright, alright, I'm very sorry ! I've been trying to pay off my debt for quite a while. I-I just made a few bad investing decisions along the way and some other people took advantage of me ! #Conv
Terrell: Look, I finally have the money, I can get it for you, right now. Just give me a moment ! #Conv

    **[Watch him bring the money over.]
    Noah: Make it quick. #Conv
    Terrell rushes cautiously to the bathroom. The moment he steps in, he slows down, as if he's trying to remember where he hid the money.
    {empathetic >= 3:How did it come to this ? Is this really who I've become ?} #Thought
    Terrell tries to lift the lid of the flusher.
    {empathetic >= 3: Maybe that's what you saw in me, Cynthia...} #Conv
    Terrell lifted the lid. He's reaching for something.
    {
        - sly >= 3 or observant >= 4:
        Oh, no. He's reaching for a gun. #Thought
        ***[Scare him off.]
        -> scare_him_off
        - else:
        -> terrells_got_a_gun
    }
    **[Go grab it yourself.]
    Noah: You stay right where you are. You'll tell me where it is and I'll go for it. And don't try anything stupid, my barrel will be looking straight at you. #Conv
    Terrell: Fine ! It's inside the cupboard, right behind the left bathroom mirror. #Conv
    Terrell: I really don't want any more troubles ! More than anything, I want to let this stuff behind me and try to be a better dad. My son's eight, I need to be around for him. A big part of that money went to his medical bills. #Conv
        
        ***[Ask about his son.]
        Noah: What's wrong with your son ? #Conv
        Terrell: Vapor Lung. Not that uncommon in the area. With all the vaporized chemicals from malfunctioning industrial systems and leaks, you learn to deal with it. #Conv
        Terrell: Healthcare ain't no option here and treatment had me doing any extra job I could find, legal or not. #Conv
        Terrell: His condition got really bad at one point. We thought Jon wouldn't make it... Fortunately, he pushed through and got over it. He's still having some troubles and he'll have to face some chronic side effects, but my boy, he's a fighter and nothing will keep him down ! #Conv
        The man's story throws Noah a bit off guard as he stashes the man's money in a bag.
        ~ empathetic++
        
        {rogue >=2:
        ~rogue--
        }
        
        ***[Ignore him.]
        Noah ignores the man's monologue as he stashes the man's money in a bag, while keeping an eye on him.
        
        ~ money += 5000
        
        ---Noah: That will be it, I guess. #Conv
        
    -- The detective is on his way out.{observant >= 3:`Before he leaves, Noah takes a last look at the house's interior. A picture of Terrell and his son and a bunch of child drawing catch his eye. }
    
    ** {empathetic >= 4} [Give up the money.]
    Noah: You know what... Screw it. #Conv
    The detective throws the bag back to Terrell.
    Noah: I won't take the bread out of your kid's mouth. But you gotta make better choices. You have a family. Figure it out and pay him back real soon, because next time he'll send somebody else and it will be the last. #Conv
    Terrell: Oh man, thank you, thank you so much ! I won't forget this ! I'll never forget that. I will fix everything, I promise. Thank you ! #Conv
    ~ empathetic += 2
    {rogue>=3:
    ~rogue -= 2
    }
    The detective leaves the man's house in a bittersweet mood. 
    I can't believe I almost did Skid's bidding. Where were my morals ? I shouldn't take any more shortcuts while working this case... #Thought
    
    ~skid_favor = nothing

    -> next_move
    
    **[Leave.]
    Noah: Good doing business with you. You won't see me again. #Conv
    Noah calls "Skid" to inform him that he has Terrell's money. "Skid" instructs him to meet his men at the "Red Hole", where they will confirm the transaction.
    
    ~ skid_favor = took_money
    -> drop_off_money
    

= terrells_got_a_gun
Out of the blue, Terrell reveals a gun of his own. He's ready to shoot the detective.

*[Run.]
Within a blink of an eye, Noah runs the apartment's exit and doesn't look back.
What a stupid idea... I'm done working with dirtbags. #Thought
Noah storms out of the building and walks briskly to the next block, trying not to draw attention.
Disappointed and embarrassed, he decides to go about his business.
-> next_move

*[Tell him you're a cop.]
->cops_visit

= cops_visit
{
    -terrells_got_a_gun:
    Noah: Before you do anything stupid, buddy, I'm a police detective. Here's my badge. #Conv
    Noah takes out his badge with one hand, as the other is still firmly holding the pistol.
    Terrell: Then why did you lie ?! Who do you really work for ? #Conv
    Noah: I'll ease your mind, cause it's none of your business. Your business is to pay back the debt you owe.  #Conv
    -> cops_visit_2
    - terrell_morning.failed_acting:
    Noah knocks again.
    Noah: Actually my name is Noah Taulen, police detective with the Stillfork P.D. #Conv
    A few seconds later, the man responds:
    Terrell: I'll need to see your badge. #Conv
    Noah shows his badge through the eyehole. The man opens the door, abruptly.
    Terrell: What is it, detective ? And why did you lie to me before ?! #Conv
    Noah: I know you have reasons to avoid attracting your neighbors' attention with a policeman in front of your door. May I come in ? #Conv 
    Terrell starts looking uneasy, as he lets Noah inside his house.
    Noah: I'm afraid you have some unfinished business with a mutual "friend" of ours, "Skid". Your debt is overdue and I'm here to ensure the man gets his money back. #Conv
    Terrell: Is this some kind of joke ?! #Conv
    Noah: I'm afraid not. And trust me, you're lucky to have me in front of you instead of anybody else. #Conv
    -> cops_visit_2
    -else:
    Noah: This is Noah Taulen, police detective, here's my ID. I'm afraid you have some unfinished business with a mutual "friend" of ours, "Skid". Your debt is overdue and I'm here to ensure the man gets his money back. #Conv
    Terrell: Is this some kind of joke ?! #Conv
    Noah: I'm afraid not. And trust me, you're lucky to have me in front of you instead of anybody else. #Conv
    -> cops_visit_2
}

= cops_visit_2
Terrell: Just wait 'till I report you ! #Conv
    
    *["Good luck with that."]
    Noah: Good luck with that. Do you really think I would just storm in here and reveal myself if I had to worry about getting in trouble ? Or are you that naive about law enforcement ? #Conv
    
    *["You'll get in trouble."]
    Noah: I know very well that you're no saint. You start reporting to the police, they're going to start digging into your income, your rap sheet and your involvement with people like 'Skid'. Not a good look. #Conv
    
    - The man {terrells_got_a_gun:lowers his weapon, along with his stare|realizes this is not a farce.} He's in no position to turn the situation to his favor.
    
    Terrell: I would've gotten the money sooner. I, I just had to cover some additional medical bills for my son's treatment. I know you probably don't care about this, but I felt the need to say it. #Conv
    
    *[Get him to give you the money.]
    Noah: Now, do what's good for you and put all of Skid's money in a bag and throw it over to me. #Conv
    Terrell, defeated, walks over to the bathroom, opens a cupboard and starts unloading the money he kept there. He puts the last stash in the bag and throws it to the detective.
    Noah: You did the right thing. Considering the people you choose to associate with, it's better to have a hole in your pocket than one in your head. #Conv
    
    ~ money += 5000
    Noah grabs the bag and leaves the house.
    -> next_move
    
    *{empathetic >= 3}[Offer him a last warning.]
    Noah: I won't take money, but this is the last warning. I'm giving you a window here. You have 2 days, then I'm coming back with a permit. Unless, "Skid" gets really frustrated and decides to visit sooner, in a far less civilized manner. #Conv
    
    ~ empathetic++
    {
        -rogue>=2:
        ~ rogue--
    }
    
    Terrell: Fine... I understand. #Conv
    Noah leaves the hopeless man alone.
    
    ~ skid_favor = warning
    
    -> next_move
    
->END

= scare_him_off
Before the man gets the chance to execute his plan, Noah fires a bullet, right beside him. The man is caught off guard and drops his weapon, accidentally.
Terrell: I'm so sorry, please, have mercy ! I have a kid to support, I'm the only one he got ! I-I just got scared, I'll get you the money, for real now ! #Conv

*[Tell him to kick the gun towards you.]
Noah: Maybe we can have a fresh start if you kick that thing over here, first and foremost. Don't try anything funny. #Conv
Terrell kicks his gun in front of the detective's feet, while keeping his hands raised.

~ inventory += terrells_gun

Noah: A gun and a child under the same roof isn't a great idea, so I'm keeping this. You're welcome. #Conv

Terrell stashes the money inside a bag. He kept it hidden in a cupboard behind the left bathroom mirror.

* [Keep pointing at him.]
Terrell: I was gonna pay him back on time, man, I swear. I got jumped by some dudes and I had to make up for it through some extra wages. #Conv
Terrell: I had to spend some for my kid's medicine too. Couldn't happen at a worse moment. #Conv

    **[Ask about his kid.]
    
    Noah: What's wrong with your kid ? #Conv
    Terrell: Vapor Lung. Not that uncommon in the area. With all the vaporized chemicals from malfunctioning industrial systems and leaks, you learn to deal with it. #Conv
    Terrell: Healthcare ain't no option here and treatment had me doing any extra job I could find, legal or not. #Conv
    Terrell: His condition got really bad at one point. We thought Jon wouldn't make it... Fortunately, he pushed through and got over it. He's still having some troubles and he'll have to face some chronic side effects, but my boy, he's a fighter and nothing will keep him down ! #Conv
    
     ~ empathetic++
     
     ** [Let him ramble on.]
     Noah chooses to not pay attention to the man's whining.
     Just hand me Skid's money, I have bigger fish to fry. #Thought
     
     -- Terrell stashes the money inside a bag. He had kept it hidden in a cupboard behind the left bathroom mirror.

- Terrell throws the bag at Noah.
Terrell: That should be more than enough. Please, tell 'Skid' I'm sorry. #Conv

~ money += 5000
{observant >= 3:`Before he leaves, Noah takes a last look at the house's interior. A picture of Terrell and his son and a bunch of child drawing catch his eye. }

*[Leave.]
Noah: Good doing business with you. You won't see me again. #Conv
Noah calls "Skid" to inform him that he has Terrell's money. "Skid" instructs him to meet his men at the "Red Hole", where they will confirm the transaction.

~ skid_favor = took_money
-> drop_off_money

*{empathetic>=4}[Give up the money.]
Noah: You know what... Screw it. #Conv
The detective throws the bag back to Terrell.
Noah: I won't take the bread out of your kid's mouth. But you gotta make better choices. You have a family. Figure it out and pay him back real soon, because next time he'll send somebody else and it will be the last. #Conv
Terrell: Oh man, thank you, thank you so much ! I won't forget this ! I'll never forget that. I will fix everything, I promise. Thank you ! #Conv
 ~ empathetic += 2
The detective leaves the man's house in a bittersweet mood. 
I can't believe I almost did Skid's bidding. Where were my morals ? I shouldn't take any more shortcuts while working this case... #Thought

~ skid_favor = nothing

-> next_move

= drop_off_money

    Within an hour, Noah is already at the "Hole", sitting on a couch, waiting for Skid's primary henchman to meet him. Finally, the man emerges from the back area.
    Henchman: So, you got the money yourself, huh ? I guess you got some balls after all ! #Conv
    
    * ["Glad you realized it !"]
    Noah: At last, glad you realized it ! #Conv
    
    * ["Just count it."]
    Noah: Just count it and then call "Skid". #Conv
    
    - The man counts the money thoroughly.
    Henchman: Alright, 5000, we're good. I'll call the boss. #Conv
    ...
    Skid: You magnificent bastard ! I underestimated you. OK, here's the scoop on the guy I was telling you about : #Conv
    Skid: He resides in the eastern suburbs, in the Vietnamese neighborhood of Vo Ngang. #Conv
    Skid: As you take Exit 34 from here and then turn right for Chinzou, at some point you'll see the main square of Vo Ngang. There's quite a few ramen shops, I believe he lives somewhere across one of them. #Conv
    Skid: He changed his name to Troy Berkins, so you can start with that. #Conv
    Skid: Oh, I'd also like to give you a little something, since you went the extra mile and brought the money. A little token of appreciation. #Conv
    
    The henchman brings over what appears to be a high-end suit.
    
    Skid: A shipment just arrived today and they sent me a few extra ones. This is bioengineered, self-healing silk, top of the line. Coming next year, you'll be seeing all the elites rocking these bad boys. #Conv
    Skid: The highest end of couture, I'm telling you. These cost 2000 a piece, just to give you an idea. You wear that suit on a night out and the ladies will be opening their legs faster than the New Republic sent the country in the dumpster ! #Conv
    
    * [Accept the gift.]
    
    ~ rogue = change_skill(rogue,two)
    ~ empathetic = change_skill(empathetic,one)
    
    Noah: That's a killer suit, actually. Looks like I can't pass this offer. Thanks, I guess. #Conv
    
    Skid: Oh, come on ! Just a gift to solidify this new friendship.
    ~ inventory += suit
    
    * (reject)[Reject the gift.]
    
    ~ rogue = change_skill(rogue,one)
    ~ empathetic = change_skill(empathetic,two)
    
    Noah: Thanks, but, no, thanks. The deal was simple: I make sure you get your money, you give me the information I want. We're not becoming "friends", not even close. #Conv
    Skid: Wow, tell us how you really feel, am I right ? A little rough around the edges, Mr.Taulen, I get it. Thanks for doing business, then.
    
    - You're {reject:still} welcome here any night, drinks and girls on the house. #Conv
   Noah leaves the "Red Hole".
   
-> next_move

= terrell_custodian
Noah finds the custodian in the studio apartment located on the ground floor. A middle-aged man with few hair and a light grey beard, not overly friendly. A distinct smell of booze and cigarettes appears to be following him.
Custodian: What is it, mister ? #Conv
Noah: Sorry to bother you. I need to gain access to apartment 2C, on the second floor. It's an emergency. #Conv
Custodian: Wait a minute. Mr.Foe lives there. What's the emergency ? I gotta call him first to get permission. #Conv

*[Tell him who you are.]
Noah: This is Noah Taulen, detective from the Stillfork P.D. #Conv
Noah shows him his badge.
Noah: I need to enter Mr.Foe's apartment imminently. He might be linked to some serious charges and I need to search for incriminating evidence in his house. #Conv
Custodian: What are ya talking about ? I won't do it unless you have a permit. #Conv
**[Bribe him.]
-> bribery_medium

**[Try to intimidate him. (Rhetor > 9 or Audacious > 7)]

{
    -try(rhetor,8) == true or try(audacious,7) == true:
    ~ XP += 20
    ~ audacious ++
    Noah: There is a grand ongoing operation targeting a crime ring and our task force has been ordered to work under the utmost secrecy. Should I call the Head Commissioner to confirm this or would you prefer your employer first ? Maybe the commissioner himself would like to have a word with your employer and I hope he doesn't ask him why the custodian wouldn't cooperate and made himself an accomplice ? #Conv
    Custodian: Alright, relax detective ! I don't need that kind of trouble ! Give me a second to grab the keys. #Conv
    -> custodian_opens
    
    - else:
    -> custodian_intimidation_fail
   
}

*[Bribe him.]
-> bribery_easy

= custodian_opens
The custodian returns anxiously with the key in his hand and opens Terrell's front door.
Custodian: Are we in danger, sir ? #Conv

*[Ignore him.]
The detective has no interest in engaging in conversation with this man and doesn't respond.
-> terrell_night

*["No, you're not."]
The detective sighs.
Noah: No you're not. #Conv
-> terrell_night

= custodian_intimidation_fail
 Noah: Don't force my hand here, if you're not willing to help me, I'll find another way. Actually, I think I'm going to break the door open, right now. #Conv
    Custodian: Go for it ! There's a camera right on the top corner of the hallway. I'm sure that footage would really compliment your service record. #Conv
    I can't believe I said that ! Now he holds the cards. I'll need an entirely different approach. #Thought
    **[Bribe him.]
    -> bribery_hard
    
= bribery_easy
Noah: How about we do this: Let's say you dropped the key by accident and couldn't find it for a few minutes and a generous tip fell off my wallet. #Conv
The custodian stays silent for a couple of seconds.
Custodian: How much ? #Conv
Noah: 1000 meridians. I figure it's a big percentage of your salary. #Conv
Custodian: I want 3000. #Conv

*[Give him 3000.]
Noah: Fine. Here's 3000. Now hand me the key.
~money -= 3000
Custodian: Here you go. Just make it quick and give it back as soon as you're done. #Conv

-> terrell_night

*[Offer him 1500.]

~XP+= 20
~sly++

Noah: Can't do that. I don't even have that much credit on me right now. You'll have to settle for 1500. #Conv 
Custodian: I'm putting my ass on the line here ! I'll take 2000, but not one meridian less. #Conv

**["Deal."]

Noah: Deal. Here you go. #Conv
~money -= 2000
Custodian: There you have it. Hurry up, though and bring it over the moment you're done. #Conv

-> terrell_night


= bribery_medium
Noah: Whatever, I have a proposition. Give me the key for a few minutes and I'll be generous. How's 1500 meridians ? #Conv
Custodian: How cheap do you think I am ? Risking my job for that much ?! I want 4000.#Conv
Noah: 4000 ?! #Conv
Custodian: I think that taking 4000 meridians from a police officer who attempted to bribe me to let him break in a civilian's home is pretty generous. #Conv
Great, now he's extorting me. #Conv

*[Give him 4000.]

~money -= 4000
Noah: OK. You can have it. You better put it to good use. #Conv
Custodian: Now, we're starting to talk sense. Take it and bring it back after, immediately. #Conv
-> terrell_night

*[Offer him 2000.]

~XP+= 20
~sly++

Noah: I think you're overestimating the situation. Best I can do is 2000. #Conv
Custodian: No, you are the one who's clearly underestimating it. How about this, you'll give me 3000, I'll lend you the key for 5 minutes and maybe I won't mention anything. Or else... #Conv
This guy's got some serious nerve. #Thought

**["Deal."]

~money -= 3000

Noah: Deal, you can have that much. You must feel really drunk in power right now. #Conv
Custodian: Nothing personal, detective, just your average Joe hustling for that extra payday. Here's the key, make it as quick as you can and return it to me. #Conv
-> terrell_night

= bribery_hard
Noah: Alright, we got off the wrong foot here. I actually admire your work ethic, but my admiration doesn't help here. I'll make it worth your while. How about 2000 meridians ? #Conv
Custodian: This has to be some kind of joke. I, on the other hand, seriously think that this conversation presented a lot of sensitive information and it's going to take much more than 2000 meridians for it to remain sensitive. Give me 6000. #Conv

*[Give him 6000.]
Noah: Way to exploit someone. Here's 6000. Now give me the key and never ever mention this. #Conv

~ money -= 6000
Custodian: A man's gotta have a code, detective. Make sure to bring the key over as soon as you're done. #Conv
The custodian hands the key and walks off with a saturnine smirk on his face.

-> terrell_night

* [Offer him 3000.]
Noah: Look, you caught me in a vulnerable state. I don't have 6000 on me at the moment. I can give you 3000, though. #Conv
Custodian: Not good enough. 4000 then, or no deal. #Conv

**["Deal."]
Noah: That's reasonable. It's all I have on me, anyways. Here you go. #Conv

~ money -= 6000
Custodian: Good. Take the key. Remember to drop it off as soon as you're done. #Conv
-> terrell_night

= terrell_night
{
    - custodian_charge == true:
    ~ money -= 500
}

The detective gets inside Terrell's house{custodian_charge == true: (after the custodian charged him 500 additional meridians for the jammed lock)}.
-> terrell_night_2

= terrell_night_2
Foe's apartment is a small place, poorly furnished and questionably decorated.
It consists of only the main room, a small kitchen and an even smaller bathroom.
This place reeks of bad life choices... #Thought

+[Check out the main room.]
This room is the main space of the apartment. Τhe single bed in the corner suggests that this is a bedroom, too. There's also a computer desk, a set of dumbells and some wall decorations.

    ++[Check out the bed.]
    It's just a plain single bed. Next to it, there's a nightstand with a framed picture on it.
        +++ [Take a look at the picture.]
            It's a picture of him with a little boy out in a park. They're both smiling.
            ++++ [Go back.]
            -> terrell_night_2
        +++ [Go back.]
        -> terrell_night_2

    ++[Check out the desk.]
    -> terrell_desk
    

    ++[Check out the dumbells.]
    Just a couple of sets of dumbells, a small bench and some pieces of other gym equipment.
    -> terrell_night_2

    ++[Check out the decorations.]
    -> terrell_decor

+[Check out the bathroom.]
-> terrell_bathroom

+[Check out the kitchen.]
-> terrell_kitchen

*{terrell_bathroom and terrell_desk and terrell_decor and terrell_kitchen} [Deliver the 'message' by 'Skid'.]
-> terrell_message

= terrell_message
I think it's time to deliver Skid's 'message'. #Thought

*(threatened_son){rogue >=4} [Threaten his son.]

~ rogue+=2
Targeting his son will probably staighten hi up right away. #Thought
Noah writes a note on the wall above Terrell's bed. The note says "Skid says 'hi' to the little fella. He might tell him in person soon." He also tears the picture of Terrell with his son and places the son's face right above the note.
Let's see how this plays out... #Thought
The detective decides it's time to go. 
-> side_activity

*{stole_money} [Let him know you took back some of Skid's money.]
Noah writes a note on Terrell's bathroom mirror. The note says "Skid got tired of waiting for his money, so he took some. He won't ba as subtle for the rest."
I'm practically doing this man a favor here... #Thought
Noah takes the money with him, closes the door behind him and goes about his business.

-> side_activity

*[Give him the 'corrupt cop' warning.]

~ rogue++

Noah leaves a note under Terrell's door. The note says "Law enforcement kindly requests that your friends be paid back on time. We forward sincere greetings from the 'Red Hole'."
The detective marks the note with the law enforcement's signature stamp. Only police officers have these in their possession.
Having completed his objective, Noah walks off. 
-> side_activity

*[Trash the house.]

~ rogue++

The detective decides to follow a classic tactic. He throws different stuff around, rips some jerseys and drawings, nicks the wall and some furniture, breaks the bathroom mirror, among other things. He also leaves a note, saying "Don't make us come again."
That will do the trick. #Thought
After turning the apartment upside down, Noah thinks it's time to head for the exit.
-> side_activity

*{empathetic>2}[Don't do it.]

~ rogue--

~ empathetic++

What am I doing here... This is wrong. I am not that kind of cop. Not that kind of person... #Thought
Deep in shame and regret, the detective decides to leave the man's house without doing Skid's work.
-> side_activity


= terrell_kitchen
{once:The moment he walks into the kitchen, the detective notices a spoon and a lighter nexto to each other on the counter.|The spoon and the lighter depress the detective everytime he sees them.}
    * [Check out the rest of the house.]
    -> terrell_night_2

= terrell_decor
A wall displaying his interests. On one side of the wall, he has placed music album covers. On the other side, basketball jerseys of his team. One portion is also preserved for drawings.

+[Take a look at the covers.]
All of them are hit records from Trancehop Trance artists. A contemporrary music genre, widely known for promoting the gangster lifestyle.

-> terrell_decor

+[Take a look at the jerseys.]
All of them from different time periods of one of the city's prevalent teams.
We clearly got an 'Avalon Assassins' fan here. Now I feel sorry for the guy. #Thought
-> terrell_decor

+[Take a look at the drawings.]
All of them clearly created by a child's hand. A lot of them depict a child, most of them with a man by the child's side.
On one of them, it also says "WORDLS BESST DAD".
-> terrell_decor

+[Check out the rest of the house.]
    -> terrell_night_2

= terrell_bathroom
A narrow bathroom, visibly messy, having been slightly damaged by damp.

*[Check the left mirror cupboard.]
Noah opens the left cupboard. {once:He finds a handful of stashes of money.}{stole_money: Most of the stashes are now in his pockets.}
{once:Quite the hiding spot. I'm sure this is all from honest work. {rogue > 4 or sly > 4:Maybe some of that ought to keep 'Skid' content for a while.}} #Thought

    **(stole_money){rogue > 4 or sly > 4}[Take the money.]
    
    ~ rogue++
    ~ sly++
    
    ~money+=5000

        ***[Continue.]
        -> terrell_bathroom
    ++ [Go back.]
    -> terrell_bathroom

*[Check the right mirror cupboard.]
The detective {once:discovers a|sees the} plethora of unlabeled pill bottles and a syringe.
{once:I saw that one coming...} #Thought
-> terrell_bathroom

+[Check out the rest of the house.]
    -> terrell_night_2


= terrell_desk
A desk with a computer on it. Under the desk there is a set of drawers.
    + [Open the first drawer.]
    Okay, that's clearly pornography. #Thought
    
        ++[Look elsewhere.]
        -> terrell_desk
    + [Open the second drawer.]
    Just random stuff.
        ++[Look elsewhere.]
        -> terrell_desk
    + [Open the third drawer.]
    Of course he has a bong. #Thought
    
        ++[Look elsewhere.]
        -> terrell_desk
    
    +[Check out the rest of the house.]
    -> terrell_night_2

=== treatment ===
-> END

=== richter_files ===
{once:Noah sits in front of his computer and goes through the files he stole from Maxwell Richter's archive.}
*[...]
After hours of searching for something of note, there are only a handful of documents he hasn't checket yet.
-> richter_docs

= richter_docs

*["sched_jan48.doc"]
->doc1

*["publication.doc"]
->doc2

*["lab_test"]
->doc3

*-> files_end

= doc1 
Just a schedule of upcoming guest lectures and conferences.
*[Return.]
-> richter_docs

= doc2
"Enhancing the Future: The Case for Brain Chip Implantation in Minors"
"As technology rapidly advances, brain-computer interfaces (BCIs), or brain chips, have emerged as a groundbreaking innovation, promising to enhance cognitive abilities, communication, and physical performance. While their potential benefits for adults are widely recognized, the idea of implanting these devices in minors has sparked considerable controversy."
"Proponents argue that brain chips in minors could revolutionize education, improve mental health, and foster superior problem-solving skills. Critics, however, raise concerns about ethical implications, developmental impacts, and health risks."
"This publication explores the case for brain chip implantation in minors, presenting evidence of potential benefits and proposing stringent guidelines to ensure safety and ethical integrity. We argue that, with proper safeguards, brain chips could significantly enhance the lives of younger generations, paving the way for a more advanced and capable society..."
{rogue <7:What on earth am I reading ? This guy is a lunatic ! That's enough.} #Thought
*[Return.]
-> richter_docs

= doc3
"Operation Successful: The latest implantation was successfully completed on Monday, November 30th. The subject is a 13 year old Caucasian female, 167cm, 53kg, blood type: 'O plus'. She has been responding as expected and has scored promising results on her cognitive tests. No signs of past memory awareness and no unexpected post-operation side-effects. Currently awaiting for the review by The Mentor in order to assign her to her class and dormitory."
{observant >= 2 and get_in_car.talk_to_sokolov:Daria Kozlov fits right in that description ! What have they done...} #Thought

{
    -get_in_car.talk_to_sokolov:
    ~evidence += daria_document
}
*[Return.]
-> richter_docs


= files_end
{evidence has daria_document: That could be enough to issue a warrant and a full-blown investigation against this guy.|This guy can't be trusted for sure...} #Thought
-> next_move

=== try_open_box ===

~ state = LIST_VALUE(box)

Noah {once:puts|has} the box in front of him. 
{observant > 2:Claudia wrote something about a key in her bible notes...} #Thought
{observant > 2 and analytical > 4 and versed > 3: It could be a numerical reference to that specific bible verse right below the note.} #Thought 
Here goes nothing. #Thought #Input
The answer is 2239.

-> END

= unlocked_box
~ XP += 30
{once:A green light appears, followed by a sudden click. The box is open.}
{once:Did that really just happen ?!} #Thought
Inside the box there is {once:a|the} small hologram projector and a pack containing a hard drive and some printouts. There is also a note that says "play the recording first".

*(play_rec)[Play the recording.]
There is just one file stored. Noah presses "play".
A hologram of Claudia appears, instantly creating a chilling atmosphere in the detective's room.
Claudia: My name is Claudia Rosalie Willford and I am 44 years old. I live in Stilton Avenue, 48, Stillfork, 44731. I am recording this message on December the 1st, 2047. #Conv
Claudia: I hope this message reaches the right people... If you are witnessing this, it probably means that I am no longer around. This is my confession. #Conv
Claudia: Fifteen years ago, I moved to my, then, soon to be, husband's, James' house, the one in which I reside to this day. I was excited to spend the rest of my life with him, especially in this beautiful apartment, located in such an esteemed neighborhood. For the first few years, everything felt so right. #Conv
Claudia: James had been living there for years, but even though he was making a good living, this place seemed quite above his budget at the time. He explained to me that his late uncle bequeathed it to him. These houses, he said, were inheritances that had been preserved and passed on through generations and a lasting community had been established between them. #Conv
Claudia: It really felt like a prestigious group of cultured and affluent people who support each other and want to give back to society. They would host fundraisers and dinner parties with high profile guests.#Conv
Claudia: I found most of the neighbors to be distant at first, they wouldn't embrace me as one of them, but over time, that changed. James started bringing me over to their gatherings, where some of them would sometimes approach me and talk to me about political and philosophical matters, sharing their "vision", asking me about my opinion as well. #Conv
Claudia: I, wanting to fit in in this protected environment, would usually reciprocate. Eventually, they started talking about the "Vision" more elaborately in front of me. An overly ambitious plan to put out a neural implant for mass distribution, promising to eliminate mental pathogenies and enhance brain activity to new heights. #Conv
Claudia: However... There's something really wrong about all of this. Last year, I overheard a discussuion between James and our neighbor, Mr.Maxwell Richter, about trying out the implant on unsuspecting university students. After the initial shock, I made it a mission to find out what this group is actually doing. I managed to gain their trust and discovered some despicable things... #Conv
Claudia: Among themselves they're called "Arbor". They are a cult-like based organization and they answer to an unknown person they refer to as "The Mentor". They used to mention him frequently, but I never got the chance to meet him. The elite members of "Arbor" bear a discrete symbol on some undisclosed part of their body. Some part that can't easily be seen. This scheme has been around for decades, constantly updating their members by recruiting or even abducting defenseless young people and enforcing their ideas on them by any means, thus creating new "soldiers". #Conv 
Claudia: Their goal is to increase their political influence in order to be able to overthrow the New Republic and control the head of the state. Then they plan on passing a bill for mandatory neural implantations for whoever civilian they might see fit. Ultimately, what they aim for is rebuilding the state to their liking, with no opposition ever again. #Conv
Claudia: Inside this box, I've also included a pack of all the evidence I was able to collect. Names, transcripts, documents, transactions, conversations, anything I thought could be evidence. #Conv
Claudia: Lastly, I think that they've started to suspect me. Lately, they have been treating me differently. I've even gotten anonymous formal threats in my messages. James has warned me to mind my business, repeatedly. I know he's in this too, I just didn't want to believe it. I have to be careful of him too, after all. #Conv
Claudia: One final tip, there is a hidden crypt, right under the ground floor of the building. The group have been secretly meeting there for decades, whenever they want to discuss serious matters or get in contact with the "Mentor". #Conv
Claudia: As you enter the hallway on the ground floor, on your right hand there is a painting. At its center, a circular mirror is depicted. They place their left eyeball at the center of the mirror and an underground stairway reveals itself right beneath it. That's the only way to access it, to my knowledge. #Conv
Claudia: Anyway, once I find the last pieces of evidence, I will contact the authorities. However, if anything happens to me, it won't be an accident.  Lord forgive their souls... #Conv

~ evidence += claudias_records

The detective tries to shake off his goosebumps.
Love your neighbor as yourself, right  ? You can't write this stuff... This narrows it down to a small "dream team" of suspects. #Thought
{get_in_car.leave and observant > 2: Maybe that's what happened to little Daria.} #Thought
-> unlocked_box

+ [Check out the pack.]

{
    -!play_rec: Maybe I should play the recording first... #Thought
    -> unlocked_box
    -else: Noah spends hours reading and dissecting every single file on the hard drive, every single detail written on the printouts. Funds illegally transfered to politicians' accounts, blueprints and beta testing reports on the infamous implant, transcripts, etc. Information that cannot help him determine who murdered Claudia, but can provide a solid foundation for Claudia's claims. 
    -> next_move
    
} 



=== coordinates ===

#background #police_station

{time_of_day == morning: As soon as Noah arrives at the precinct the following day|A few hours later}, he attempts to trace where the handwritten coordinates lead to. He types the numbers in his computer and quickly gets a result. 
    They point to an undisclosed location in the upper-west side of Aberstadt, an hour drive from the heart of the city.
    Nothing comes up about this location. Guess we'll have to find out for ourselves. #Thought
    ->ms_bronson
    
= ms_bronson
#background #elaine_street
About an hour and a half later, the detective and his partner arrive at the location where the coordinates point at.
Once one of the city's premiere commercial hubs, this side of Aberstadt is now a relic of its past, with most of its buildings housing either closed businesses or minimum wage laborers. Nevertheless, the rest of the district of Aberstadt is in a much worse state.
The two men stand in front of a neglected four floor building. It almost looks haunted, especially with nobody coming in or out.
Noah: I have no clue what we're looking fot here. Maybe the intercom will give us some idea. #Conv
The detective looks closely at the intercom.
-> intercom

= intercom
*["StarCure Regenerative Center"]
Noah buzzes.
Intercom: StarCure Regenerative Center, the leading team in regenerative physical treatment, enhancement and augmentation, using only the most cutting-edge technology. #Conv
Intercom: Unfortunately, due to current legislation, we were obliged to move our business out of state. Thank you for reaching out to our front office ! #Conv
-> intercom

*["VeilTech Creations"]
Noah presses the buzzer.
Intercom: You've reached the headquarters of VeilTech Creations, the one-of-a-kind facility that literally hands you your dreams ! Fabricate your own experiences, memories or identities with just a little help from our augmented reality environment !
Intercom: We're sorry to announce that our workflow is in a temporary hiatus, until our legal team settles a technical dispute. We promise to be back in no time ! #Conv
-> intercom

*["Elaine Bronson"]
{observant >= 4:Elaine Bronson...that's the "E.B" from the bible note !|Is this a residence ? I don't know...} #Thought 
A brash female voice answers through the intercom.
Intercom: Who is this ? #Conv

    **[Introduce yourself.]
    Noah: This is police detective Noah Taulen. Am I speaking to Ms.Bronson ? #Conv
    The other voice pauses for a moment.
    Intercom: Can you please show your badge to the camera ? #Conv
    The detective raises his police badge and displays it in front of the camera, just like he was asked to.
    
    -> ms_bronson_2

*[(blank)]
-> intercom

= ms_bronson_2
{once:Intercom: Yes, this is Ms.Bronson. Can I help you with something ?} #Conv

*{observant >= 4} ["Claudia Willford referred to you." (Observant >=4)]
Noah: I'm currently investigating the death of Claudia Willford and she referred to you in her private notes. #Conv
A prolonged moment of silence disrupts the conversation.
Intercom: What are you talking about ? #Conv
{empathetic > 3:The pause and the slight voice break tell me that she knows.} #Thought

    ** {empathetic >3 or rhetor > 2}["I believe you knew Mrs.Willford."(Empathetic > 3 or Rhetor > 2)]

    ~empathetic++
    ~ XP += 10
    Noah: To my understanding, you and Mrs.Willford knew each other. There's no evidence that either frames or incriminates you, don't be afraid. I believe she purposefully left a trail that leads to you, because you may be able to help us solve the case. #Conv
    Intercom: I did... I just... Second floor, first door on the left. #Conv
    Suddenly, the entrance door opens.
        *** [Go find Elaine.]
        -> ms_bronson_3

    ** (intimidate_elaine) [Intimidate her.]
    Noah: Ms.Bronson, there is concrete evidence that suggests your involvement in this case. On top of that, deliberate refusal to comply with the according procedure appointed by law enforcement classifies you as a suspect, which can lead to an imminent arrest warrant. #Conv

    ~audacious++
    Intercom: I haven't done anything wrong detective ! I will explain. You'll find me on the second floor, first door on the left. #Conv
    The entrance door opens.
        *** [Go find Elaine.]

        -> ms_bronson_3

    ** [Leave.]

    -> ms_bronson

*[Explain how you found this location.]
Noah: My partner and I are investigating the death of a woman named Claudia Willford. While inspecting the scene of the crime, I found a hand-written note which included what I believe to be the coordinates of this address. Does any of this sound right to you, Ms.Bronson ? #Conv
Another silent pause, this time a bit more prolonged.
Suddenly, the building's entrance door opens automatically.
Elaine: Second floor, first door on the left. #Conv
    ** [Go find Elaine.]
    -> ms_bronson_3


= ms_bronson_3
Noah and {partner} find the woman standing apprehensively by the doorstep of her apartment. She looks mentally drained, with dry skin and dark circles under her eyes. Even so, she appears to be roughly the same age as Claudia.
Elaine: Please, come inside. #Conv
Elaine: Claudia was a good friend of mine. I've known her since I was a child, we were brought up in the same foster home. Life was tough but we got close and had each other's backs, to the point that we still kept in touch all these years later. #Conv
Elaine: I saw what happened in the news and I was devastated, still am. She was a beautiful soul. #Conv

*(mention_box) {ms_bronson_2.intimidate_elaine}["Why did you pretend to not know ?"]
Noah: Then why did you pretend to not know what I was talking about ? #Conv
She timidly lowers her head.
Elaine: I was... scared. Over this past year, she kept hinting that something might happen to her. That someone might harm her because she knows some things. It worried me very much, but she would never really elaborate, no matter how hard I pressed her. #Conv
~ statements_ += elaines_confession

Elaine: I'm ashamed for my stance, but I didn't know how to deal with all these negative emotions and it's still very recent. But I'll make up for it now. #Conv

* ["Didn't anybody contact you ?"]
Noah: Didn't anybody contact you ? A family member, a friend ? #Conv
Elaine: A few days after the news broke out, her husband, James, left me a message, out of common courtesy, I guess. Obviously, I wanted to give my condolences directly, so I called a few times, but he didn't answer. I didn't insist, because I respected his grief, so I left a message instead. #Conv
Elaine: A couple of days went by and he gave me a call. We talked for a few minutes and I was emotional. He, on the other hand, remained very collected and gave me the impression that he wanted to get this over with. I don't know what to think of it. Especially after she gave me this. #Conv

* ["Do you know why she mentioned you ?"]
Noah: Do you know why she mentioned you ? #Conv
Elaine: I do. There's something I need to show you. #Conv

- Elaine retrieves a small grey box from her bedroom.
Elaine: She claimed to have some sensitive information{mention_box:, like I mentioned}. {not mention_box:Over the last month or two, she would insist that she could be in danger because of it, but she wouldn't explain.} Finally, the last time that I saw her, she left me this box. #Conv
Elaine: She told me that if anything were to happen to her, I should hand this to the authorities. #Conv

*["But you didn't."]
Noah: But you didn't. #Conv
Elaine: {mention_box:Like I said, } I was afraid. I didn't know if I was going to get in trouble, if somebody would be after me, hell, I don't even know what's inside. I keep thinking about ths box over and over again every day. #Conv
Elaine: I decided to hand it to the police station several times, but I always hesitated at the last minute. I guess, that's over now. #Conv

*[Say nothing.]

- Elaine gives the box to the detective.

~ inventory += elaines_box

Elaine: The problem is, I don't know how to open this. As you can see, it is sealed by a combination lock of four slots. I remember her handing me the correct combination, but I've lost it ! I can't figure out any other way to open the box... #Conv
{versed > 3:It has to be some kind of titanium alloy, it would be virtually impossible to crack it apart, without damaging whatever is inside.} #Thought
{partner == "Milton":Milton: This appears to be Grade 5 titanium, one of the most widely recognized for its strength and hardness. This alloy contains 6% aluminum and 4% vanadium, which significantly enhance its mechanical properties, including hardness. I would strongly advise against trying to use force to open it. |Johnson: This looks like one of those specialized cases we used in the military to store medicine. Practically impenentrable and no way to pick the lock, whatsoever. Our only chance would be the right combination. } #Conv

*[Ask Elaine about the combination.]
Noah: Can you recall any letters or characters, or even imagine what kinds of combinations she could have come up with ? #Conv
Elaine: I took a look at it when she gave it to me, I believe it was only digits. Claudia would usually hold on to numbers or phrases that meant something to her or affected her. I wouldn't call it superstition, she was just a spiritual person. #Conv

*[Ask Elaine where Claudia found the box.]
Noah: This type of box is quite uncommon for public use and hard to find on the market. Do you know where she got it ? #Conv
Elaine: I'm afraid I don't, sir. What I do know from that is that she went to great lengths to keep the content of the box away from everyone, even her husband. This, especially alarms me. #Conv

- Noah: You've given us a lot to think about. In case you find out or remember anything more, call me or my partner on these numbers. #Conv
Elaine: I will, detective. You two seem trustworthy, not very common in your workforce these days. Part of the reason I was hesitant to hand the box to the authorities. Please, find out the truth about my friend... #Conv
The two men leave the woman's apartment, leaving her emotionally charged.

{
    -time_of_day == morning:
    -> next_move
    -else:
    -> side_activity
}


=== meet_partner ===
#background #police_station

Following his visit at the coroner's office, Noah arrives at the precinct. As he walks to his office, he sees his new partner, {partner} waiting outside. 
{
    -partner == "Milton":
    Milton: Good morning, Detective Taulen. I've been informed by Sergeant Jacobs that you have appointed me as your provisional partner, effective today. #Conv
    Milton: I am honored and I will do my best to learn from you and contribute to the investigation. #Conv
    Noah: Wow, nice speech you wrote there. I appreciate it, but take it easy, we're doing the same job. #Conv
    Milton: My speech pattern is programmed in a certain way, detective. I will try to adapt to a more casual style overtime, if you wish so. #Conv
    Noah: Feel free to. Welcome aboard, then, let's grab some coffee and get down to it. #Conv
    - else:
    Johnson: Morning, boss. Cool to be on your team. We're gonna crack this case like nobody's business. #Conv
    Noah: Not really your boss, "detective" will do. I appreciate the optimism, I guess... You seem a little off today, though. #Conv
    Johnson: Oh, I just had a few drinks last night and my head's paying the bill today, haha... No big deal, I have my large black coffee right here and I'm ready for some real business... #Conv
    I hope I don't regret this. #Thought
    Noah: Get ready then, I'm grabbing some coffee myself and we're off. #Conv
    Johnson: Right on, boss. I mean, detective. Where to ? #Conv
}
    *[Visit Dr.Castello.]
    ->dr_castello
    *[Visit Mr.Richter.]
    ->mr_richter.meet_richter
    

=== side_activity ===

Looks like I have a couple of hours before I close my eyes...#Thought
{HP < unharmed:I'm hurt pretty badly though... Maybe I should go to Trevor to patch me up.} #Thought

+ {inventory has elaines_box} [Try to unlock Elaine's box.]
-> try_open_box

+ {evidence has richters_comp} [Go through Richter's files.]
-> richter_files

+{HP < unharmed} [Get treatment.]
-> treatment

+[...]

-> next_move

    
=== tryout ===
#background
#first_scene

lalala
lololo #old_city #Input
->END

=== tryout2 ===
lilili
lelele #Input
->END

=== tryout3 ===
Hello there, {string_example} ! Really cool name...
->END

=== get_in_car ===
#background
#first_scene


    Noah gets back in the car.
    ... Visibly irritated... #old_city
    
    Dammit. I still feel some pinching in my fingers... #Thought 
    
    
    His left prosthetic arm causes him trouble from time to time, hence the bad mood he occasionally finds himself in.
    
    The more Trevor tries to fix my arm, the less I believe that he's a licensed engineer. #Thought 
    

    Having to drive from the precinct all the way here after 12 hours of work isn't of much help either.
    ~ inventory += photo
    
    The thought of his fiancée coming back from Nordenport tomorrow brings him comfort though. 
    

    *   [Start the car.] -> get_in_car.start_car
    *   [test] -> test
    
= start_car
"Excuse  me, sir !"#Conv
An odd, disheveled man hurryingly approaches Noah's car.
Stranger: I'm sorry to bother you, I'd just like a minute of your time... #Conv 
* [Brush him off.] -> get_in_car.start_car2

= test
the end. -> END

=start_car2
Noah: Sorry, I don't have any change on me and it's getting late- #Conv
Stranger: No, you don't understand, it's very serious... #Conv
*   [Ignore him.]
Noah: I should really be going... #Conv
Noah starts the car abruptly and leaves the man behind.
Handy is {handyman}.
He knows that beggars and addicts are quite common in this area, hence the spontaneous reaction.
-> ride_home
*   [Talk to the man.]
Noah: Can I help you ? #Conv
Stranger: Yes, please ! My name is Denis Sokolov, I work at the Epsilon Motors factory, three blocks from here. #Conv
D.Sokolov: Pardon my indiscretion, I noticed you coming out of Mr.Morrisey's workshop. He has mentioned having a friend who works in law enforcement. I saw the car and I figured it must be you. #Conv
-> get_in_car.ask_sokolov

= ask_sokolov
{~Noah is having a hard time hiding his lack of interest in this conversation.|It might be the overall atmosphere, but this man seems suspicious.|The night's chilling temperature doesn't encourage this interaction.}
* ["I can't erase any speeding tickets."]
Noah: Just so you know, I can't erase any speeding tickets. #Conv
D.Sokolov: Oh, not at all ! I wouldn't bother you for such a thing. It's really important... #Conv
-> get_in_car.ask_sokolov
* ["So, what do you want ?"]
Noah: So, what do you want ? #Conv
-> get_in_car.talk_to_sokolov
* ["Were you following me ??"]
Noah: Were you following me ?? #Conv
D.Sokolov: Not at all ! I was just passing by, my apartment is right at the end of the street. In fact, I'm very lucky to come across you... #Conv
-> get_in_car.ask_sokolov

    
= talk_to_sokolov
D.Sokolov: I have a niece named Daria Kozlov, she is 13 years old. She disappeared three weeks ago without a trace and she's been missing ever since. #Conv
D.Sokolov: I contacted every presinct in the city, I filed missing reports, but everybody shrugged me off. #Conv
D.Sokolov: All I've been told is that the case has been filed as a low priority, because Daria is an immigrant and she doesn't have papers here. #Conv
-> get_in_car.talk_to_sokolov_2

= talk_to_sokolov_2
{&The tone in Noah's voice starts to gradually soften.|Noah needs some more information...|Sokolov's jaded face has started to gain some sympathy.|What else could Noah need to know about this girl ?}
* [Ask him about the last time he saw her.]
Noah: Can you remember the last time you saw her ? #Conv
D.Sokolov: It was on November 16th, around 9:40 P.M., I was about to go to the factory to start my shift and Daria was eventually supposed to go to bed. #Conv
D.Sokolov: I got home around 8:30 in the morning and I figured that she had already left for school, like every other day. #Conv
D.Sokolov: However, she never got back ! I called her friends and they told me she didn't show up at school, I also went to the school to ask and they told me the same thing... #Conv
D.Sokolov: I talked to everyone I could, the neighbors had no clue either... I'm still looking everyday with the help of some friends and neighbors. #Conv
-> talk_to_sokolov_2

* [Ask him if she could have run away.]
Noah: Is there any reason that could have caused her to run away ? #Conv
D.Sokolov: God, no, I can't imagine ! She's like a daughter to me and I promised her mother that I would take care of her. #Conv
D.Sokolov: Sure, we argued from time to time and the transition to life here hasn't been easy for her, but she's a good kid and a great student. She wouldn't have done anything like that... #Conv
-> talk_to_sokolov_2

*{TURNS_SINCE(-> talk_to_sokolov_2) > 0} [Ask for a picture of the girl.]
Noah: A photo would help me a lot, you know. #Conv
D.Sokolov: Yes, of course. I already sent them one when I reported her disappearance, but I doubt they even bothered adding it to her file. Here you go. #Conv
Noah: I won't take it, just hold the photo and I'll scan it. I have a knack of losing things... #Conv
Noah scans the photograph with his watch.
~ inventory += photo

D.Sokolov: I see you have those fancy gadgets, you must be good at your job. #Conv
Noah: Almost a decade in the force and that's all I have to show for it, trust me. #Conv
D.Sokolov: Well, I've been soldering parts for 15 years, ever since I emigrated here, and I can barely afford an outdated cellphone. #Conv
They both chuckle momentarily, still long enough to relieve some of the tension.
-> talk_to_sokolov_2

* {TURNS_SINCE(-> talk_to_sokolov_2) > 1} [End the conversation.]
Noah: Let me be clear, I'm not a private investigator. I don't take jobs from civilians , so I can't promise you anything more than a quick look at your case. #Conv
D.Sokolov: I understand, I just have to take every chance that I can. #Conv
-> get_in_car.leave
 
= leave 
D.Sokolov: Anyway, here's my I.D. and my number. If you happen to need any more information, call me. #Conv
Noah scans Sokolov's information.

~ profiles += Denis

D.Sokolov: Again, I'm sorry for stalling you. Mr.Morrisey speaks highly of you and he's a genuine person, so I know you will try to help me. Thank you very much ! #Conv
As the man walks away, Noah is unsure of what to make of this interaction.
Well, that was quite random. I'll have to ask Trevor about this guy... #Thought
-> ride_home

    

=== ride_home ===
{ride_home.music: Jazz always helps him collect his thoughts at the end of the day.|Noah puts his fingertip on the scanner to start the car..}

                
*   [Turn on some music.] -> ride_home.music
*   {get_in_car.ask_sokolov} [Look up Daria Kozlov.] -> ride_home.look_up_daria
*   [Start driving.] -> ride_home.homicide_call
    
= music
Noah: Lexi, play Jazz Playlist No.3. #Conv
Noah's affinity for jazz can be traced back to his childhood. His mother was a music teacher and an avid jazz enthusiast. The soundtrack of his weekends would consist of the works of Duke Ellington, Billie Holiday, John Coltrane, Nina Simone, just to name a few. #jazz_1
No.3 is for true aficionados. Mostly deep cuts and bootlegs from live performances. #Thought 

-> ride_home

= look_up_daria
Noah: Lexi, I want to search for a profile. #Conv
Lexi: An individual ? #Conv
Noah: Yes, check the Pending Emigration registry for Daria Kozlov. #Conv
Lexi: Searching . . . #Conv
Lexi: No entries filed under that name. #Conv
-> look_up_daria_2

= look_up_daria_2
That's odd. Since she hasn't been issued social security, she should be listed there... #Thought
Noah: Now, check for Daria Sokolov. #Conv
Lexi:Searching . . . #Conv
Lexi: No entries filed under that name. #Conv
What a headache... The registry office is mess, hardly the first time they haven't filed someone. A missing kid with no records is tricky though... I'll put a pin on that one. #Thought 

-> ride_home


= homicide_call
#background #ontheroad
Noah starts the engine and drives off.
The lack of Christmas decorations around Vandergrift's impoverished neighborhoods does not surprise. At the corner of the junction though, right outside of a neo-christian church stands a humble Nordmann fir with blue, red and green lights around it and a glossy star on top. 

It's been 4 years since Cynthia... maybe this year I should decorat- #Thought

The radio hisses momentarily. 


Dispatcher: A21, we have a 10-100, do you copy ? #Conv
*["Copy, go ahead."]
->ride_home.dispatch
*["Isn't A22 on duty right now ?"]
Noah: Isn't A22 on duty right now ? #Conv
-> ride_home.d22

= d22
Dispatcher: They're unavailable. #Conv
*["Alright, copy."]
-> ride_home.dispatch

= dispatch
Noah: Copy, go ahead. #Conv
Dispatcher: 10-100, respond to Stilton Avenue 48, two cars on the spot, forensics approaching. #Conv
*["I'm en route."]
Noah: I'm en route. #Conv
-> ride_home.dispatch_reaction

= dispatch_reaction
Another unexpected case is not what Noah was looking forward to, let alone a potential homicide.
Just when you think you might be home in time for a change... #Thought
* [...] -> crime_scene

=== crime_scene ===
#background #apartment_building
Noah parks his car outside of the building.
Three patrol cars and the Medical Investigations vehicle are already here. #worried_crowd
Some of the officers try to appease but also contain a concerned group of neighbors and passers-by.

Noah walks up to the policemen.
->crime_scene.talk_to_policemen

= talk_to_policemen
*["What's the situation ?"]
Noah: What's the situation ? #Conv
-> crime_scene.situation
*["Where the hell is Garza ?"]
Noah: Where the hell is Garza ? #Conv
-> crime_scene.where_is_garza
*{came_from(->situation) or came_from(->where_is_garza)}[Enter the apartment.]
-> crime_scene.apartment

= situation
Officer: A woman, fatally shot, detective. Apartment D3, on the fourth floor. #Conv

* ["On Stilton Avenue ?"]
Noah: On Stilton Avenue, huh. You don't hear that everyday... #Conv
Officer: Unusual, indeed. Anyway, the medical examiner and the sergeant are upstairs on the scene. #Conv
-> crime_scene.talk_to_policemen

= where_is_garza
Officer: He had to attend to an emergency from what I understand. A family matter, pretty urgent. #Conv
*{came_from(->situation)} [Enter the apartment.]
Noah: Dammit, alright. Apartment D3, you said ? #Conv
Officer: Yes, you'll find the sergeant. #Conv
-> crime_scene.apartment
*{not came_from(->situation)} -> crime_scene.talk_to_policemen


= apartment 
#background #apartment
Noah enters the apartment and sees the sergeant examining the area and the rest of the officers taking statements.
He also notices the medical examiner taking a first look at the woman's body in the bedroom, as well as a man and a woman in distress.

* [Talk to the sergeant.]
-> crime_scene.sergeant

//* [Talk to the medical examiner.]
//-> crime_scene.examiner

= sergeant 
Sgt.Jacobs: Fashionably late, Taulen. #Conv
* [Explain yourself.]
Noah: Garza was supposed to be working tonight, I just came back from joint maintenance ! #Conv

Sgt.Jacobs: I can't even keep track anymore... #Conv
* [Talk back.]
Noah: Sorry, please don't withhold my overtime pay. Oh right, that's totally made up... #Conv

* [Make an excuse.]
Noah: I found traffic downtown, sarge. #Conv

* ["You know me, sarge..."]
Noah: You know me sarge... #Conv
Sgt.Jacobs: How'd you fit that big head of yours through the door ? #Conv

- Sgt.Jacobs: Anyway, here's the rundown. Her name is Claudia Willford, 45 years old, fatal wound to the head by a gunshot. #Conv

Sgt.Jacobs: She was found by her former housekeeper, who came by around 22:40 to give her something. She heard a gunshot as she was arriving and Mrs.Willford wouldn't open the door. #Conv
Sgt.Jacobs: Then, she rushed to her car to grab her backup key, got back up, opened and witnessed the body. She called Mrs.Willford's husband right after she called us. #Conv
Judging by the body, this happened within that same hour. #Conv
-> sergeantconv

= sergeantconv
* [Suspect the husband.]
Noah: Well, the husband is always an easy suspect. #Conv
Sgt.Jacobs: Hey, don't start ruffling any feathers, unless we can rule out other scenarios. It looks like he has an alibi. He was out in a bar with a colleague. We contacted the colleague and the bar staff and they confirmed the story. #Conv
Sgt.Jacobs: His name is James Willford, he is a strategy analyst at Ichor.
Noah: No wonder they could afford this place... #Conv
Sgt.Jacobs: He probably carries some clout, so don't make any brash decisions. Regardless, pay attention to what he tells you. #Conv
-> sergeantconv

* ["Where was she found ?"]
Noah: Where was she found ? #Conv
Sgt.Jacobs: On her bed, lying on her left side with the gun next to her. There is no apparent sign of forced entry, but we're still evaluating all probable causes. #Conv

~ evidence += corpse_state

Sgt.Jacobs: Regardless, her husband claims that no property appears to be missing. Nothing that he knows of at least. #Conv

~ statements_ += no_missing_property

-> sergeantconv
* [Ask about the housekeeper.]
Noah: Seems a little late for package deliveries by the housekeeper, right ?  #Conv
Sgt.Jacobs: She was supposed to leave the city tomorrow and she wanted to leave Mrs.Willford a gift. #Conv
Sgt.Jacobs: Not a priority suspect, she wouldn't have a clear motive to report her crime. She also knew about the street cameras, so it seems unlikely. #Conv
Noah: Right, it's quite a strech. #Conv
Sgt.Jacobs: Still, don't let your guard down. #Conv
 -> sergeantconv

*[Ask about the neighbors.]
Noah: Didn't the neighbors see or hear anything ? #Conv
Sgt.Jacobs: Some of them heard just the shot, but nothing more. You'll have to take thorough statements from them in the next few days. #Conv
Sgt.Jacobs: Right now, the crew is checking to see what the street camera recorded, who entered, who exited, etc. I'll give you a rundown, first thing tomorrow. #Conv
-> sergeantconv
        
* ->get_to_work

= get_to_work
Noah: Alright, time to get to work. #Conv
Sgt.Jacobs: Take statements from the husband and the housekeeper and start investigating this place. #Conv
-> talk2others

= talk2others
*[Talk to the housekeeper.]
-> crime_scene.housekeeper
*[Talk to the husband.]
-> crime_scene.husband
* -> inspection

= housekeeper
Noah approaches the scared housekeeper.
Noah: Sorry for your loss. I'm detective Noah Taulen, you must be the housekeeper. I need to take your statement, can I have your name ? #Conv
Housekeeper: M-My name is Rita Stamopoulos, sir... #Conv
*(calm_down)[Calm her down.]
Noah: Let me clarify, just because you discovered Mrs.Willford doesn't mean you're a suspect. We have enough indications that suggest otherwise, so there's no need to worry.

*[Just follow the procedure.]
Noah: I want you to recount what transpired. #Conv

- Rita: Excuse me if I get emotional, I can't help it. #Conv
{calm_down:Noah: That's alright. } #Conv

-> housekeeper2

= housekeeper2
Rita: I was near the neighborhood, so I decided to come by and leave Mr.and Mrs.Willford a gift I bought for them. I should be in a train right now, so this was my last chance to bring them a gift. #Conv
Rita: I arrived a little after 22:30, parked the car and entered the building, nothing unusual so far. As soon as I got on the 4th floor, I heard something like a gunshot ! #Conv
Rita: I figured that the sound probably came from their apartment, but I still wasn't sure what to make of it. I rang the doorbell, but nothing. Then, I called her on the phone, again, no response. #Conv
Rita: I felt that something was off, so I tried to open the door by eye scan. To my surprise, the system didn't recognize me ! #Conv
Rita: I went back to the car and searched for a backup key they had given me for housekeeping hours. I found it, came back, got in the apartment and witnessed Mrs.Willford shot in the head, lying on her bed ! #Conv

~ statements_ += ritas_arrival
*["Does the eye scanner malfunction ?"]
Noah: Does the eye scanner malfunction ? #Conv
Rita: I don't remember it not recognizing me, ever. Only registered house inhabitants are allowed to open the apartment's door, and the Willfords had me registered too. #Conv
Rita: About a week ago, during my last day working here, the scanner granted me access, as normal. Maybe they erased my profile as soon as I was gone. Νow I'm just a former employee. after all. #Conv
Rita: I just happened to still have the backup key that Mrs.Willford had given me a couple of months ago. #Conv

~ statements_ += scanner_malfunction

*["How long have you had the backup key ?"]
Noah: How long have you had the backup key ? #Conv
Rita: It's been a couple of months. Mrs.Willford gave it to me one day, and it made me wonder, because I never had issues with the scanner. She just said "You never know". #Conv
Rita: Maybe they just deleted my profile, as soon as I stopped working here. It makes sense. #Conv

 - Rita takes a moment to compose herself.
*{calm_down} [Offer her some water.]
Noah: Before we continue, would you like some water ? #Conv
Rita: I'm okay... You're actually the first person to offer me anything today, thank you. #Conv


*["Please, continue."]
Noah: Please, continue. #Conv

- Rita: {not calm_down:Right... }When I discovered Mrs.Willford, I froze and started crying, but I had to do something. After the initial shock, I reluctantly searched the house, while tightly holding a pocket knife I had with me. Then, I immediately called Mr.Willford, the police and I informed Mr.Richter, who took it upon himself to let the other residents know. #Conv
Rita: I felt the need to talk to Mrs. Artuso from C3, because I know she was friends with the couple, so I knocked on her door, but I couldn't find her. I'm sure she'll be devastated ! #Conv

~statements_ += cristina_not_there
Rita: After all that, I stood outside by the street until the police arrived. I couldn't go back in there... #Conv
-> housekeeper3

= housekeeper3
*["Why didn't you call Mr.Willford before you entered ?"]
Noah: How come you didn't call Mr.Willford too before you entered ?
Rita: I didn't have his number, I mostly spoke to Mrs.Willford. I managed to call him through their home system. #Conv
*["Didn't the Willfords know you were coming ?"]
Noah: Didn't the Willfords know you were coming ? #Conv
Rita: No, it was a last minute decision and I imagined they would be home. I was about to call them right after I had parked, but I could see that the lights from their apartment were on, so I expected to find them home. #Conv
Rita: That's what concerned me later, on top of the rest. #Conv

- Noah: I see... #Conv

*["How did the neighbors react ?"]
Noah: How did the neighbors react ? #Conv
Rita: Most of them like Mrs.Okamoto from D1, Mr.Richter from D2 maintained their composure. Only a few panicked. #Conv

~ statements_ += calm_neighbors

*["Did you see any unusual faces ?"]
Noah: Did you see any unusual faces ? #Conv
Rita: No. You rarely see weird people in rich neighborhoods, such as this one. As you know, most blocks hire private security crews. #Conv

- Noah: Hmm... #Conv
*(ask_rita_couple)["What was the couple like ?"]
Noah: How was your relationship with the couple ? #Conv
Rita: Only great things to say. I'd been working for them for the last five years, or so. Most people hire androids for these jobs, as they cost less, but in this climate, the Willfords chose to help a fellow human. #Conv
Rita: Truly kind people, especially Mrs.Willford. 
*["Did Mrs.Willford display self-harming tendencies ?"]
Noah: Did Mrs.Willford display self-harming tendencies ? #Conv
Rita: No, I wouldn't say that. Despite some hardships earlier in her life she used to be an optimistic person. However, she seemed insecure and leery lately, I don't know why.
Rita: I'd been working for her for the last five years, so I could tell that she wasn't her usual self. #Conv

- Rita: Unfortunately, I had to quit last week, because my mother's health has deteriorated and I have to take care of her. #Conv
Rita: She lives in a small town near Avalon, so I have to permanently move there. I bought this nice vase for them as a token of gratitude. I waited until last minute because I was just able to afford it. #Conv
Noah: You said you had to catch a train, right ? #Conv
Rita: Yes, it has already left as we speak. I had no other choice, because I also have to return the car before I leave. Now, I must catch another train, but I'll have to wait at least for a week for cheap tickets . #Conv
{calm_down: Rita: I must be there within the next two days by any means, but I can't afford to chip away at my daughter's security deposit again... I'm sorry, you're trying to do your job and I'm just rambling about my problems.}#Conv
*(give_her_money){calm_down}[Give her ticket money.]
Noah: I will give you 2000 meridians that I have on me right now.
Rita: Oh, no, please! I won't take them, I'm too proud for that. I know you're way too underpaid for what you do, I can't accept them. #Conv
Noah: It's fine, these are bonus for some side work I've been doing, it doesn't affect my police salary. Just take them, you need them more than I do. #Conv
Noah sneakily hands Rita the money. Rita gets misty-eyed.
~ money = money - 2000

Rita: Thank you so much, this means the world to me ! I promise, I will send the money back to you as soon as I can. #Conv
Noah: If the government finds you moving money, you'll be lucky if they take just that. Better donate it to you than them. #Conv
Rita cracks a smile.
*["Sorry to hear that."]
Noah: I'm sorry to hear that. #Conv
Rita: What can you do... when it rains, it pours. #Conv

- Noah: Here is my number in case you have anything else to report.
Noah gives Rita his number.
Noah:{money == 8000: Have a safe trip and take care.|Take care.} #Conv
Rita:{money == 8000: Again, I can't thank you enough. With more people like you the world would be a better place.} I hope justice is served for Claudia... #Conv

->talk2others

= husband
Noah approaches the husband, who stands at the corner of the living room, looking overwhelmed.

Noah: Mr.Willford, I'm detective Noah Taulen. #Conv
* ["I'm sorry for your loss."]
Noah: I'm very sorry for your loss. I understand that this is hard for you, but could you walk me through the course of the events ? #Conv
Mr.Willford: S-Sure, just g-give me a second...
The man takes a deep breath.
-> husband_st
* (rude) [Start taking the statement.]
Noah: What time did you arrive home ? #Conv
Mr.Willford: Oh, right. Umm... #Conv
-> husband_st

= husband_st
Mr.Willford: It had to be around 23:20-23:30. Half an hour earlier, I got the call from Rita, our housekeeper and came as fast as I could. I was still at work. #Conv
* {rude} ["Were you working that late ?"]
Noah: Were you working that late ? #Conv
Mr.Willford: It is a pretty stressful period, I'm currently overseeing a few very demanding projects, so I'm often cooped up in my office until late hours for a couple of days now. The company's security staff can verify this, they keep a log of entries and exits. #Conv

Noah: Excuse my boldness, I just have to be thorough. #Conv
-> husband2

* [Ask about his way back home.]
Noah: Did you happen to notice anything unusual on your way back here, like any odd faces around the building ? #Conv
Mr.Willford: Nothing comes to mind. I wasn't really paying attention, in the state that I was. God, I wish I'd been here... Now I have to live with this guilt forever...#Conv

-> husband2


= husband2

{once:Claudia's husband looks out of place. }

* (gun) [Ask about the gun.]
Noah: I believe you're aware that a gun has been found on the scene. Was that your wife's possession ? #Conv
Mr.Willford: God, no, I... I have no idea where it came from. We never felt any need for guns, this is a safe district after all... or so I thought. She knew my distaste for guns, I don't want to believe she was keeping it hidden ! #Conv
Noah: Can you think of anyone that would want to cause harm to your wife ? #Conv
Mr.Willford: Not at all, she had no enemies. She was a very sweet person. Her reputation was remarkable, just ask senator Rosberg, she worked directly for him. #Conv

->husband2


* [Ask about the apartment's state.]
Noah: Did you happen to notice anything missing or out of place ? Anything at all ? #Conv
Mr.Willford: No, nothing looks different, I checked all of our belongings... I have to be honest, Claudia had been struggling with some personal issues for quite some time... #Conv
Mr.Willford: She went to doctors, took medication, but her depression wouldn't go away. I can't believe I'm saying this, but maybe she decided to put an end... #Conv

**[Ask about her depression.]
Noah: Pardon my nosiness, but what troubled your wife ? #Conv
Mr.Willford: Claudia was always somewhat melancholic, tracing back to her rough upbringing, bouncing between foster homes. #Conv
Mr.Willford: It's probably why she never felt comfortable in this lifestyle that we secured for ourselves, she never fit in these circles.
Mr.Willford: We also had a miscarriage a few years ago, and while it was really hard for both of us, I know that she never got over it... #Conv
-> husband2

**["Did you have any alarm system on ?"]
Noah: Did you have any alarm system on ? #Conv
Mr.Willford: We always set it off whenever we're here, so no... #Conv
-> husband2


* {TURNS_SINCE(->husband_st)>3}[Proceed with the investigation.]
Noah: Thank you for your time Mr.Willford, our team will proceed with the investigation. The officers will escort you to the police station for some procedurals. #Conv
Mr.Willford: I hate saying this, but I have a feeling she did this to herself. Not long ago, her shrink confided in me that she suffered from clinical depression and that there was a high risk for self-harming tendencies. #Conv
Mr.Willford: You can talk to Dr.Manuel Castello, I know I definitely will. His office is on Vinespring Heights 88. I hope he can help us get answers... #Conv
Noah: I will contact him. Again, my condolences, may she rest in peace. #Covn

Mr.Willford: Thank you... #Conv

-> talk2others


= inspection

{
    - not statements and TURNS_SINCE(->bedroom) == -1 && TURNS_SINCE(->living_room) == -1 && TURNS_SINCE(->kitchen) == -1 && TURNS_SINCE(->bathroom) == -1:
    Willford is escorted outside by officers and the commotion gradually quiets down as the crowd disperses. #old_city
    - else:
    {~Any corner of the house could reveal something.|It's as if two completely different people lived here...} #Thought
    
}

{statements:
    ~ visited_again = true
}


+ [Go to the bedroom.]
-> bedroom
+ [Go to the living room.]
-> living_room
+ [Go to the kitchen.]
-> kitchen
+ [Go to the bathroom.]
-> bathroom
* {not statements and crime_scene.bedroom and crime_scene.living_room and crime_scene.kitchen and crime_scene.bathroom} [End the inspection.]
I think I have enough for the time being. It's gonna be a long day tomorrow, better catch some sleep. #thought
Noah informs the remaining officers and heads home.
->police_station

* {statements} [Leave the house.]
-> statements.fourth_floor


= bedroom
The bedroom looks plain and austere. Across the bed hangs a large intriguing painting. By both sides of the bed are the couple's nightstands and across the bed stands a closet. There is also a slim French window, that leads to a small balcony.
+ [Inspect the bed.]
-> bed_inspection

+ [Inspect James' nightstand.]
-> james_stand
+ [Inspect Claudia's nightstand.]
-> claudias_stand
+ [Take a look at the painting.]
-> painting
+(platform)[Scan the balcony.]
Noah opens the window by pressing the button. A stunning view of the city below. About a meter and a half below the balcony and around a meter to the right, there is a scaffold-like platform. Between te scaffold and the balcony, the detective notices a few marks on the wall. 
{analytical > 2: Since there's no sign of forced entry, the only way someone could have broken in is if they used the platform to climb here and the window was unlocked.} #Thought
    **[Take a picture.]
    Noah takes a picture of the makrs next to the scaffold.
    ~evidence += scene_footprints
        ***[Back inside the room.]
        -> bedroom
    ++[Back inside the bedroom.]
    -> bedroom
+ [Search the rest of the house.]
-> inspection

= bed_inspection
The percale sheets are {statements:still} smeared with blood stains.{statements:At first glance, everything looks the same.}
{once:Underneath the bed, Noah discovers another bullet shell.}
{painting:That bullet shell could possibly explain the hole in the wall... But a second bullet rules out suicide in my book...} #Thought
+[Go back.]
-> bedroom

= painting
This painting seems to be a classic piece of artwork from the Early Renaissance.
It depicts a gathering of people socializing in a garden, with a matriarchal figure standing in the middle and a couple of winged human-like creatures messing around.
This looks like a {~Da Vinci|Michelangelo|Donatello} or something. {~Mom would be embarrassed that I have no clue...|I should have paid more attention in art class.| It looks like something from the Renaissance. That much I can tell...} #Thought
{once:Noah notices a small hole in the canvas.|There is a small hole in the canvas.}
{bed_inspection:Could this be linked to the shell {once:I just found }? A gun firing twice does not spell out suicide...} #Thought
+[Go back.]
-> bedroom 

= claudias_stand
On Claudia's nightstand there is a framed picture of her and her husband as a young couple on vacation. Next to it is {not statements:also a|still the} golden cross pendant.

{once:Looks like they had been happily together for decades. Still, a picture can't disprove anything. Besides, if she was a devout believer, she would have known that she had no right to take a life, not even her own...} #Thought

The stand also contains two drawers.
{statements: Something looks different...} #Thought
+ [Check the top drawer.]

{
    -inventory hasnt bible:
    There is a bible with a bookmark between the pages.
    Noah opens the bible to the marked page and notices a highlighted phrase : "And there is a second like it: 'You shall love your neighbour as yourself'."
    There is also a hand-written sentence next to the phrase. It says "This verse is the key". Above it, the detective reads another hand-written note: "43.013751713326705, -76.16350570108237, E. B.".
    -else:
    This is where the bible was being kept.
}
{inventory hasnt bible and (analytical >= 3 or versed >=3):These numbers look like coordinates, I should look this up. But what does E.B stand for ?} #Thought
{once:I wonder what the neighbors think of this... }#Thought

**[Take the bible.]
The detective decides to take the bible, in case it reveals something.
~inventory += bible
->claudias_stand

++[Go back.] 
-> claudias_stand

+ [Check the bottom drawer.]
{not statements:The bottom drawer is locked.|The bottom drawer has been opened.}
{statements:
Somebody has unlocked it since last night. Whatever Willford wanted was probably in here... 
} #Thought

{statements:
~ opened_drawer = true 
}

++[Go back.] 
-> claudias_stand

+[Go back.]
-> bedroom

= james_stand
Nothing is found on James' nightstand.
{claudias_stand:Not much of a sentimental guy, unlike his wife.} #Thought

+[Go back.] -> bedroom

= living_room
{not statements:There is an empty wine glass on the coffee table.|The coffee table has been cleared by the police.}
{not statements and crime_scene.bathroom: Who could have broken the other glass ?} #Thought
+ [Go back] 
-> inspection
= kitchen
{not statements:On the kitchen counter, Noah sees an opened bottle of red wine, but it's not empty.|The bottle of wine on the kitchen counter has been taken by the police.}
*(kitchen_sample)[Take a sample.]
Noah samples a few drops from the bottle.
~ inventory += cristina_wine_sample
~ cristina_sample = true

I'll send it to the lab to see {bath_sample:if it matches the bathroom stains|what makes chateau wine so special}. #Thought
**[Go back.]
->inspection
+ [Go back.]
-> inspection

= bathroom
The couple's personal kits can be seen at the sink. Next to the one that Noah presumes is Claudia's, there is an open pack of antidepressants.
Looks like she was taking her medication. Only the autopsy will tell... #Thought
{once: Noah takes a step and hears something cracking.}
{once: This looks like broken glass, just a few tiny pieces though. For how long has this been here...} #Thought
{not statements and (crime_scene.kitchen or crime_scene.living_room): She was either clumsy or she had wine company. } #Thought
* [Open the trash can.]
Inside tha can are more glass pieces and some red stained paper towels.
This doesn't look like blood. It could be wine though. #Thought
**(bath_sample)[Take a sample.]
Noah takes the towels and a few stained glass pieces.
~ inventory += claudia_wine_sample
~ claudia_sample = true
{kitchen_sample:This red liquid could be the wine. Maybe...} #Thought
***[Go back.]
-> inspection

+ [Go back.]
-> inspection

=== police_station ===
#background #police_station
~ day++
~ profiles += James
~ profiles += Rita
The following morning, Noah arrives at the police station later than usual.
Sgt.Jacobs: Rise and shine, Taulen. Ugh, you look like crap, better grab some coffee and get on the case. It's been turning a lot of heads since the word got out...  #Conv
Sgt.Jacobs: We reviewed the tape from the security camera in the entrance. Our software identified everyone who got in and out yesterday and all of them appear to be residents, so we don't have leads on any outsiders.
*["I don't think we're dealing with suicide."]
Noah: At this point I'm almost certain that we're looking for a suspect. #Conv
Sgt.Jacobs: That might be true, but you know there's a procedure. We also have to wait and see what the final autopsy will show. In the meantime you should pay attention to your findings for any clues, talk to people close to her and if you build a strong enough case, single out the suspects and interrogate them.#Conv
*[Ask about Garza.]
Noah: Is Garza OK? I don't see him here and haven't seen him for a couple of days now. #Conv
Sgt.Jacobs: He's fine, he had to take a few days off to deal with some family affairs down in Westerplain. He needs to take care of some assets now that his father has passed away but he'll be back by the end of the week. Which means you are taking over this case. #Conv
*[Ask about Daria Kozlov.]
Noah: This is off-topic, but a man came up to me in Vandergrift yesterday and told me about his missing niece, Daria Kozlov, around 13 I think. Could you see if there is a file on her in the system? #Conv
Sgt.Jacobs: We have current open cases to work on Noah, you know we can't be running errands for random people on the street! #Conv
Noah: Not an errand, allegedly there's been a report. She is an immigrant, that's
probably why they overlooked it. Please? #Conv
Sgt.Jacobs: Fine, I'll look it up if I have time, but you should focus on the Willfords. #Conv

-Sgt.Jacobs: I suggest you start off by finding the coroner, she might have formed some first impressions. Then you should go talk to neighbors, take more statements etc. Maybe check on the apartment again to see if you missed anything important. #Conv
Noah: I know my job, sarge. #Conv
-> examiner

== statements ===
#background #apartment_building
In the afternoon, Noah makes his way back to Stilton Avenue, 48.
A police car is parked on the street.
The entrance door is open and Noah sees Milton patrolling around the building.
Milton is a CM-25 android, who is assigned to the force and is specifically trained for the job, much like many other androids of that same model.
Milton: Hello detective. You can go inside, officer Johnson is guarding the apartment, ask us if you need anything. #Conv
Noah: Thanks Milton, I'll let you know. #Conv
-> fourth_floor

= fourth_floor
#background #hall
{
    - !(okamoto or richter or third_floor or second_floor or first_floor):
    He takes the elevator to the fourth floor and walks up to the officer.
    Noah: Hey Johnson, I came for some interviews and to check on the apartment. Any updates ? #Conv
    Officer: A lot of tension, you can imagine. Residents are upset, asking all sorts of questions. James Willford was brough here around 1:30 p.m. because he needed some stuff. #Conv
    *["Did they say anything interesting ?"]
    Officer: Some are very worried about their safety, others think it was suicide. #Conv
    Officer: The elder Asian lady in D1 said it's a shame, but the victim seemed clearly depressed. Another, younger lady, told me that the Willfords were a very happy couple and there is no way that the husband did it. #Conv
    Officer: She had to be in her mid-thirties and I think she had an Italian name. Pretty hot too, you might want to arrest her... #Conv
    Noah: Lucky for her, I'm engaged. #Conv
    -> fourth_floor
    
    *["What did he get ?"]
    Officer: A hard drive, which he needed for work. Maybe some clothes too, I'm not sure. #Conv
    -> fourth_floor
    
    - else:
    Noah returns to the hall of the 4th floor.
}
    
* [Knock on apartment D1.]
-> okamoto
* [Knock on apartment D2.]
->richter
* {TURNS_SINCE(->statements)>2}[Check on the Willford apartment.]
->crime_scene.inspection
+ [Take the elevator.]
->statements.elevator
*{statements.cristina && statements.elroy && statements.okamoto}[Check the time.]
-> statements.time

= richter
Maxwell Richter. Let's see.. #Thought
Noah rings the bell.
A minute goes by and nobody answers.
I don't hear anything, maybe they're not here. should I try again ? #Thought
* [Leave.]
-> fourth_floor
*[Ring again.]
Officer Johnson notices Noah waiting in front of the door.
Officer Johnson: I doubt they're here. Haven't seen anyone come in or out as long as I'm up here. You can ask Milton, maybe he saw them when he had this shift. #Conv
Noah: I will. #Conv
-> fourth_floor

= okamoto
The label on the doorbell says "Kenji/Hana Okamoto". Noah rings.
An elder Asian lady reluctantly answers the door.
Lady: Can I help you ? #Conv
Noah: Good afternoon, my name is Noah Taulen, I am a detective for the Stillfork Police Department. As you can imagine, I am here because of the sobering passing of Mrs.Willford. I would just like to ask a few typical questions, if it's no trouble. Mrs. Okamoto, right ?#Conv
Mrs.Okamoto: Yes, oh, it's so sad... We are all shocked. Poor sweet woman... By 22:30 I was already in bed. Nothing had come to my attention until the housekeeper alerted me, I then learned what happened. So tragic... #Conv
*(kenji_here)["Does anyone else live here ?"]
Noah: Pardon me, but I noticed that there are two names on the doorbell. Does anyone else live here ? Maybe they heard or saw something. #Conv
Mrs.Okamoto: My husband, Kenji, but he's not here. He's been out of town for a few days now, went to visit his daughter. I called him today and told him, he was lost for words! #Conv
-> okamoto2
* (okamoto_suicide) [Ask about Claudia.]
Noah: Were you ever under the impression that Mrs.Willford could be involved in any concerning conflict of interest ? #Conv
Mrs.Okamoto: I cannot even think about it! She was a kind and honest woman and she was part of a respectable social circle. Her own worst enemy though... #Conv
Noah: Do you have any reason to believe that this was self-inflicted ? #Conv
Mrs.Okamoto: Well, it's not for me to say. However, I know that she had been struggling mentally for a while and she was supposedly taking medication, I assume that her husband told you about it. #Conv
Mrs.Okamoto: I know this because she had opened up to me. It's not that we were close friends, but we lived next door for many years and we would have lengthier chats from time to time. #Conv
-> okamoto2

= okamoto2
Mrs.Okamoto: You know, I feel obliged to help as much as I can, but I should be going soon... #Conv
*[Ask her about James.]
Noah: Just another minute, I promise you. Were you aware of any tension between her and her husband ? #Conv
Mrs.Okamoto: Oh no, he is the last person who could have ever done that! Mr.Willford is a dignified man, he treated her like gold. #Conv
Mrs.Okamoto:The housekeeper was the one who found her though. #Conv
Noah: What do you mean ? #Conv
Mrs.Okamoto: Nothing, just stating a fact. Maybe she knows more than us... #Conv

**["Are you suggesting that she's involved ?"]

~statements_ += okamoto_blames_rita
Noah: Are you suggesting that she's involved ? #Conv
Mrs.Okamoto: No, I'm just trying to find an explanation. You just never know with these housekeepers. Friends have told me stories of them stealing, assaulting and more.
Mrs.Okamoto: Some of these people will do anything for 100 extra meridians. That's why we lease these programmed androids. #Conv
**["Did you talk to her ?"]
Noah: Did you talk to her ? #Conv
Mrs.Okamoto: Well, Mr.Richter informed us and we all gathered across the hall, so I didn't talk to her directly. Besides, I don't know her that much. #Conv

- I'm starting to think Ms.Stamopoulos didn't get a birthday card from her. #Thought
-> okamoto3
*[Ask her about other neighbors.]
->okamoto_neighbors

= okamoto_neighbors
{
   - not (okamoto_cristina or okamoto_richter):
Noah: I won't take up much of your time, trust me. From what I've heard, I presume the relations between residents are good. Is that the case ? #Conv
Mrs.Okamoto: Of course ! We do everything we can, collectively, to ensure a harmonious coexistence. In a few instances when people were frequently causing troubles, we managed to send them away. This is an exclusive residence, after all. #Conv
Mrs.Okamoto: Mrs.Willford was a class act and you won't hear anything negative about her. #Conv
}

*{statements.richter}[Ask about Richter.]
-> okamoto_richter
*{statements.cristina} [Ask about Cristina.]
-> okamoto_cristina
* {statements.elroy} [Ask about Isenberg.]
Noah: Was Mr.Isenberg familiar with Mrs.Willford ? #Conv
Mrs.Okamoto: Why do you ask ? There was not much of a relationship there, as far as I'm concerned. He is not a very approachable man, to begin with. I don't know many people here who are fond of him... #Conv 
-> okamoto_neighbors
* -> okamoto3

= okamoto_cristina
Noah: I understand that Ms.Artuso had ties with Claudia. Have you had the chance to talk to her since yesterday ? #Conv
Mrs.Okamoto: Yes, last night outside Claudia's apartment, everyone was there. No one could believe it, but she was especially crushed. They were relatively close in age, so they enjoyed each other's company. #Conv
~ statements_ += hana_saw_cristina

*["Did she share anything alarming ?"]
Noah: Did she share any alarming information ? #Conv
Mrs.Okamoto: We talked briefly. She worried that Claudia wasn't taking her pills lately and that could make her unpredictable. #Conv
->okamoto_neighbors

*["Did she talk to Mr.Willford ?"]
Noah: Did she talk to Mr.Willford ? #Conv
Mrs.Okamoto: I don't know, she hadn't talked to him when I saw her, maybe she did later... #Conv
->okamoto_neighbors

= okamoto_richter
Noah: Would you happen to know by what time your neighbors in D2 are usually home ? Just asking to save some time in case they'll be late. #Conv
Mrs.Okamoto: I can't really help you with that. You see, he's a prolific scientist, always busy with academic matters. #Conv
-> okamoto_neighbors


= okamoto3
Noah: Well, I think I have enough for now, so i'll let you- #Conv
A sudden thud is heard from a room far down Mrs.Okamoto's hall.
Mrs.Okamoto looks startled.
*["Are you sure you are alone ?"]
-> okamoto_rude1
*["Is everything alright ?"]
-> okamoto_home

= okamoto_rude1
{
    - not okamoto_home: 
Noah: Are you sure you are alone ? #Conv
Mrs.Okamoto: I'm not a liar, of course I am alone. My cat knocked something down again, I'll have to take care of it. I hope I helped, excuse me now, take care. #Conv
~ okamoto_suspicion++
    - else:
Noah: I just noticed this male coat over there. If your husband is here, I need to speak to him as well. #Conv
Mrs.Okamoto: I just told you nobody else is here! I think that's enough, I would like for you to leave. #Conv
Mrs.Okamoto: This behavior is very inappropriate and I shall notify your superiors, good night! #Conv
~ okamoto_suspicion++
}
Mrs.Okamoto {okamoto_home: escorts Noah outside and} closes the door abruptly.
{okamoto_home:I must keep an eye on her|That was odd}. #Thought
-> fourth_floor

= okamotos_painting
Noah: Excuse me, I got a glimpse of that large painting you have. I'm very interested in Renaissance art. What is that ? #Conv
Mrs.Okamoto: Oh, it's 'Virgin of the Rocks' by Da Vinci. It's an AI-generated replica, as close to the original as you will ever find. Needless to say, custom made and very expensive. #Conv
Mrs.Okamoto: I'm surprised you're not familiar with it, since you're an art enthusiast. #Conv
Noah: Well, I've only dipped my toes, but I learn as I go. Anyway, that will be all, thank you for your time and help. #Conv
He sips some water and leaves Mrs.Okamoto's place.
-> fourth_floor


= okamoto_home
Noah: Is everything alright ? #Conv
Mrs.Okamoto: Ah, yes, it's just my cat, she must have knocked something down again. I'll have to go check, excuse me for a moment. #Conv
*[Wait by the doorstep.]
Noah waits quietly on th doorstep. A couple of minutes later, Mrs.Okamoto returns.
Mrs.Okamoto: Sorry, I had to check on the cat. Indeed, she knocked over a knitting box, as per usual... #Conv
Noah: Tell me about it, I used to have one too. Anyway, that will be all, thank you for your time and help. #Conv
He sips some water and leaves Mrs.Okamoto's place.
-> fourth_floor

*[Take a quick look inside the living room.]
-> okamoto_inspection

= okamoto_inspection
An imposing room, decorated with carefully preserved Japanese pre-war antiques. A large painting stands out, depicting a man posing in a formal military uniform. There's also an android put on sleep mode inside its chamber at the corner of the room. Other than that, there is a  French door, leading to a large balcony.
{analytical > 3:The balcony is right under Claudia's window, maybe it can reveal a clue or two. This woman is eccentric though, I should probably hurry and check out the balcony first, before she comes back.}
* (portrait)[Look at the painting.]
It's a large portrait of a severe man, posing proudly. He is in his forties, give or take.
This is a commander's uniform from the war, but he's no ally. He wears the red colors and the insignia of the Rising Force. The federation ostrasized them after the war for crimes against humanity, why the hell would these people openly celebrate the Force... #Thought
Above the painting, a commemorative sword is horizontally placed on display.
    **[Look elsewhere.]
    
    ~mins_in_okamoto += 2
    -> okamoto_inspection

* (balcony)[Walk towards the balcony.]
Noah presses the button and the French door opens automatically. Being built on the Stilton hill, this spot provides an overlook for the entire city and offers a scenic, panoramic view.
Looking right above, the detective notices a few marks, sort of evenly placed between Claudia's bedroom balcony and the balcony he's currently standing on. There is also {crime_scene.bedroom.platform:the scaffold the detective saw yesterday.|a multi-layered platform to the right, presumably a construction scaffold.}
    **[Take a picture.]
    The detective takes a picture of the unusual marks on the wall outside.
    They look like footprints, I wonder how long they have been there. {crime_scene.bedroom.platform && analytical>3:It seems like someone has been using the scaffold as a platform to move between balconies.} #Thought
    ~inventory += okamoto_footprints
        ***[Go back inside.]
        
        ~mins_in_okamoto += 4
        ->okamoto_inspection
    **[Go back inside.]
    
    ~mins_in_okamoto += 3
    -> okamoto_inspection
*(android) [Look at the android.]
{versed > 3:This is an RP 7 Household. It's an outdated model, no longer supported. In fact, they've been banned for commercial use due to the Digital Sentience and Civil Rights Protection Act that was voted recently. Hana Okamoto doesn't strike me as the person who got the memo...} #Thought

~mins_in_okamoto += 2
-> okamoto_inspection

It could mean nothing, but who knows. #Thought
*(coat)[Keep looking around.]
Noah spots a coatrack with a male's coat on it.
{okamoto.kenji_here:Her husband went on a trip in the middle of December without a coat ?|That's a rad coat... Old fashioned but classy.} #Thought
-> okamoto_inspection

* {mins_in_okamoto >= 5} ->okamoto_leaving

= okamoto_leaving
Mrs.Okamoto: Excuse me, are you looking for something ? #Conv
Hana returns and is deosn't look pleased to find the detective wandering around the living room.
*{okamoto_inspection.portrait}[Compliment the painting.]
-> okamotos_painting
*{okamoto_inspection.coat}[Confront her about the coat.]
-> okamoto_rude1
*{okamoto_inspection.balcony}[Mention the imprints outside.]
Noah: Pardon me, but I suffer from vertigo and I needed some fresh air. As I stood on your balcony, I noticed some marks on the exterior that looked a lot like footprints. Are you aware of what I am referring to ? #Conv
Mrs.Okamoto: Ah, the footprints. I believe you saw the large scaffold as well. You see, we contacted the city planning commission in order to have some parts of the building renovated. It's an old building, after all, it is high time we did it. What you saw is clearly some constructor's footprints. We've complained before, because they sometimes do messy work, as you saw, but it is what it is.#Conv
{observant > 4:Plausible answer, she didn't flounder either. Although, it's the longest response I've gotten from her, as if she really tries to convince.|Shout out to the commission.} #Thought

    **{versed>4}["Constructors don't leave footprints on walls." (Versed > 4)]
    Noah: I happen to know people in construction, they are especially instructed to not step on the property, they also have the right equipment to avoid doing so. Besides, these jobs are now predominantly assigned to androids, who are not programmed to take these kinds of liberties. #Conv
    
    ~XP+=20
    Mrs.Okamoto: You know so much detective, don't you ? Maybe you should also know that the local government oversees this renovation, since this building is of great historic significance and the local government prioritizes on giving jobs to humans, hoping to combat those record numbers on poverty. You can ask Mr.Richter or Ms.Artuso too, if you'd like. #Conv
    The irony in Hana's voice shows some clear irritation.
    She clearly lost her cool. #Thought
    -> okamoto_leaving
    
    **[End this conversation.]
    Noah: Right, I see. #Conv
    ->okamoto_leaving
    

* {okamoto_inspection.android}[Ask about the android.]

*[Leave.]
-> fourth_floor





= third_floor
Noah {once: goes|returns} to the hall of the 3rd floor.
* [Knock on apartment C1.]
-> END
* [Knock on apartment C2.]
-> END
* [Knock on apartment C3.]
-> cristina

+[Take the elevator.]
->statements.elevator
*{statements.cristina && statements.elroy && statements.okamoto}[Check the time.]
-> statements.time

= elevator
+{TURNS_SINCE(->fourth_floor) > 0}[Go to the 4th floor.]
->fourth_floor
+{TURNS_SINCE(->third_floor) > 0}[Go to the 3rd floor.]
->third_floor
+{TURNS_SINCE(->second_floor) > 0}[Go to the 2nd floor.]
->second_floor
+{TURNS_SINCE(->fourth_floor) > 0}[Go to the 1st floor.]
->first_floor

= first_floor
Noah {once: goes|returns} to the hall of the 1st floor.

*[Knock on apartment A1.]
->statements.not_here
*[Knock on apartment A2.]
->statements.not_here
*[Knock on apartment A3.]
->statements.elroy
+[Take the elevator.]
-> statements.elevator
*{statements.cristina && statements.elroy && statements.okamoto}[See what time it is.]
-> statements.time



= cristina
Cristina Artuso, must be the Italian... #Thought
Noah rings the bell.
An attractive young woman opens the door.
Woman: Hi, are you looking for someone ? #Conv
Noah: Miss Artuso ? Hello, detective Noah Taulen, I work for the Stillfork P.D. I'm just taking some statements regarding the unfortunate passing of Mrs.Willford. #Conv
-> cristina2

= cristina2
{ once: Cristina: God, yes, that's me. I still refuse to believe it, I didn't sleep last night.} #Conv
*["When did you last see Mrs.Willford ?"]
Noah: When did you last see Mrs.Willford ? #Conv
Cristina: I think it was this past Sunday. I ran into her right outside on the street, I was returning from my morning jog as she was about to attend mass. We caught up quickly and then went our separate ways. #Conv
Cristina: We had a laugh and she was in a great mood. Who could've imagined... #Conv

**["Was she religious ?"]
Noah: It's rare to see such devotion ever since the war ended. Was she religious ? #Conv
Cristina: Well, that's the impression she gave. Ugh, I hate to talk like this, she was a dear friend, I had a great rapport with her and her husband, since they were the closest to my age, it's just... #Conv
Noah: What do you mean ? #Conv
Cristina: It saddens me so much to consider the possibility that she could do this to herself and it would also contradict her faith and morals. And Mr.Willford wouldn't touch a hair of her head, I assure you. I don't know anyone who would, really. #Conv
Cristina: Unless someone broke in... The entire neighborhood is really worried ! #Conv
Cristina: Do you have any leads, detective ? We have the right to know whether we're safe or not ! #Conv

***["You are safe."]
Noah: There is no need to panic, we found neither signs of trespassing nor indication of stolen property. At the moment, we focus on the profile of the Willford household. You have every reason to feel as safe as before, this is a well-protected neighborhood. #Conv

-> cristina2

***["You need to be cautious."]
Noah: I'll be honest with you, we don't have enough evidence yet to claim suicide. We're still waiting for the medical report and we're currently re-examining some ambiguous spots in the scene. #Conv
Noah: Meanwhile, the security cameras outside of the building showed that only residents came in and out yesterday. Obviously, I'm not implying you should fear your neighbors, just keep an eye out for unusual faces or behaviors. #Conv

~ cristinas_interest = significant

-> cristina2

***["We don't know yet."]
Noah: It's too early to proceed with any claims and it would be unprofessional of me to mislead you. As soon as we have concrete evidence, you will be informed. In the meantime, you don't have to worry. You live in a safe neighborhood, this incident was an anomaly. #Conv

~ cristinas_interest = mild

-> cristina2

**["Was she alone ?"]
Noah: Was her husband with her ? #Conv
Cristina: No, he is not really a church person. Not that it matters, they respected each other's identity.
Cristina: I've witnessed them enough as a couple. In fact, when I first moved here, they quickly welcomed and befriended me and we would often have lunch or dinner on weekends. They had an endearing relationship... #Conv
-> cristina2


*[Ask her about yesterday.]
Noah: Since you happen to live right below the Willfords, did you hear or sense anything odd yesterday ? #Conv
Cristina: In hindsight, yes ! I went to bed early, as I usually do after 10-12 hours at the office. At some point, a sudden thud woke me up, but I didn't think much of it and went right back to sleep. #Conv
Cristina: It wasn't until Mr.Richter notified us that I woke up for good. But that's all I'm aware of. I'm telling you, the realization of being a few meters away from someone getting shot is chilling... #Conv

    **[Ask if there was anyone else here.]
    Noah: Was there anyone else in your apartment yesterday ? At this stage, any statement we can get is valuable. #Conv
    Cristina: No, just me and I live here all by myself. Regardless of what really happened, I can't help but feel insecure. #Conv
    Cristina: On behalf of all the residents, I kindly request that a police car patrols the block until the case closes. #Conv
    Noah: There is still work to be done, so we'll be here, don't worry. #Conv
    -> cristina2

    **["What time did you come home ?"]
    Noah: What time did you come home ?
    Cristina: Umm... around 8:30-8:45 approximately. Like I said, typically long hours at work. I've been told you have access to the security camera's recordings, isn't that right ? #Conv
    Noah: Of course. I'm just following the protocol. #Conv
    
    {cristinas_interest < significant:
        ~ cristinas_interest++
    }
    -> cristina2
*{TURNS_SINCE(->statements.cristina)>5} ["Did you talk to Mr.Willford today ?"]
Noah: Did you talk to Mr.Willford today ? #Conv
Cristina: Of course. I knew he had to evacuate his house for a few days, due to the investigation, so I called him, first thing in the morning. I should visit him, but I haven't mustered the courage yet. #Conv
Cristina: He is completely dazed. One moment, he's zoned out and two minutes later he bursts into tears. Who can blame him... #Conv
-> cristina2
* {TURNS_SINCE(->statements.cristina)>0} [Learn about the neighbors.]
-> cristina_neighbors

* -> cristina3

= cristina_neighbors
{once:Noah: Are there other neighbors that know the Willfords well ?} #Conv
{once:Cristina: Sure, most people have been living here for a decade at least, so we get to know each other rather well. However, we mostly tend to maintain our privacy.} #Conv
{once:Cristina: You know, these highly ranked districts are usually home to older and wealthier people who can be quite uptight. That being said, me and the Willfords had a lot in common, so I probably know them a bit better.} #Conv
*{statements.okamoto} [Bring up Mrs.Okamoto.]
Noah: Mrs.Okamoto and her husband live right next to them. I imagine they know them well too. #Conv
Cristina: Of course, they've lived here longer than anybody. They got along great, but due to the age difference they had more a formal relationship. #Conv

**{okamoto_suicide}[Mention Mrs.Okamoto's statement.]
Noah: I talked to Mrs.Okamoto earlier and she seemed pretty convinced that Mrs.Willford gave an end to her life. She also mentioned that Mrs.Willford would confide in her occasionally. Would all that be accurate ? #Conv
Cristina: Well, I know she was taking medication for her anxiety. You know, during the war, her parents were wanted and had to flee the country, leaving her in an orphanage. #Conv
Cristina: That was not an easy childhood and I think that trauma affected her until now. I just don't want to believe this... #Conv
Cristina: As for her conversations with Mrs.Okamoto, I wouldn't really know. They lived one door apart, I'm sure they had the opportunity to chat here and there... #Conv 
Noah: It sounds like you don't talk to Mrs.Okamoto much. #Conv
Cristina chuckles nervously.
Cristina: We're just very different people. Maybe it's a cultural or generational thing, probably both. She's one of those uptight people I mentioned before. Of course I'll talk to her if we run into each other, it's nothing personal. #Conv
***{okamoto_rude1}["She was abrupt with me."]
Noah: She was rather abrupt with me too. I pointed out that I heard a noise from one of her rooms and she took it personally... #Conv
Cristina: I see. She may be severe, but it's been a difficult day for all of us here, everybody deals with it differently. #Conv


{cristinas_interest < significant:
    ~ cristinas_interest++
}

->cristina_neighbors

* {statements.elroy} [Bring up Mr.Isenberg.]
Noah: Did Mr.Isenberg know Mrs.Willford well ? #Conv
Cristina: Oh, no, I wouldn't say so. I doubt they would say anything more than a typical greet. Besides, Mr.Isenberg isn't exactly the friendliest person here. He doesn't like anyone. #Conv
->cristina_neighbors

***["Some people can be difficult."]
Noah: Sure, some people can be difficult. #Conv
Cristina: Indeed. #Conv
->cristina_neighbors

**[Mention Mr.Okamoto]
->cristina_kenji

=cristina_kenji
{
    -kenji_here:
Noah: Do you see Mr.Okamoto often ? #Conv
Cristina: Not as much. He's very old and sits in a wheelchair. He doesn't leave the house often. #Conv
Noah: Huh. Mrs.Okamoto told me that he went to visit his daughter this past week. Seems like too much trouble for an elderly disabled person. #Conv
Cristina: Obviously he didn't go on his own. His daughter probably came and picked him up, she has done it before. It's good for him to change environment once in a while. Is it me or are you a little overly suspicious, detective ? #Conv
Noah: Pardon me, I just want to be thorough. #Conv
{cristinas_interest < significant:
    ~ cristinas_interest++
}

    
    -else:
Noah: Do Mr and Mrs.Okamoto have children ? #Conv
Cristina: Mr.Okamoto has a daughter from a previous marriage, she lives outside the city, I don't remember where exactly... Together, they don't have children though. #Conv

}
->cristina_neighbors


* -> cristina2


= cristina3
Noah: Well, that will be all for now, thank you. #Conv
{
    - cristinas_interest != none:
Cristina: At least, it's quite comforting to see that you're very much hands-on, Mr.Taulen. Can I have your number in case I have to call you to report anything new ? #Conv
Noah: Sure, you can reach me in my office through this number. #Conv
Noah sends Cristina his office number.
Cristina: That's great. If I may, could I also reach you on a private number ? I understand that you spend many hours away from the office due to the nature of the job. #Conv
    - else:
Noah: Here is my office number in case you have any new information. #Conv
Noah sends Cristina his office number.
Cristina: Alright, i'll keep that in mind, rest her soul. Take care, detective. #Conv
}
*{cristinas_interest != none}[Give her your number.]
Noah: Normally, I shouldn't, as I'm allowed to do this only under specific protocol, but given the circumstances, you may call me on this number, only if really necessary. #Conv
Cristina: Thank you, detective, I appreciate it. I hope you can figure this out, in the memory of dear Claudia... #Conv

*{cristinas_interest != none}[Decline formally.]
Noah: I'm sorry, but at this stage I'm not allowed to share that information. If you don't find me in my office, you will automatically be transferred to our AI assistant and I will contact you as soon as possible. #Conv
Cristina: You know better, I suppose. Anyway, thank you for your service, may Claudia rest in peace... #Conv
Taulen, you nasty heartbreaker... #Thought


 - A fine, fine lady, Johnson was right for once. She mostly made sense. I guess... #Thought
 
 -> third_floor


= second_floor
Noah {once: goes|returns} to the hall of the 2nd floor.

*[Knock on apartment B1.]
->statements.not_here
*[Knock on apartment B2.]
->statements.teenage_boy
*[Knock on apartment B3.]
->statements.not_here
+[Take the elevator.]
-> statements.elevator
*{statements.cristina && statements.elroy && statements.okamoto}[Check the time.]
-> statements.time

= not_here
The bell says "Richard Henderson". Noah rings.
Nothing happens.
*[Ring again.]
Noah rings again. Still, no answer.
**[Go back.]
->second_floor

* [Go back.]
->second_floor

= teenage_boy
Noah rings.
Nothing happens.
*[Ring again.]
Noah rings again.
A very well-dressed teenage boy opens the door.
Boy: Good evening sir, are you looking for somenone ? #Conv
The tone of his voice sounds unnaturally mature for his age.
*["Are your parents home ?"]
Noah: Hello there. Are your parents home ? #Conv
Boy: They're absent at the moment. Is this about Claudia's death ? #Conv
Noah looks startled.
Noah: Yes... I'm detective Noah Taulen, detective in the Stillfork P.D. Would you mind answering a few questions ? #Conv
*["I'm here for the investigation of Mrs.Willford's passing."]
Noah: Hello, I'm detective Noah Taulen, detective in the Stillfork P.D. I'm here for the investigation of Mrs.Willford's passing.
Noah: I'd like to ask a few questions, but I could come back another time when your parents are h- #Conv

 - Boy: No, please I will help you do your duty. #Conv
 Noah: Ok... How did you find out about the incident ? #Conv
 Boy: Mr.Richter notified us last night around 23:30. He told us that Mrs.Willford had been shot and instructed us to keep calm. He always takes care of the rest of us, I fondly look up to him. #Conv
 * ["How old are you ?"]
 Noah: Before we continue, how old are you ? #Conv
 Boy: I am 14 years old, but I don't see how that relates to our conversation. #Conv
 Noah: I'm sorry, I'm just impressed by how articulate you are for your age. #Conv
 Boy: Language reflects the person's mind. The more one challenges their mental boundaries, the more their linguistic skills expand, in order to be able to express the newly grasped concepts, and vice versa. #Conv
 
 * ["Were you in front of him telling your parents ?"]
 Noah: Were you in front of him telling your parents ? #Noah
 Boy: He called our house on the telephone. My parents talked to him and then told me directly. I understand that she was found shot in the head, lying on her bed. # Conv
 The boy's cold stare concerns Noah.
 
 -  This kid is acting weird... #Though
 
 *["Did you know Mrs.Willford ?"]
 Noah: Did you know Mrs.Willford ? #Conv
 Boy: Certainly. She always insisted on treating me like a child, whereas I always conducted myself as her equal. It bothered me to an extent, I must confess. #Conv
 Noah: What do you mean ? What was she like ? #Conv
 Boy: Mrs.Willford was different. In an ever changing world, her beliefs stagnated into an old point of view. If only she had embraced the change, she would still be here. #Conv
 
 **(maximus)["You're not making any sense !"]
 Noah: You're not making any sense ! What's your name ? I'd like to talk to your parents, right now. #Conv
 Maximus: There's no need to get agitated, detective. My name is Maximus. I fail to understand why you are so eager to talk to my parents instead of me, but I will deliver the message. #Conv
 Maximus: You shall hear from us soon... #Conv
 
 **["Do you know something ?"]
 Noah: Do you know something ? #Conv
 Boy: I only know that solely her poor judgment led her to this. You can call it weakness or freedom of choice. #Conv
 How can this kid talk like that... #Thought
 
 **[Walk off.]
 Noah gets creeped out by the boy and walks off.
 
  - As he moves away, he notices {maximus:Maximus|the boy} smirk.
  
-> second_floor

* [Go back.]
->second_floor

= elroy
"Elroy Isenberg". Will he be any help ? #Thought
Noah rings the bell.
A man's tense voice is heard, coming from inside.
Man: What do you want ? #Conv
Noah: I'm detective Noah Taulen, sir, currently investigating the death of Claudia Willford. I would like a minute of your time. Mr. Isenberg, correct ? #Conv
The man opens the door hesitantly.
Noah sees a frowning, yet simple and ravaged man, probably around his late sixties. He also appears to have a bionic right eye.
Mr.Isenberg: Yes... #Conv

*[Ask him about the incident.]
->elroy_interview

= elroy_interview
{TURNS_SINCE(->statements.elroy) < 2:
Noah: What can you tell me about last night's unfortunate events ? #Conv
Mr.Isenberg: Hell if I know ! I was just preparing a chamomile, when all of you arrived. Normally, I don't stuck my nose where it doesn't belong, but I knew it had to be somethin'. #Conv
Mr.Isenberg: Anyways, after ten minutes, I decided to walk up them stairs, where I found a couple officers who told me what happened. It was quite the shock, I tell you.#Conv
Mr.Isemberg: I gave 'em some kind of statement and headed straight off for a walk. Had to clear my damn mind... #Conv
}
*["Did you hear a gunshot ?"]
Noah: Did you hear a gunshot ? #Conv
Mr.Isenberg: At some point, I heard a whomp, not too close, but not that far away either. I was pretty sure it was a gunshot, I know one when I hear one, but I didn't know what to think of it. #Conv
Mr.Isenberg: Hardly a minute went by and I heard that sound again. At that moment, I started suspectin' that somethin' was goin' on. #Conv
Mr.Isenberg: See, someway or another, you learn to mind your own damn business around these places, so I decided to ignore it. I should've followed my instinct, maybe I could've done somethin'... #Conv
Mr.Isenberg: That being said, the way most rich people tend to sort things out is none of my concern and I want no part of it ... #Conv

**["You've given it a lot of thought."]
Noah: Sounds like you've given it a lot of thought. #Conv
Mr.Isenberg: You don't make it through them trenches without learnin' how to think. That war cost me an eye as you see, so I guess I should've learned even sooner. #Conv

***[Mention your mechanical arm.]
Naoh: I happen to have a mechanical left arm, so I understand. #Conv 
Mr.Isenberg: Yeah, I figured. If I may, how'd you get it ? I'm sure you didn't even exist during WW3. #Conv

{elroys_trust < significant:
    ~ elroys_trust++ 
}
****[Tell him.]
Noah: An operation during my second year in the force, chased a few guys all alone in a warehouse. One of them distracted me and the other hit me with a shotgun. #Conv
Noah: Lucky for me, backup arrived soon. To your point, not thinking straight cost me an arm. #Conv
Mr.Isenberg: Those of us who lost part of ourselves have an outlook on life that nobody else understands. I respect that, kid. #Conv

{elroys_trust < significant:
    ~ elroys_trust++ 
}
->elroy_interview

****[Continue with the interview.]
Noah: I'm afraid this is not relevant to our interview. #Conv
Mr.Isenberg: Right, the "interview"... #Conv

{elroys_trust > low:
    ~ elroys_trust-- 
}
->elroy_interview

***["Why have that battlefield mentality in your house ?"]
Noah: Why would you carry that same battlefield mentality in your house ? #Conv
Mr.Isenberg: I don't know what you're implying about me, kid, but you're only gettin' colder. It's something that stays forever. #Conv 

{elroys_trust > low:
    ~ elroys_trust-- 
}
->elroy_interview

**["That is a cynical thing to say."]
Noah: That is a cynical thing to say. #Conv
Mr.Isenberg: During the war, I saw things that you, young people and these white collar jerks wouldn't believe possible. Life made me cynical, I didn't ask for it. #Conv
Mr.Isenberg: You think I'm not aware of how corrupt the cops are ? Especially when they can get bought off generously by rich sociopaths in cases like this ! I've been around the block, kid, I know how the world works. #Conv

***[Talk back.]
Noah: I don't know where that came from and I certainly won't be disrespected like that while I do my duty ! If you know something, you're free to spit it out right now. #Conv
Mr.Isenberg: I know nothing, it's just a feeling... #Conv
-> elroy_interview
***[Try to calm him down.]
Noah: I don't know what it is about me that gave you that impression, but as you see I have an artificial part too. I lost my arm on duty trying to catch some scumbags, I know what it means to stand for something. #Conv
Noah: I'm also aware about police corruption, but I'm looking at you straight in the eye, asking for your help. Do you have any suspicions ? #Conv
Mr.Isenberg: I'm sorry, I flew off the handle. I have a prejudice against certain things, based on experience. You seem okay. #Conv
Mr.Isenberg: I know nothing for a fact, I'm just being wary... #Conv

{elroys_trust < significant:
    ~ elroys_trust++ 
}

-> elroy_interview

*["Didn't you talk to your neighbors ?"]
Noah: Didn't you talk to your neighbors ? We're talking about a deceased person that you all knew here... #Conv
Mr.Isenberg: Hey, everybody reacts differently ! I needed some air. Besides, I have my reasons not to like them. #Conv
Noah: What do you mean ? #Conv
Mr.Isenberg: I don't really want to get into it. The people living in the floors above have formed a clique. They look down on anybody else, forget the nice act. #Conv
Mr.Isenberg: One time, years ago, I found out about a weird gathering they had in that big chamber, on the 5th floor. The next day, I jokingly asked Okamoto why I hadn't been invited and she told me off. #Conv
Mr.Isenberg: She told me that I was indiscreet and how that was a private gathering etc. #Conv
Mr.Isenberg: From that point on, they were all cold to me, and a week later they tried to kick me out of here for "not standing for the standards and values of the building". We had a big argument and agreed to stay out of each other's business for good. #Conv
-> elroy_neighbors

= elroy_neighbors
** {statements.teenage_boy} [Ask about the mysterious boy.]
Noah: Do you know the family who lives in B2 ? I had strange interaction with the teenage boy. #Conv
Mr.Isenberg: The Edisons ? Typical old money descent, unapproachable people. From what I understand they also have interesting views on race... #Conv
Mr.Isenberg: They sure messed that boy up. They've been grooming him to their standards ever since he learned how to walk. Used to be somewhat of a normal kid, but now he's finally transformed. #Conv
->elroy_neighbors
** {statements.okamoto} [Ask about the Okamotos.]
Noah: I understand that you're not very fond of Mr.and Mrs.Okamoto, right ? #Conv
Mr.Isenberg: We don't exchange birthday cards, that's for sure. Hana acts as if someone appointed her in charge of the building, she is a manipulative woman. Heard she estranged her husband from his daughter, just so you understand. #Conv
Mr.Isenberg: As for her husband, Kenji, he is an enigma. I know that he used to be a highly decorated commander. He even reached the rank of Brigadier General within the alliance of the Rising Force, during the big war. #Conv
Mr.Isenberg: I heard that during the historic post-war trials, he made a deal with the New Republic to testify against his former comrades in exchange for immunity. #Conv
Mr.Isenberg: Only the New Republic could cater to an opposing war criminal so well, but I digress... #Conv
Mr.Isenberg: Anyway, when I first moved here, he was still relatively healthy, so I would see him here and there. #Conv
Mr.Isenberg: An old, severe man of few words. Ever since his health started deteriorating, he gradually withdrew from the outside world. I haven't seen him in years. #Conv
->elroy_neighbors
** (elroy_cristina){statements.cristina} [Ask about Cristina.]
Noah: What do you think of Ms.Artuso ? #Conv
Mr.Isenberg: I don't know what it is about her, but it makes me skeptical. She moved here ten years ago, or so. She'd only been in her mid-twenties, so I was surprised that she could afford this place. #Conv
Mr.Isenberg: Back then, she acted friendly and you could tell that she was trying to fit in this environment, while still being an outsider. She wasn't into the overall snobbishness here. #Conv
Mr.Isernberg: Time went on, she got in the clique and became just like the rest of 'em. She now avoids talking to me, too. She seems like an opprtunist.#Conv
-> elroy_neighbors
** {TURNS_SINCE(->statements.elroy) >2}["Were the Willfords part of this ?"]
Noah: Were the Willfords part of this "clique" ? #Conv
Mr.Isenberg: Sort of. I know James is, even though he's been more diplomatic than the rest. He holds a powerful position at Ichor, of course he'd be involved in this elitist gang. #Conv
Mr.Isenberg: I guess Claudia was a part of it too, just by association. She didn't act like the others though, far more genuine. #Conv

-> elroy_neighbors

** -> elroy_interview

* (sunday_mass) ["When did you last see Mrs.Willford ?"]
Noah: When did you last see Mrs.Willford ? #Conv
Mr.Isenberg's expression gets gloomier.
Mr.Isenberg: Saw her about 10 days ago at the Sunday mass. She was a regular attendee and a firm believer. I, on the other hand, had been out of touch with religion for most of my life. #Conv
Mr.Isenberg: I only recently started trying it out again. Whenever I would go, I would see her and we would sit, pray and maybe chat for a while. Her devotion inspired me, to be honest. #Conv
Mr.Isenberg: That's why I was a bit surprised to not see her this past Sunday, she rarely missed mass. Even that time when she had sprained her ankle pretty badly, she still attended on crutches. #Conv
{statements.cristina: That's weird... Artuso told me she saw her coming from church this Sunday.} #Thought
Mr.Isenberg: The way she used to talk about life showed that she had a bright outlook. I don't believe she did this to herself. #Conv
{statements.cristina or statements.okamoto: That's interesting... The first one to openly say that.} #Thought

**{statements.cristina}["Are you sure she wasn't at the mass ?"]
Noah: Are you sure she wasn't at the mass ? #Conv
Mr.Isenberg: Absolutely. Generally, only a few people come, so I can clearly see their faces. #Conv

-> elroy_interview

**["Did she tell you anything alarming ?"]
Mr.Isenberg: Nothing really personal, we weren't all that close. Just casual conversations, mostly of spiritual nature. Although, I understood that something was stressing her out lately... #Conv

-> elroy_interview

*-> elroy_leave

= elroy_leave
Noah: Alright, I think that's enough, thank you for your time. #Conv
Noah: One last thing... You seem to disown the lifestyle of your neighbors, still you live in a similarly expensive apartment. If I may, what did you do for a living ? #Conv
Mr.Isenberg: Cop, such as yourself. Made it to Lieutenant, actually. Obviously, I'd never have been able to afford this. It was my wife's family home, rest her soul... #Conv

*[Go back.]
-> first_floor

= time
{visited_again == false: If I leave now, I'll be just on time to pick up Emily.|Crap ! I lost track of time, Em is probably waiting. I'm off. -> sergeant_call.claudia_update}

*[Keep investigating.]
{
    - TURNS_SINCE(->first_floor) ==1:
    -> first_floor
    
    - TURNS_SINCE(->second_floor) ==1:
    -> second_floor
    
    - TURNS_SINCE(->third_floor) ==1:
    -> third_floor
    
    - else:
    -> fourth_floor
}

*[Head off to the airport.]
->sergeant_call.claudia_update

=== dr_castello ===
#background #shrink
The two detectives arrive at Dr.Castello's office early, before his daily business starts picking up. A refined and elegant assistant greets them in the lobby.
{
    - partner == "Johnson":
    Johnson whispers in Noah's ear.
    Johnson: Is this place snotty or what... #Conv
    
    It's no secret that Johnson isn't known for his tact in certain settings.
    
}

Assistant: Dr.Castello will see you now. #Conv
Noah: Thank you. #Conv

Walking into the office, they see the doctor, a chic, sophisticated bald man dressed in dark blue and gray, around his late fifties, by the looks of it.

Dr.Castello: Good morning gentlemen, please have a seat. Can I get you anything to drink ? #Conv

* ["We're fine, thank you."]
Noah: We're fine doctor, thank you. #Conv
Dr.Castello: As you wish. Let me know if you change your mind. #Conv

* (castello_strict) ["We're here strictly for police business."]
Noah: We're here strictly for police business, doctor. #Conv
Dr.Castello: I'm sorry, I didn't mean to undercut the importance. I'm just trying to be polite. #Conv

- Noah: Detective Taulen, we spoke on the phone earlier this morning and this is my partner, officer {partner}. What can you tell us about Mrs.Willford ? #Conv

Dr.Castello: What a grim tragedy... I'm still numb to my core. In this line of work, dealing with a patient over an extensive period of time generates quite an emotional investment. Of course, there are professional boundaries, but at the end of the day we're human beings. #Conv
-> dr_castello_questions

= dr_castello_questions
{once:Dr.Castello: You know... Being her therapist, the news of her passing took a significant toll on me. A person is paying me to help them sort their life out and this happens... To a degree, I can't help but contemplate whether I could have done more for her.} #Conv

*[Ask about Claudia.]
Noah: What can you tell me about Mrs.Willford ? How would you describe her as a person ? #Conv
Dr.Castello: I shouldn't get deeply into it, because I have to ensure my client's privacy, even if she's now deceased,{confidential_2 or confidential_1:like I previously mentioned}. #Conv
Dr.Castello: All in all, Mrs.Willford was a very gentle person. She struggled with trust issues, which I believe root back to her rough upbringing, but I dare to say that we made great progress on that during our sessions. #Conv
Dr.Castello: At some point, she started volunteering and that seemed to give her a sense of fulfillment. Mrs.Willford had already turned to religion before she started therapy, but once she became a volunteer in the community, her devotion got stronger. #Conv
Dr.Castello: I also recommended she started writing a journal, in order to express her thoughts and feelings. Soon enough, she would write everything down. In her words, it felt cathartic. #Conv
Dr.Castello: Such a shame, all that progress she made... #Conv
-> dr_castello_claudia


*(claudia_ill)[Ask about their last interaction.]
Noah: When was the last time you spoke to Mrs.Willford ? #Conv
Dr.Castello: It was the Friday before the incident. We had a scheduled appointment that day and she called in the morning to cancel due to illness. #Conv
-> dr_castello_questions

*["How did you find out ?"]
Noah: When I contacted you, you said that you had already been informed. How did you find out ? #Conv
Dr.Castello: Well, I saw the news the day right after the incident, initially. Obviously, she wasn't mentioned by name, but the description made me suspicious. #Conv
Dr.Castello: I called her personal number a few times, but it was out of service. That worried me even more, so I decided to call her house, but it would go to voicemail. #Conv
Dr.Castello: I finally decided to try and reach her husband. I made up an excuse to call him, a rescheduled appointment with his wife. He answered my call and gave me the news. #Conv

**["How did he sound ?"]
Noah: How did he sound during that call ? #Conv
Dr.Castello: Obviously, it was uncomfortable, I assume he was still in a state of shock. That being said, he also seemed a little detached, which is not uncommon for a person in deep distress. #Conv
Dr.Castello: Anyway, he briefly told me what she did to herself, we concicesly touched on the seriousness of depression and then he thanked me for the work I did with her. #Conv
Dr.Castello: Lastly, I offered to recommend a colleague of mine in case he seeked professional help, but he politely declined for the time being. #Conv

***["There's no other explanation."]
Noah: There is not enough evidence for other plausible explanations. #Conv
Dr.Castello: I understand, I just don't want to justify self-harm... #Conv 
-> dr_castello_questions

*** (confidential_1)["Why didn't you offer your services ?"]
Noah: Why didn't you offer your services ? #Conv

{
    -partner == "Milton":
    
    Milton: According to the doctor's oath, it would be unethical of him to discuss personal matters shared by Mrs.Willford with members of her family. #Conv
    Dr.Castello: Exactly. #Conv
    Huh... Way to go, officer. #Thought
}
    Dr.Castello: It would be immoral from my side to exchange private information between family members of formed clients. Everything they choose to share in here is confidential by oath. #Conv
-> dr_castello_questions
    
***["Did he explicitly tell you it was suicide ?"]
Noah: Did he explicitly tell you it was suicide ? #Conv
Dr.Castello: He said it was a self-inflicted gun wound, he found the gun right next to her hand. I sensed acceptance in his voice, like he feared that this day might come. #Conv

****["We have yet to issue any finding in the case."]
Noah: Just to be clear, the police have yet to issue any finding in the case. #Conv
Dr.Castello: My goodness ! Are you implying that Mrs.Willford could have been murdered ? #Conv

*****["We're not allowed to discuss this."]
Noah: We're not allowed to discuss ongoing cases with the public. #Conv
Dr.Castello: Sorry, I understand. Poor woman... #Conv
-> dr_castello_questions

*****["No, we just abide by the formalities."]
Noah: No, we just abide by the formalities. #Conv
-> dr_castello_questions
**** (confidential_2)["So, he didn't have questions ?"]
Noah: So, he didn't have any questions ? I assumed he would be begging his wife's therapist to provide answers as to her motives behind something like this. #Conv
Dr.Castello: No, he didn't. I was quite surprised, too. Maybe he's still processing what happened. Obviously, it would put me in a tough position, because I'm not allowed to discuss about my patients, but I see your point. #Conv
-> dr_castello_questions

*->castello_exit

= castello_exit

{partner}: {partner == "Milton":Detective, I shall notify you about other pending appointments for today.|Boss, sorry to interrupt, but we might be running a little late.} #Conv
Noah: Right... We have to get going. Thank you for your time, doctor. You gave us a lot to think about. #Conv
Dr.Castello: It's my obligation, detective. I hope I didn't give you a hard time with my answers, but it's really difficult to speak on behalf of a client, let alone a deceased one. #Conv
Dr.Castello: I sincerely hope you get to the bottom of it. #Conv
Noah: Thank you. Please call us if you have anything else to share. #Conv

{
    -time_of_day == morning:
    -> next_move
    -else:
    -> side_activity
}


= dr_castello_claudia
*{observant>2}[Mention the cross on her nightstand.]
Noah: During the apartment inspection, I noticed a cross pendant and a bible on her nightstand. Was she really that faithful ? #Conv
Dr.Castello: Absolutely. A serious health scare she had years ago made her turn to religion. It seemed to me like she possesed all the virtues of a firm believer. #Conv
Dr.Castello: Most of the time, she almost had an apologetic manner of conversing. #Conv

**{analytical>3}["Doesn't her religion condemn suicide ?"]
Noah: Doesn't her religion condemn suicide, though ? How could such a devoted person commit the "unforgivable sin" ? #Conv
Dr.Castello : You've raised a very poignant question, detective. Truth is that the urges of the id can be strong enough to completely take over the ego. #Conv
Dr.Castello: In other words, when something triggers our subconscious enough, we can make the most irrational decisions. #Conv 
Dr.Castello: It is true though, that, based on her behavior never alarmed me. Makes you think... #Conv
-> dr_castello_claudia

**["What kind of health scare ?"]
Noah: What kind of health scare ? #Conv
Dr.Castello: An abrupt end to a pregnancy, which also caused her further complications. There was a slight chance that she wouldn't make it, but she did. That seemed to be a spiritual awakening for her. #Conv
-> dr_castello_claudia

*{observant>3}[Mention the absence of a suicide note.]
Noah: Interestingly enough, she didn't leave a note, as far as we can tell. Usually in this kind of case, the victim leaves a note, explaining the reasoning behind their decision. #Conv
Dr.Castello: Undoubtedly, but, I'm sure you know, that isn't always the case. It depends on the person, their introversion and how they assess their social circle. #Conv
-> dr_castello_claudia


*["Anything that worried her in particular ?"]
Noah: Anything that worried her in particular ? Something that we could look into ? #Conv
Dr.Castello: I understand that you're probably looking for a straightforward alibi, but I don't have an answer. She had stated multiple times that she would often feel alienated inside her own home. Some things about her way of life bothered her. #Conv
-> dr_castello_claudia_2

*->dr_castello_questions

= dr_castello_claudia_2
*["People ?"]
Noah: Certain people ? #Conv
Dr.Castello: She never named people explicitly, she was very discreet. To my knowledge, she happened to surround herself with people who she didn't find genuine and who could not earn her trust. She wouldn't elaborate any further.#Conv

    **["Her husband ?"]
    Noah: Her husband ? #Conv
    Dr.Castello: In her words, she didn't feel comfortable with how much her husband's choices influenced hers. Of course, that alone couldn't possibly incriminate Mr.Willford. #Conv
    -> dr_castello_claudia_2
    
    **["Her friends ?"]
    Noah: Her friends ? #Conv
    -> dr_castello_no
    **["Her neighbors ?"]
    Noah: Her neighbors ? #Conv
    -> dr_castello_no
    **["Her colleagues ?"]
    Noah: Her colleagues ? #Conv
    -> dr_castello_no



*["Regrets ?"]
Noah: Did she share any regrets ? Life choices that burdened her ? #Conv
Dr.Castello: I shouldn't really indulge you by answering such questions, as these are simply my assessments and I cannot speak on Mrs.Willford's behalf. #Conv
Dr.Castello: With that in mind, I can say that she had expressed the desire to make a fresh start in life. #Conv

    **["Leave her job ?"]
    Noah: You mean, leave her job ? #Conv
    Dr.Castello: Possibly, but I don't think this was a top priority. She was referring to more personal reasons. #Conv
    -> dr_castello_claudia_2
    
    **["Leave her husband ?"]
    Noah: Like, leave her husband ? #Conv
    Dr.Castello: I can neither confirm nor deny this. I would appreciate it if you didn't come to hasty conclussions by yourself, detective. #Conv
    {observant > 4:Dr.Castello's stance got defensive and his tone became abrupt.}
    {observant > 4:He's trying to distance himself from this hypothesis, it probably means I'm right...} #Thought
    -> dr_castello_claudia_2

*-> dr_castello_claudia_2

= dr_castello_no
Dr.Castello: As I just mentioned, she never accused anyone, specifically. If that were the case, I would have told you so from the beginning. #Conv
-> dr_castello_claudia_2

=== mr_richter ===


= meet_richter
~time_of_day = night
{  
    -time_of_day == morning:
    #background #richters_home
    
    The detective decides to visit Mr.Richter at his house, as the professor preferred. Along with his partner, he is once again right next to the scene of the crime as they stand outside Maxwell Richter's apartment.
    
    
    -else:
    #background #uni
    The detective finds the time to locate Maxwell Richter's office at the university, where he teaches. As the sun is almost set, he and {partner} are standing right in front of the door. 
    
}

* [Ring the doorbell.]
Half a minute goes by and a man opens the door. The man, quite small-boned, with a receding hairline and a ginger goatee easily gives a silly first impression.
Noah: Mr.Richter, I suppose. Good {time_of_day ==morning:morning|evening}, sir, my name is Noah Taulen, I'm the detective assigned to the homicide investigation regarding Claudia Willford. #Conv
{
-time_of_day == morning:
Mr.Richter: Oh, of course, I'm sorry to have kept you waiting, gentlemen. Please, come inside. #Conv
Despite his funny appearance, he speaks in a very eloquent and polite manner.
Mr.Richter: I would offer you a beverage or a snack, but I forgot to go for groceries and I'm out of everything ! I've been a little scatterbrained over these last few days, my apologies. #Conv
{partner}: {partner == "Milton":Don't worry sir, it's fine|I should have gotten that espresso machine...} #Conv
{partner == "Johnson":The detective gives a strict judgemental look at Johnson.}
{partner == "Johnson":Johnson: Just kidding... } #Conv

-else:
The professor's tone seems aggressive.
Mr.Richter: I'm sorry detective, I was under the assumption that you would visit me at my house, I thought I made that preference clear to your supervisor. #Conv
**[Apologize.]
Noah: My apologies, professor. Upon arriving, we asked the front desk about your schedule and they told us that you'd be currently available during your office hours. #Conv
Mr.Richter: I just find it inappropriate to draw such negative attention in my workplace ! Besides, knowing why you are here is going to make the students and the rest of the faculty members uncomfortable. Did you tell them the reason you wanted to see me ? #Conv

***["Yes."]
Noah: We are policemen entering a campus, we were obliged to inform the staff in charge here about our reason of visiting. #Conv
The professor looks concerned by the detective's answer.
Mr.Richter: I don't think this was the proper way to handle it. People talk and my name could be viewed in an unfavorable light, through no fault of my own. #Conv
->richter_questions

***["No (Lie)."]
Noah: No, we respected your right to privacy. #Conv
Mr.Richter: Good, I think it is for the best. #Conv
->richter_questions

***["Why is this your main concern ?"]
Noah: With all due respect, I assumed that you would be more concerned about the mysterious death of your next-door neighbor and less about our presence here. #Conv
->richter_questions

**{audacious >= 4}[Don't apologize. (Audacious)]
-> richter_dont_apologize

}

= richter_dont_apologize

{ -try(audacious,7) == true:
    ~ audacious++
    Noah: Sir, we're police detectives assigned to solve a serious case within a limited time frame, we can't abide by everyone's preferences. After all, this is your next door neighbor's death we're talking about. #Conv
    The professor slightly mellows his tone. 
    Mr.Richter: Excuse me, this is your job, indeed. You just caught me by surprise. #Conv
    -else:
    Noah wasn't expecting this reaction. He's trying to find the words to defend his position.
    Noah: The same questions you will answer here, you would have answered at home, don't worry. #Conv
    Mr.Richter: I'm not fond of your attitude, detective. #Conv
}
->richter_questions

= richter_questions
{
    - time_of_day == morning:
    {once:Although clean, his apartment appears to be considerably loaded. Bookshelves stocked with heavy books, Expensive showpieces contained within thick hyperglass cases and walls full of awards and distinctions adorn his living room. }
    - else:
    {once:Mr.Richter: In any case, I'd rather get through with this. What do you want to know ?} #Conv
}
*(when_richter_saw_her)["When did you last see Mrs.Willford ?"]
Noah: When did you last see Mrs.Willford ? #Conv
Mr.Richter: Just the day before it happened ! Monday evening, I ran into her in front of the entrance door of the building. I was returning home after a lecture just as she was coming back from work. We made some small talk on our way up and that was it. #Conv
Mr.Richter: One day you're there, chatting with a familiar face and the next day they're gone ! It feels frightening. So surreal... #Conv  

**["What did you talk about ?"]
Noah: What did you talk about ? #Conv
Mr.Richter: Nothing of substance, really. Common courtesy stuff, a bit about the weather, joking about the upcoming elections for a minute, that's it. #Conv

** (time_back_from_work) ["What time was that ?"]
Noah: And what time would that be ? #Conv
Mr.Richter: Somewhere around 8 to 8:30 p.m. Pretty typical for the both of us, we've ran into each other plenty of times around the same hour. #Conv

-- Mr.Richter: Goes to show you, she was still following her routine up until it happened. Who could have imagined... #Conv

{dr_castello.claudia_ill: Castello said she cancelled her appointment because she was sick. Had she gotten better by Monday ?} #Thought

-> richter_questions

* (richter_saw_her_ok){time_back_from_work && dr_castello.claudia_ill}["Did she mention being sick ?"]

~ XP += 10
Noah: Did she mention being sick during the last few days ? #Conv
Mr.Richter: No, she didn't. Unless you're referring to her mental condition. I mean, I'm not the kind of person to gossip, I detest it, actually. #Conv
Mr.Richter: However, word had gotten around that she would be moody behind closed doors. #Conv
Mr.Richter: But I digress, she seemed alright, physically speaking. #Conv

-> richter_questions

* (tuesday_night)["Where were you on Tuesday night ?"]
Noah: Mr.Richter, where were you on Tuesday night ? #Conv
Mr.Richter: I was right here at home, unfortunately. I was peacefully working on a reseearch until late at night, when the girl who worked for the Willfords rang my doorbell and told me what she had just seen. #Conv
Mr.Richter: From there on, we were anxiously waiting for the police to arrive... #Conv

    **{analytical >= 3}["How come you didn't hear the gunshot ?"]
    
    ~ analytical ++
    
    
    Noah: Since you live right across their door, I would assume that you should've heard the gunshot. How come you didn't ? #Conv
    Mr.Richter: Well, as I told you I was focusing on my research up until that point. As I often do, I secluded myself deep into my soundproof office. That's the only way to make sure I won't get distracted. #Conv
    {observant >= 5: His verbal flow is on point, but the detective senses a careful choice of words here. [Observant > 4]}
    -> richter_questions
    
    **["What time would that be ?"]
    Noah: What time would that be, Mr.Richter ? #Conv
    Mr.Richter: Around 23:00, I seem to recall. What the housekeeper was doing here so late is beyond me... #Conv

        ***[Say nothing.]
        The two men stand looking at each other rather uncomfortably.
        -> richter_questions
        
        ***["What are you implying ?"]
        Noah: What are you implying ? #Conv
        
        ~ statements_ += richter_blames_rita
        Mr.Richter: I've never seen the housekeeper here past 20:00. I just can't help but wonder if she could have anything to do with it. #Conv
        
            ****["Why would she ?"]
            
            Noah: Why would she ? #Conv
            Mr.Richter: I just can't suspect anyone else, and I know this is probably crazy. In order to have access into the building, an outsider should carry an official authorization by a resident of the building. If Claudia was killed by another third party, that would mean that the act was either carried out or authorized by another resident. #Conv
            Mr.Richter: Obviously, that is nonsensical. We've all been neighbors for years, we know and get on with each other pretty well. Absolutely nothing to divide. #Conv
            Mr.Richter: One should be very careful with the outsiders they hire, thought. These human housekeepers, especially, very untrustworthy. Ever since the humanoids started replacing the lower classes in these types of jobs, these people have gotten so much more desperate. You hear it on the news all the time ! #Conv
            
            -> richter_questions

    ** ["Are you working that late ?"]
    Noah: Are you working that late at night, Mr.Richter ? #Conv
    Mr.Richter: Most certainly. Us academics have some strange habits, no matter how many degrees or accolades we might have under our belt, we never stop studying, it's our obligation. #Conv
    
    -> richter_questions

* {statements.teenage_boy} [Mention the odd boy's statement.]
Noah: I spoke to the boy on the second floor and he told me you informed them around 23:30, is that correct ? #Conv
Mr.Richter: Yes, his name is Maximus. When Claudia's housekeeper came to me, she was clearly in a state of shock. Therefore, I took it upon myself to alert the residents. #Conv
Mr.Richter: This tragedy must have scarred this little boy, I'm very sorry for him. He's such a good and bright kid, too. #Conv

    **["He clearly looks up to you."]
    Noah: From our brief interaction, I can tell that he's looking up to you. How's that ? #Conv
    Mr.Richter: I've been one of the oldest residents here, along with his family. Along the way I've managed to earn peoples' trust and I assume they view me as some sort of mentor, especially the younger ones, like Maximus. #Conv
    Mr.Richter: Like I mentioned, he's a remarkable boy and I want him to reach his full potential. This is why I've been tutoring him outside of school hours, free of charge, of course.#Conv
    
        ***{rhetor>4}["He's deceptively smart for his age."]
        Noah: He is deceptively smart for his age. How do you expain that ? #Conv
        Mr.Richter: He's been under the right guidance, studying the right material. His parents are truly remarkable, well-educated people, with their hearts and minds in the right place. #Conv
        Mr.Richter: They have been nurturing their boy to become a strong, intelligent and virtuous man, a true "Götzenbild". Having a great relationship with the family, I've also encouraged him to read works of some of the great classic Western philosophers. #Conv
        
        {rhetor >= 4:"Götzenbild"... That's a term used by the underground circles of the "Sunlight", the radical reformist party that's been gaining a lot of momentum as of late.} #Thought
        -> richter_questions
        
        *** -> richter_questions


    **(richter_upset)["I think you mean creepy."]
    Noah: I think you mean creepy. That kid is way too distant and cynical. Even his speech pattern sounds nothing like a child at his age. Honestly, I'm worried about him. #Conv
    Richter's face suddenly becomes stern. 
    Mr.Richter: So, you would rather he thought and spoke like every other illiterate and ignorant child in the suburbs ? This rotten system has failed our children terribly and, unfortunately, it is up to us individually to set them straight. #Conv
    Mr.Richter: If a pragmatic, rational, intelligent young man is "creepy", detective, I'm sorry for you. #Conv
    
    -> richter_questions
    
* {tuesday_night and (cristina_not_there or hana_saw_cristina)} ["Did you see Ms.Artuso that night ?"]
Noah: Did you see Ms.Artuso that night after the incident ? #Conv
Mr.Richter: Of course I did ! She was right there with the rest of us on standby. It was especially really hard for her, you know, she was a friend of the Willfords. #Conv

~statements_ += richter_saw_cristina

-> richter_questions

* {time_of_day == night} -> door_buzz

* {time_of_day == morning} -> richter_leave

= door_buzz

The sudden sound of the door buzzer disrupts the conversation. 
Mr.Richter: Excuse me for one moment, gentlemen. #Conv
The door opens and a young man enters the office.
Young Man: Professor, we've run into a complication during the experiment. Subject No.5 appears to be presenting unprecedented data. I think you should see for yourself. #Conv
Mr.Richter: Gentlemen, could you excuse me for a few minutes ? My team is conducting a crucial experiment, which requires real time readjustments. I'm heading down to the lab for a few minutes and I'll be back in no time, if you don't mind. #Conv
Mr.Richter: Of course, we could also arrange to resume our conversation at a later time, to the convenience of everyone. #Conv

* [Wait for him.]
Noah: It's alright, we have some time to spare. Go about your business and we'll wait here. #Conv
Before leaving with the doctorate student, the professor sighs, momentarily.
Noah: {partner}, I have something in mind. I want you to stand guard outside the office, while I take a look around. #Conv
{partner}: {partner == "Johnson": You smelled bullcrap too, right ?|But we don't have the right to do.} #Conv
Noah: {partner == "Johnson":Let's just say he caught my interest.|He seemed overly defensive at times, I just want to make sure. This case is an unfair fight, if we want results, we'll have to hit under the belt.} #Conv
-> inspect_office

* [Leave.]

-> richter_leave

= richter_leave
{
    -mr_richter.inspect_office:
    Noah: It's alright professor, actually, we figured out that we have everything we need, so we should be leaving. Again, we're sorry if we bothered you at an inappropriate time. #Conv
    Mr.Richter: It's okay, I was just caught off guard. I hope I helped. #Conv
    The two men leave Richter's office and finally call it a day.
    - time_of_day == morning:
    Noah: Alright, I think we have everything we need for now, which means that we should be going. Thank you for your time, Mr.Richter. #Conv
    Mr.Richter: Well, then, I hope I was of some use. I wish you well, gentlemen. # Conv
    The two men leave the house, reviewing everything he told them.
    
    -else:
    Noah: In fact, I think we have erything we need for the time being. Thank you for your time, professor, and sorry for our unexpected visit here. #Conv
    Mr.Richter: It's okay, I was just caught off guard. I hope I helped. #Conv
     The two men leave Richter's office and finally call it a day.
}

{
    -time_of_day == day:
    -> next_move
    -else:
    -> side_activity
}

= inspect_office
#background #office

{
    - mins_in_richters_office < 30:
    The detective is left alone inside the office as his partner is on the lookout for the professor, right by the doorstep.
    -else:
    Suddenly, {partner} nods, as footsteps signal someone approaching the office. They both get everything back in position as quickly as possible, leaving no trace behind. A few moments later, the professor returns in the office.
    Mr.Richter: I'm sorry to have kept you waiting for so long, gentlemen. My team is carrying out a crucial project and I had to supervise them to make sure we avoid any errors. #Conv
    
    ->richter_leave
}



*[Check the computer.]
-> richter_computer

+[Check the drawers.]
-> richter_drawers

+[Check the desk.]
-> richter_desk

= richter_desk
A cup of coffee, some organized paperwork and a small box of office supplies.

+[Look at the paperwork.]
"Bio-Mechanical Fusion: Interdisciplinary Approaches in Enhancing Human-Machine Integration"
Looks promising... #Thought

++[Keep going through the papers.]

{~"Beyond Humanity, The Convergence of Biology and Technology in Next-Generation Biomechanical Engineering"|"Synthetic Symbiosis: Advancements in Bio-Mechanical Interfaces for Human Enhancement"}

{~He really seems into this subject.|Do they carry out such experiments here in the university ?} #Conv

~mins_in_richters_office += 2
+++[Leave the papers.]
-> richter_desk

++[Leave the papers.]
-> richter_desk

-> inspect_office
*[Look inside the box.]
Batteries, paperclips, toner cartridges and digital pens, all thoroughly organized.


{(observant >= 4 or handyman >=4) and richter_drawers.tried_to_open :I could shape one of these paperclips into a makeshift lockpick.} #Thought

{(observant >= 4 or handyman >=4) and richter_drawers.tried_to_open:Noah takes one of the paperclips.}

{
    -(observant >= 4 or handyman >=4) and richter_drawers.tried_to_open :
    ~ found_pick = true
    ~inventory += clip
}

~mins_in_richters_office += 5
-> inspect_office

+[Look elsewhere.]
-> inspect_office


= richter_computer
Noah sits in front of the computer and tries to log in. However, it requires a password.

{inventory has tracker:Could I use the gadget that Troy gave me ?} #Conv
* {inventory has tracker} [Try Troy's device.]
The detective connects the gadget to the computer's port. After a few seconds it logs him in.
{
    - handyman > 3:
    Noah's computer knowledge comes in handy and allows him to execute the right commands and back up every file from the computer.
    Noah: Done. I'll dive into that whenever I get the chance. #Conv
    
    ~mins_in_richters_office += 5
    ~ evidence += richters_comp
    
    -> inspect_office
    
    - partner == "Milton":
    The detective realizes he has little to no idea how to use the device.
    Milton's neuron model is trained on some of this stuff, he might be able to do this. #Thought 
    Noah tells Milton and they swap places. Indeed, the humanoid officer figures it out rather quickly and retrieves the files, as requested.
    Milton: The entire drive is succesfully retrieved, detective. #Conv
    Noah: You may not always get my jokes, but I wouldn't trade you for anyone. #Conv
    The officer cracks a subtle smile.
    Noah: We need to take a close look at these files later. #Conv
    
    ~ XP += 10
    
    ~ evidence += richters_comp
    ~ mins_in_richters_office += 7
    -> inspect_office
    
    - else:
    The detective realizes he has little to no idea how to use the device.
    Noah: Johnson, do you have any coding experience ? #Conv
    Johnson: Sorry boss, I'm more of a street smart kind of guy. #Conv
    With a disappointed look on his face, the detective sigh and moves away from the computer.
    Noah: Dammit. I felt the itch to check that computer. I've lost quite some time, better hurry and look elsewhere. #Conv
    ~ mins_in_richters_office += 3
    
    -> inspect_office
    
}

*[Look elsewhere.]

~mins_in_richters_office += 1
-> inspect_office

= richter_drawers
{&Under the professor's desk there are three drawers.|The detective senses something intriguing about the drawers.|No sign of the professor just yet.}

+[Open the first drawer.]
Inside the first drawer, Noah finds a laser pointer, a couple sets of hyperactive contact lenses and a box of Abmenthal pills.
{versed >= 2: Abmenthal... well-known stimulus for augmented concentration and lucidity. Banned by the Administration a few years ago due to proven severe risk of psychotic episodes. We could literally be dealing with a mad scientist. } #Thought

~mins_in_richters_office += 2
-> richter_drawers

+[Open the second drawer.]
Just disk logs of students' dissertations.
~mins_in_richters_office += 2
-> richter_drawers

+(tried_to_open)[Open the third drawer.]

{
    -found_pick == false:
    This one is locked.
    - jammed == true:
    The detective jammed this lock.
    -else:
   -> third_drawer
}

{found_pick == false and (handyman>=3 or stealthy >= 4):If I could only find a very thin piece of metal or something similar, maybe I could pick the lock.} #Thought
{found_pick == false and partner == "Johnson": I think Johnson is quite handy with these things.} #Thought

**{(handyman>=3 or stealthy >= 4) and found_pick == true}[Try lock-picking. (Handyman > 6 or Stealthy > 8)]

{
    -try(handyman,5) == true or try(stealthy,7) == true:
        Through precise and delicate hand movements, the detective manages to unlock the drawer.
        ~ XP += 20
        ~mins_in_richters_office += 5
        
        -> third_drawer
        
    -else:
    A sudden, awkward move causes the object to get stuck inside the lock.
    Crap ! I jammed the lock. I thought I had this... I don't have time to fix it. #Thought
    ~ jammed = true
    -> richter_drawers
}

**{partner == "Johnson"}[Tell Johnson to take a look.]
Noah silently beckons to Johnson.
Noah: I have an itch to unlock this drawer. I've heard you're good at this stuff. #Conv
Johnson: You've heard right, my grandpa was an old-fashioned locksmith, back when people mostly had solely mechanical doors in their houses. I picked up a thing or two. #Conv
Johnson plucks a hairpin from his jacket pocket and starts messing with the lock, while the detective discreetly stands guard in his place. 
Johnson: Done. This handsome devil never misses ! #Conv
~ found_pick = true
Noah goes over the drawer to take a look.
~mins_in_richters_office += 7

-> third_drawer

**[Leave the drawer.]

~mins_in_richters_office +=1
-> richter_drawers

+[Leave the drawers.]

~mins_in_richters_office += 1
-> inspect_office

= third_drawer
Inside there are a few more cases of pills, each one labelled under a different color.
There is also a weathered notebook.

+ [Open the notebook.]
Evey page is marked by a date and consists of three columns. The first one is filled with two-letter acronyms, the second one has certain keywords, like the name of a color, and the third one is just a number.
{analytical >= 6:Looks like a log to keep track of his pills, but who would take so many of them ?} #Thought

++ [Leave the notebook.]

~mins_in_richters_office += 4
-> richter_drawers

**[Keep flicking backwards.]
The same pattern keeps on going page after page.
Instinctively, the detective stops at December 8th, the day of Claudia's death.
"J.P. -- Blue -- 5", "C.A. -- Red -- 2", "T.R. -- Green -- 8"
{sly >= 4 or observant >= 3:Seems like the professor has been dealing drugs right under the university's nose...} #Thought
{observant >= 4: C.A... Cristina Artuso ? Maybe I'm just getting paranoid.} #Thought
    
    ***{rogue>=5}[Steal one pill of each.]
    Noah quickly stashes one pill from every label.
     ~inventory+= red_pill
      ~inventory+= green_pill
       ~inventory+= blue_pill
    Let's see what this guy is cooking... #Thought
    
    ~mins_in_richters_office += 5
    ->richter_drawers
    
    ***{observant >= 4}[Steal one "Red" pill.]
    
    ~inventory+= red_pill
    
    Noah wraps one red-labelled pill and puts it in his pocket.
    This seems far-fetched, but I have to know... I'll drop these off to Mia tomorrow. #Thought
    
    
    ~mins_in_richters_office += 4
    
    -> richter_drawers
    
    *** [Return to the drawers.] 
    
    ~ mins_in_richters_office += 2
    ->richter_drawers
    

=== pick_up_em ===
-> examiner_update

=== examiner_pill_update ===
~day_gave_pills = Next_Wednesday
Minutes before Noah takes his clothes off, he receives a call from the coroner.
Mia: I have news about the red pill you brough. It's rather creepy. #Conv

*["What is it ?"]
Noah: What is it ? #Conv
-> red_pill_reveal

= red_pill_reveal
Mia: The red pill is astrecamine.{claudia_sample: The same substance we found in the wine specimen from the victim's bathroom|It is used as a sedative, rarely prescribed anymore due to its unpredictable and dangerous behavior}. #Conv

~ evidence += pill_is_astrecamine
    
    *{claudia_sample}["You're kidding me."]
    Noah: You're kidding me. #Conv
    Mia: I swear I'm not. It looks like you're on to something. #Conv
    Mia: In fact, a single one of these contains considerably more than the lethal dosage, roughly around the same dosage I found on the bathroom specimen. #Conv
    
    *{claudia_sample}["I had a gut feeling about this pill."]
    Noah: I had a gut feeling about this pill. #Conv
    Mia: You were right. There's definitely a connection here. #Conv
    Mia: In fact, a single one of these contains considerably more than the lethal dosage, roughly around the same dosage I found on the bathroom specimen. #Conv
    
    *{(!claudia_sample) and cristina_sample} ["I see."]
    Noah: I see. #Conv
    Mia: I don't know what that professor is using them for, but there are tons of other options on the market that are far more accessible and safer. I'm sure he knows that. #Conv
    
    - Noah: Alright, thank you, Mia. I'll see where this leads me. #Conv
    { evidence ? (pill_is_astrecamine) and claudia_sample:Was Claudia buying this stuff from Richter ? Or could he have been in Claudia's apartment that night ? } #Thought


-> next_move
=== examiner ===
{once:The following morning, Noah walks into the coroner's laboratory.}
*[Talk to the medical examiner.]
Noah: Good morning, Mia. Any interesting findings regarding the Willford case ? #Conv
Examiner Peng: Good morning, Noah. Quite a few, actually... #Conv
Examiner Peng: First of all, the blood tests indicated a regular dosage of Citalopram, Escitalopram and Fluoxetine, which points out that Claudia was still taking her medication. #Conv

    **["That should rule out suicide."]
    Noah: That should rule out suicide. #Conv
    Examiner Peng: Wait, there is more. #Conv

    **{crime_scene.bathroom}["I thought so."]
    Noah: I thought so, too. I saw a pack of her medication on the bathroom stall, it was half-empty. #Conv
    Examiner Peng: Yes, by the levels we found in her blood, we figured that she had to be taking the medication normally, until the last couple fo days, at least. #Conv

    -- Examiner Peng: We also noticed a few bruises that started to form during the night that we found her. As you can see here, it's not just one spot. I don't know that happened, but I can tell you from experience that these are no accident... #Conv

    Noah: Yet no apparent signs of forced entry. But someone had to be there... #Conv
    Examiner Peng: I am no detective, but either someone knew how to slither their way in, or you might want to have another talk with the husband. #Conv
    Examiner Peng: In any case, you can see here that Claudia was shot right above the left eyebrow, near the temple. Not only is it very uncommon for someone to shoot themselves this way, but also, if that were the case, the proximity of the gun would have inflicted a much different wound. #Conv
        Noah: Makes perfect sense. #Conv
        
        ->examiner

*{inventory has shell or inventory has claudia_wine_sample or inventory has cristina_wine_sample} [Show the examiner your findings.]
-> examiner_clues

*->
Noah leaves the lab.
-> statements


= examiner_clues
Noah: {Anyway, I found some stuff you might want to take a look at.|Actually, I have something more to show you.} #Conv
*{inventory has shell}[Show the second bullet shell.]
Noah: I noticed this empty shell right by the bed, a second bullet was fired and hit the bedroom wall. It's becoming clear to me that we're dealing with attempted murder. #Conv
Examiner Peng: Let me see... #Conv
The medical examiner takes a closer look at the shell.
Examiner Peng: Yes, this is the same type of bullet that we extracted from the victim's skull. The perpetrator probably missed the first time. #Conv
Noah: That could explain the bruises. Claudia had to struggle to get away... #Conv
-> examiner_clues

*{inventory has claudia_wine_sample or inventory has cristina_wine_sample}[Show the wine {inventory ? (claudia_wine_sample,cristina_wine_sample):samples|sample}.]

{
    - inventory ? (claudia_wine_sample,cristina_wine_sample):
    Noah: I collected two samples, one is from the opened bottle of wine we found in the kitchen. The other one is from these stained paper towels and glass pieces I found in the bathroom. #Conv
    Noah: It appears to be wine as well, but I'll leave it up to you. #Conv
    ~ inventory -= claudia_wine_sample
    ~ inventory -= cristina_wine_sample
    
    - inventory has claudia_wine_sample:
    Noah: I sampled these red-stained glass pieces and paper towels I found in the bathroom. It doesn't look like blood, maybe wine or something. #Conv
    ~ inventory -= claudia_wine_sample
    
    - else:
    Noah: I took a sample from the opened wine bottle in the kitchen. There was also an empty glass in the living room, so someone clearly treated themselves. #Conv
    ~ inventory -= cristina_wine_sample
}

Noah: Since you didn't find any other drugs in her system, it could mean nothing, but I don't know... #Conv

Noah hands the {inventory ? (claudia_wine_sample,cristina_wine_sample):two} sample {inventory ? (claudia_wine_sample,cristina_wine_sample): flasks|flask} to the medical examiner.

Examiner Peng: Good job, we'll have {inventory ? (claudia_wine_sample,cristina_wine_sample):them|it} analyzed and I'll call you as soon as we get the results. #Conv

-> examiner_clues

* -> 
Noah leaves the lab.
->statements

=== sergeant_call ===

= daria_update
A late, unexpected call from Sergeant Jacobs alarms the detective.

*[Answer.]
Noah: Yes, Sarge. #Conv
Sgt.Jacobs: I'm calling about that missing foreign kid. I dug up the girl's file, the report was made on November, 17th. Indeed, no records, just an entry in the Asylum Seeking Register. #Conv
Sgt.Jacobs: Anyway, I contacted Skid, apparently many more kids have been reportedly missing as of late. All of them share a similar underprivileged background, that's why this whole thing never turned any heads. #Conv

**["I don't know if we should trust him."]
Noah: I don't know if we should trust him. He's just a dirtbag off the street and he's lied to us before.  #Conv
Sgt.Jacobs: That's true, but he's our only crutch at the moment. He has connections inside a lot of underground rings in this city, he's been around, you know that. #Conv


**["Once again, we rely on him..."]
Noah: Once again, we have to rely on him... How can this crook do a better job than us ? #Conv
Sgt.Jacobs: He's served time for pretty much anything you could imagine, needless to say, he has met a few interesting people along the way... #Conv

-Sgt.Jacobs: He's just our insider, you don't have to like him. #Conv
Noah: What else did he say ? #Conv
Sgt.Jacobs: Word gets around that there's an unknown group that kidnaps such underprivileged kids and recruits them for whatever cause. #Conv
Noah: That's why they stay off the radar, these reports get dismissed... #Conv
Sgt.Jacobs: Probably. Normally, I wouldn't want you to waste time on something that isn't even our case, but this could be something. #Conv
Sgt.Jacobs: You know how corrupt the force is, so we'll lie low for now. Go find Skid and ask him. #Conv
Sgt.Jacobs: You'll find him in a place called "The Red Hole", one of those dirty clubs around Rosey Square. That's where you can find him most nights. Just say the word "Santa" to get in. #Conv

**["Is the good boy expecting his present ?"]
Noah: Is the good boy expecting his present tonight ? #Conv
Sgt.Jacobs: I know, he's tacky, I'm sure you remember that... Just say it if they ask you at the entrance, it's a way of keeping track of their "exclusive" clientele. #Conv

**["What ?!"]
Noah: What ?! #Conv
Sgt.Jacobs: I don't know, some holiday-themed codeword... It's a way of regulating traffic, ensuring that the "right" people get in. It's stupid, but still, you better use it if you don't want to draw any unnecessary attention. #Conv

- Sgt.Jacobs: Don't get it twisted though, the Willford case is still your priority. #Conv

-> next_move

= claudia_update
The phone starts ringing.
What does Jacobs want now ? #Thought
*[Answer]
Noah: What is it, Sarge ? #Conv
Sgt.Jacobs: Just calling to give you a few more leads for the Willford case. We reached out to Claudia's neighbor, Maxwell Richter, you can pay him a visit tomorrow. #Conv
Sgt.Jacobs: He's an associate professor at the Volaron University, works for the biomedical department. Most afternoons he's working in the university, so it's easier to find him home in the morning. #Conv
Sgt.Jacobs: Living right next to the Willfords, he may actually have something to share. #Conv

->new_partner

= new_partner
Sgt.Jacobs: Anyway, the captain is breathing down my neck about it, so you need to get to the bottom of it, sooner than later. #Conv

*[Ask for a partner.]
Noah: Easy for you to say, but ever since Garza dropped off the edge of the earth, I've been a one-man-band ! I could really use some backup. #Conv
Sgt.Jacobs: Right... #Conv

*[Say nothing.]
Sgt.Jacobs: Look, with Garza being absent, I know you've taken too much responsibility these days and you shouldn't be all by yourself. #Conv

- Sgt.Jacobs: We've been seriously understaffed for a while, but I'll let you choose either Milton or Johnson as your temporary partner. #Conv
Sgt.Jacobs: Milton is less experienced in real world scenarios and may sometimes misinterpret people, but his analytical thinking model is somewhat remarkable. #Conv
Sgt.Jacobs: On the other hand, Johnson may be brash or rough around the edges, but the kid's got great instincts. It's up to you. #Conv

** [Choose Milton.]

~partner = "Milton"
Noah: I think Milton is a safe choice. He keeps track of everything. #Conv

** [Choose Johnson.]
Noah: I choose Johnson. It will be an opportunity for him to test his potential and mature. #Conv

~partner = "Johnson"

-Sgt.Jacobs: Good, I'll let him know. Oh, and one more thing. Commander Reynolds and other higher-ups on the division have been pressuring our captain to have the case closed within the next 10 days. #Conv

*["Are you serious ?"]
Noah: Are you serious ? What is this, a school project ? #Conv
Sgt.Jacobs: Don't play dumb, you know what's happening here. The folks on Stilton Avenue are part of a powerful community and the authorities don't want them upset and losing their faith in them. You know the priorities. #Conv
Sgt.Jacobs: The sooner this case is closed, the better we preserve the relationship between the police and the white collars. #Conv

*["I see."]
Noah: I see. I'll do my best. #Conv
Sgt.Jacobs: Great. You know how influential these people are, we need to keep them content, more so than others. Sadly, it's part of the game. #Conv

-Sgt.Jacobs: If we're unable to come to a solid conclussion within this timeline, we'll close the case as a suicide. #Conv
*["You know this can't be right."]
Noah: You know this can't be right. You saw it and I saw even more. #Conv
Sgt.Jacobs: Yes. But you'll need concrete proof and an alibi. #Conv

*[Say nothing.]
A momentary uneasy silence between the two.

-Sgt.Jacobs: You're welcome to prove otherwise, you just have 7 days to do so. If not for the captain putting his foot down, we wouldn't even be having half of that. #Conv
Sgt.Jacobs: I know you take pride in your work, that's why I'm encouraging you. But remember, the cards aren't on our side. At the end of the day, we're playing their game. #Conv
Sgt.Jacobs: What I'm trying to say is, don't lose your mind in the process. #Conv
Another short pause enters the conversation.

Noah: Got it. Good night, Sarge. #Conv
Sgt.Jacobs: Take care, Taulen. {partner} will be joining you tomorrow. #Conv
Sgt: Jacobs: I almost forgot, the examiner called, you should drop by, first thing in the morning. She'll have the initial reports ready by then. Her input will give you the right direction. #Conv

-> pick_up_em

=== rosey_sqr ===

#background #roseysqr
{once: Late that night, Noah and {partner} find themselves downtown, in Rosey Square.}

{once: Often referred to as the "Devil's Square", Rosey Square has the reputation for being one of the city's most notorious vice hubs, also offering a hangout for sketchy business behind doors, more often than not.}

{~The square's kitsch, bizzarely dim neon lighting reveals hordes of degenerates, some waiting in line outside of some adventurous clubs, others just being on the lookout for cheap substances and/or companionship.| The contrasting odors of cologne and vomit make for a thrilling experience...|}

{once:{partner == "Milton":Milton: According to previous encounters, this individual can be found in the "Red Hole" from 23:00 to 03:00, although hours may vary.|Johnson: This dirtbag likes to play boss in the "Red Hole" around these hours. I remember Garza having a drink or two at times. We'll head over to Carsen Street, at about fifty feet, there's a heavy black door on the left. We'll know it once we get there.   } } #Conv

{partner == "Milton" && !red_hole:Noah: I've been engaged for a while... Where the hell is this place...} #Conv

{sly > 3: Cops aren't exactly rockstars around this area, if we yell it out loud, we might have issues. We should lay low, if possible... [Sly]} #Thought 

+[Head off to San Hermius Boulevard.]

+[Walk through Carsen Street.]


+[Walk through Windvin Street.]

+[Look around the square.]

= carsen_1
#background #carsen
{~The pavement feels moistened by the amount of spilled booze, among other sorts of liquids|The smell of weed seems to be a common theme in this area.}

On the left side of the street, there is a small liquor store, and right next to it appears to be a movie theater. On the right side is a big club, loud, heavy music coming from inside.
Right outside the club's entrance door, the bouncer is trying to separate two young guys fighting.

+[Go outside the liquor store.]

+[Go outside the movie theater.]

+[Go outside the club.]

+[Keep walking.]
-> carsen_2


= carsen_2
#background #carsentwo
Further down the street, there is a group of stoned, "alternative" looking folks, rhytmically singing along to some ethnic music, coming from a bohemian bar, right behind them.
Right across the street, a slightly neglected, underlit motel, mostly odd couples eagerly coming in and out. Next to the motel stands an unidentifiable building.

+[Go outside the bar.]

+[Go outside the motel.]

+[Go outside the building.]
A black steel door can be seen on the right side of the unknown building, facing the narrow alley between the building and the motel.
A bunch of shady faces stand by the door, asking to get in. Some of them turn around and leave, visibly disappointed.
The door is slightly illuminated by a red neon light above it.

{partner == "Johnson":Johnson: That's it, the entrance to the "Red Hole".} #Conv
{partner == "Milton" && analytical > 2: Huh, red light... place looks like a hole too... Could this be it ? [Analytical]} #Thought

    **[Walk up to the door.]
    -> redhole_entrance
        
    ++[Go back.]
    -> carsen_2
    
+[Go back.]
-> carsen_1

->END

= redhole_entrance
#background #redholeentr
Noah and {partner} stand in front of the door.
{
    - !ask_door && !confront_bouncer:
    Automated Voice Message: Greetings, gentlemen. #Conv
    - else:
    The speakers remain silent.
}
* (ask_door) {partner == "Milton"} ["Is this the Red Hole ?"]
Noah: Is this the "Red Hole" ? #Conv
The intercom gets shut down.
{
    - sly > 3:
    Yeah, that's probably it. If you don't know the place, you're only going to find it by chance, and they won't be waiting for you. That's intentional. [Sly]
    - else:
    What the hell... Rude.
} #Conv

-> redhole_entrance

*[Show your badge. (Audacious)]
Naoh shows his police badge to the security camera.
Noah: Detective Noah Taulen, Stillfork P.D. #Conv
Automated Voice Message: Please wait. #Conv
{partner} looks more {partner == "Milton":alert|tense} than a few seconds ago.
Suddenly, a tall, bulky man with a large scar on his face opens the door.
Bouncer: What do you want ? #Conv

** (confront_bouncer) {audacious > 4}[Confront him. (Audacious)]

    {
        - try(audacious,7) == true:
        Noah: I thought I made it pretty clear, I'm a P.D. detective. Me and my partner have an important job to do here. Can you let us in to do our thing and go home or do we need to make a big deal out of this ? #Conv
        Bouncer: Relax, man, alright. I don't want no trouble, follow me. #Conv
        -> red_hole
        - else:
        Noah: Listen, we- #Conv
        A piercing pain on Noah's artificial left joint distracts him and makes him look frail.
        Bouncer: Hey, "supercops", next time have an aspirin with you or bring your chief daddy to scold us. No keycode, no entry ! #Conv
        The man shuts the door, emphatically.
        -> redhole_entrance
    }

*["Santa."]
Noah: ..."Santa". #Conv
After a few seconds, the door opens automatically.
Well, that happened. #Thought
-> red_hole

*["We're here to see Skid."]
Noah: We're here to see "Skid". #Conv
-> redhole_entrance

{
    - ask_door:
    Automated Voice Message: Sorry, I'm afraid you should leave. #Conv
    - else:
    The intercom gets shut down.
}
-> redhole_entrance


=== red_hole ===
#background #redholeentr
Noah and {partner} are escorted in the main room of the club. 
They find themselves in a tangle of loud trance music, smoke, degenerate faces and suggestive lighting. 

{
    - partner == "Milton":
    Milton: People, like the man we're looking for, tend to sit at corner tables on the periphery of the room. It offers them privacy to discuss their matters, but also a sense of power, as they face the entire area and have clear vision of everything happening around.
    - else:
    Johnson: I think I see him way over there, in the right corner, with those girls. His usual spot...
} #Conv

Noah: Yes, I can see him. His sleaziness almost puts a spotlight on him. That bastard doesn't age though... #Conv

*[Walk up to "Skid".]
-> skid

= skid
Noah and {partner} go over to Skid's table. In an apparent state of substance-induced euphoria, he is sitting with two lightly dressed women.
Skid: Well, well, well, if it ain't the "Stillfork 45" boys. Taulen and his new boytoy, to be more specific. #Conv

*["Never a pleasure, Skid..."]
Noah: Never a pleasure, Skid... #Conv
Skid: Oh come on, I'm just messing with you, you know that you and your friends in the P.D. are my favorite associates ! #Conv
Of course, he was going to play that card... #Thought
Skid: Just to prove that you have my undivided attention, no-one's gonna be bothering us. Beat it, chicas ! #Conv

*["Well, if it ain't the world's cheesiest pimp..."]
Noah: Well, if it ain't the world's cheesiest pimp... #Conv
Skid: Come on buddy, don't be like that, I know you don't mean it ! Besides, it doesn't suit your style, that was more like Garza's temperament, you bring your boy scout energy into the equation. #Conv

*["Let's get this over with."]
Noah: Let's get this over with... #Conv
Skid: Now, that's rude to the host, you know ! You haven't even let me treat you yet. #Conv

- Skid sends his girlfriends away.
Noah: Now, tell us about the missing girl. #Conv
Skid: Yeah, yeah, of course, but here's the thing. It's been so long since I last did any business with you that you've hurt my feelings. Friends don't behave that way, Taulen. #Conv
Skid: Garza was the naughty one, keeping his finger on the "pulse" of things, while you were getting points for being a good boy by doing paperwork and helping grandmas find their wallets. #Conv  
Skid: So, I will need a tiny, little favor, first. Think of it as a friendship pact, just to make sure that we have each others' back. Your precinct and I go way back, yoy know that. I'd be a shame to throw it all away... #Conv
Skid: There's a guy living on Pulaski Street, 67, in the old, green building, next to a convenience store. Let's say that he's been a little negligent about some financial obligations. #Conv
Skid: I'd need you to go there tomorrow morning and maybe talk some sense into him, I'm sure he'll listen to reason. Trust me, I have some juicy information regarding your case... But I'm an honorable man and above all, I honor friendship, but I only spill the tea with friends. So, what do you say ? #Conv

-> skid_choice

= skid_choice

{once: Noah is in a dilemma|That didn't pan out the way he planned.}

* [Accept the job.]

~ accepted_job = true
Noah: Fine. Spit it out. #Conv
Skid: My man ! We might make a businessman out of you, after all. #Conv
Skid: His name is Terrell Foe. Skinny Afro-American guy in his forties, lives on the second floor, apartment 2C. Look him up in the registry, you'll find most of this information there, too. Good thing we're under under total surveillance... #Conv
    Skid: As I said, drop by tomorrow morning, he'll probably be there. He works night shifts. #Conv
-> END

*[Decline the job.]
Noah: Wow, you got some nerve. Do you really see us as your lapdogs ? #Conv
Skid: No need to get hot, brother. You don't want to do business, it's fine. Go find yourselves a table and enjoy your time. First drink on me. #Conv

    ** (threaten) {audacious > 3} [Threaten him on the spot. (Audacious > 9)]
Noah: I don't know who you think you are, but we got enough evidence to lock you up until your teeth fall off. The only reason we're letting you off the hook is because you provide dirt on fish much bigger than yourself. #Conv


{
    - try(audacious,10) == true:
    -> skid_talk
    
    - else:
    -> threaten_fail
}
    
    **[Leave.]
    -> END

    ** (lure) {rogue>=4} [Lure him to the back. (Rogue)]
Noah: Wait, there's something I want to discuss with you in private, if we could find a quiet spot. Just me and you, {partner} will stay here. #Conv
Skid: See, I knew you were up to something ! I'll give you two minutes, come this way. #Conv
Skid shows Noah the stairs that lead to a basement. 

{
    - try(rogue,8) == true && rosey_sqr.redhole_entrance.confront_bouncer:
    -> skid_talk
    
    - else:
    -> threaten_fail
}

    

= skid_talk 

{
    - skid_choice.threaten:
    Noah: That being said, you haven't really been much use to the precinct lately. I'd say that you've served your purpose outside bars, so maybe it's time you stood behind them. Unless you give me what I came in this shithole for. #Conv
    Skid: Alright, robocop, don't make a scene, the last thing I want is people finding out we have cops in here, jerking around. #Conv
    - skid_choice.lure:
    Noah: Actually, I got something in my car that I wanted to show you. Top of the line product they've told me, maybe we could get something going. I've parked on the other side of the building, come check it out. #Conv
    Skid: Shit, I didn't know you had it in you, kiddo ! #Conv
    Right after Skid unlocks the backdoor, Noah sucker punches him, drags him over to the narrow alley, behind a dumpster and points his gun at him.
    #background #backalley
    Noah: I guess we'll do it the hard way. Now, talk. About the girl. #Conv
    Skid: Agh !!! Fine, fine, don't do anything stupid ! Listen... #Conv
    
}

Skid: There's this secret organization... they have this cryptic vibe to them, quite the weirdos. Anyway, they abduct vulnerable kids, usually from lower classes or immigrants. #Conv
Skid: Allegedly, they recruit them, change their appearance and brainwash them through a "program", kinda like a military school.
What the hell... #Thought

-> skid_reveal

= skid_reveal
{
    -skid_choice.lure:
    {~Skid finds this conversation very unpleasant|A couple drunks walk by across the street, minding their business|Noah lowers his gun, ever so slightly, for the sake of conversation}.
    -skid_choice.threaten:
    {~This is hardly the place for such a conversation|A few people try to get to Skid or send him a drink here and there, but the bodyguards prevent them. }
    
}

*{inventory has photo}[Show Daria's photo.]
Noah: This might be a long shot, but there's this girl I've been looking for. Daria Kozlov, 13, lives in Vandergrift, disappeared in mid-November. #Conv
Skid rushingly glances at the photo.
Skid: Never seen the kid, but she totally fits the description of who they're going for. #Conv



*[Ask about the organization.]
Noah: What do you know about this organization ? #Conv
Skid: Not much, really, I don't know any of them. It's an elitist group with lots of money behind them. All of them also bear a symbol on their skin, a shape or something. That much I know. #Conv

    ** ["How do you know all that ?"]
    Noah: How do you know all that ? #Conv
    Skid: There's this guy I knew. Had made quite a name for himself in the tech world, mad genius type of guy. He had developed a process of arificially generating paintings in the style of famous old painters. #Conv
    Skid: They looked so authentic in relation to the painters' original work to the point that he could convince art experts that he owned a private collection of classic, never-released artwork. #Conv
    Skid: He went all the way, imitating the proper usage of color, brushes, etc, even providing counterfeit seals of authenticity, supposedly from way back in the day. Quite a nerd for art, he knew all that stuff. #Conv
    Skid: Long story short, he used to date a chick from that organization. She introduced him and he hooked them up with paintings. Only problem, they realized what was going on and tried to get rid of him. #Conv
    
    ***["Tried" ?]
    Noah: "Tried", huh ? Interesting usage of words. So, he's alive ? #Conv
    Skid: You're really smart, you know. Such a shame you're working for scraps. Let's just say the old him is dead. #Conv
    
    ***["Where is he now ?"]
    Noah: Where is he now ?
    Skid: I'm afraid this is "classified". Can't just spew this information out like that, you know. #Conv
    
    - Skid: I mean, I happen to know, and I could tell you, but this job that you blatantly rejected really needs to be done... I've already put my ass on the line here by ratting on old friends, might as well get something for my troubles. #Conv
    {skid_choice.threaten: Skid's bodyguards have their eyes on the table.}
    {skid_choice.threaten: I can't try anything bold right now...} #Thought
    
    
    **** [Accept the job.]
    
    ~ accepted_job = true
    Noah: Fine. Just this one thing. Give me a name, description, apartment, etc. Tomorrow, same hour, I drop by and you tell me everything. #Conv
    Skid: {skid_choice.lure:You had to throw me around like a dog to come to reason ? Real piece of work you are.|Fantastic ! I knew you'd finally talk some sense.} #Conv
    Skid: His name is Terrell Foe. Skinny Afro-American guy in his forties, lives on the second floor, apartment 2C. Look him up in the registry, you'll find most of this information there, too. Good thing we're under under total surveillance... #Conv
    Skid: As I said, drop by tomorrow morning, he'll probably be there. He works night shifts. #Conv
    -> skid_reveal
    
    **** [Decline the job.]
    Noah: For the last time, I won't become any dirtbag's henchman. #Conv
    
    {
        - skid_choice.threaten:
        Noah: At least you've given me something to bite into. Come on, {partner}. See ya never. #Conv
        Skid: Terrible business man. I guess that 9 to 5 lifestyle suits you after all. Still, feel free to stay for a few drinks, or other things... #Conv
        
        - skid_choice.lure:
        Noah: I should've bashed your skull, but I have somewhat of a conscience. I'll work with what I got, for now. #Conv 
    }
    -> skid_reveal
    
    **** (shovegun){skid_choice.lure && (audacious > 5 or rogue > 5)} [Shove the gun on his head.]
    Once again, Noah neutralizes him and pushes the gun on Skid's temple.
    Skid: ALRIGHT, ALRIGHT, DEAR GOD ! He resides in the eastern suburbs, in the Vietnamese neighborhood of Vo Ngang. #Conv
    Skid: As you take Exit 34 from here and then turn right for Chinzou, at some point you'll see the main square of Vo Ngang. There's quite a few ramen shops, I believe he lives somewhere across one of them. #Conv
    Skid: He changed his name to Troy Berkins, so you can start with that. #Conv
    Skid: Now, if you'd be kind enough to hide that gun, take your friend and fuck off, I'd be grateful. I got nothing else to share, even if wanted to. #Conv
    -> skid_reveal
    
* ->skid_leave

= skid_leave
{skid_choice.lure && threaten_fail:With their heads down, }Noah and {partner} head back to the car and go home.
    
    
->END

= threaten_fail

{
    - skid_choice.threaten:
    Skid doesn't buckle.
    Skid: Nice try, I almost soiled myself. The problem is, you and your friends are too desperate to even touch me. #Conv
    Skid: On top of that, do you really think this city would give a crap if a nobody detective and his lackey returned with a broken rib or even went "missing" ? #Conv
    Skid nods and three large men in black approach and stand behind Noah and {partner}.
    
    -> skid_choice
    
    - skid_choice.lure:
    #background #backalley
    Under a pretense, Noah lures Skid outside through the back exit of the building.
    Right after he blindsides Skid, he blacks out.
    Two minutes later, he wakes up on the side of the pavement, a few meters outside of the "Red Hole". H sees {partner} nervously checking on him.
    Noah: My head is killing me... What the hell happened ? #Conv
    {
        - partner == "Johnson":
        Johnson: You got whacked in the head ! I don't know what you were trying to pull off, but our behavior started pissing people off and a bodyguard grew suspicious, so he followed you. #Conv
        Johnson: I'm pretty sure that we've burned that bridge for now. It's obvious that we're not welcome here, so we better leave. #Conv
        - else:
        Milton: It appears that a bodyguard was skeptical about your motives and when you decided to go proceed with your plan, he assaulted you from behind. #Conv
        Milton: I was quickly notified and we are strongly advised to not reenter. #Conv
    }
    Noah: I messed it up ! {rosey_sqr.redhole_entrance.confront_bouncer:We drew too much attention from the way we entered the club}. I gotta find another way to learn about the girl. #Conv
}
-> skid_leave






->END

=== examiner_update ===
#background #lab

Early in the morning, the detecive meets the coroner in her office.

Noah: Some much needed news, I hope... #Conv
{
    - cristina_sample and claudia_sample:
    Mia: Indeed, but this case still perplexes me. So, listen. #Conv
    Mia: The sample you took off the bottle of wine turned out to be just wine, but the sample you got from the bathroom revealed something eerie. #Conv
    Mia: The bathroom sample indicated a definitive dosage of astrecamine. We're talking about 5 grams, which is almost double the lethal dosage. #Conv
    Mia: However, no astrecamine was found in the victim's system. I don't know what to tell you... #Conv
    ~evidence += astrecamine_sample
    ~evidence += bottle_sample_clear
    
    - cristina_sample :
    Mia: I'm afraid not... this sample you brough here is just plain wine. Besides, her system was clear of any suspicious substances. Maybe you don't need to dig into that probability anymore. #Conv
     ~evidence += bottle_sample_clear
    
    - else :
    Mia: I suppose so... that sample you brought me from the bathroom revealed wine mixed with astrecamine. Although this substance is known to be used for sedative purposes, it is widely avoided, as it is proven to be potentially lethal if you exceed a dosage of 1.5-2 grams. #Conv
    Mia: Weirdly enough, her system was clear of astrecamine, so I'll leave that puzzle to you. #Conv
    ~evidence += astrecamine_sample
    
    }
    Noah: Right. Whatever the case, I've got a lot of work to do. If you'll excuse me, I got a partner to meet, you know where to find me. #Conv

-> meet_partner

=== rita_died ===
#background #rita_dead

~ day++
~ timepass()

Sunday morning, it's Noah's day off. Although not in the mood for going out, he forces himself to go for a stroll and then stop for breakfast at that cozy diner near his house.
I can't keep on living like this. I owe it to myself to try and get back out there. One step at a time... #Thought

During his meal, he receives a message.
It's from {partner}, it contains a link.

*[Open the link.]
"35 Year Old Woman Found Dead in River: An upsetting incident was uncovered very early this morning, as a boat of fishermen discovered the lifeless body of a young female lying on the surface of the Hagslow River, around half a mile from the Oceana Bridge. According to the police, the unfortunate woman probably fell in the river from a great height at some point over the last couple of days and the current carried her away to the spot where she was found."
**[Keep reading.]
"The circumstances under which the woman fell to her death remain unknown, althought the local authorities claim that there is no evidence to support foul play, deeming the woman's tragic passing a suicide."
Below the article, Naoh sees the picture. It's Rita.
The sounds fade into the background, the people, the objects in the diner become trembling shapes. A chill runs down the detective's spine.

-What. The. Hell. #Thought
*[Call {partner}.]
{partner} arrives at the diner shortly after. He sits with the detective, who still looks as pale as paper.
{partner}: I remembered the housekeeping lady from the night of the incident, when the whole unit arrived at the scene. {partner == "Milton":This is an alarming development, detective|I'm lost for words too, boss.} What do you think happened ? #Conv
    **["What she saw traumatized her."]
    Noah: I think that what she saw deeply traumatized her. The image of a person you've known well for many years shot in the head is a heavy burden. Especially, if you consider the fact that she was the first person to discover the body. #Conv
    Noah: Not to mention the unfair guilt she must have carried, thinking that she could have prevented it, had she gone sooner. All these factors together could drive a person mad. #Conv

    *(they_killed_rita)["Someone wanted her gone."]
    
    ~ XP+= 30
    
    Noah: This was neither suicide, nor an accident, trust me. Someone wanted her out of the picture for good. She probably knew more than she what she led me to believe and that scared them. #Conv
    
    *["She struggled financially."]
    Noah: During our conversation, she mentioned that she was in dire straits and that she couldn't afford another ticket to go to her mother. The state is in a great depression and so many fellow citizens are left with no other choice. Shame on the New Republic for driving people to such ends ! #Conv

- Noah: We have to get to the bottom of this, no matter what. In memory of Rita, too. {they_killed_rita: Whoever killed Claudia is responsible for this, too}.
{empathetic > 2:If only I had given her the damn money for the train... Maybe I could have saved her...} #Thought
{
    - empathetic > 2 and partner == "Milton":
    Milton: Are you alright, detective ? I can see you are tearing up. #Conv
    Noah: She seemed nice, she didn't deserve this. She also leaves a young daughter behind... #Conv
    - empathetic > 2 and partner == "Johnson":
    Johnson: Don't let it get to you, boss. This world will drive you nuts, we're doing everything that's in our power. #Conv
    Noah: I know. It doesn't make it much easier. #Conv
}
-> next_move

=== rita_reveal ===
Noah receives a call from an unknown caller.

Noah: Who is this ? #Conv
Rita: Mr.Taulen, this is Rita. Rita Stamopoulos, Mrs.Willford's housekeeper.
Noah: Oh, how are you ? #Conv
Rita: Good, thank you. I'm calling because I believe that there's something more you need to know. #Conv
Rita: When we talked at the night of the incident, I hesitated, because I was probably in danger. #Conv

*["Did you see who did it ?"]
Noah: Did you see who did it ? #Conv
Rita: No, as I told you, I only heard the gunshot and rushed back down to my car to get the spare key, because the eye-recognition wouldn't grant me access... #Conv

*["Did you know it was coming ?"]
Noah: Did you know it was coming ? #Conv
Rita: No, I didn't. Just like what I'm about to tell you. #Conv


*["Are you suspecting someone ?"]
Noah: Are you suspecting someone ? #Conv
Rita: Actually, I think I do... #Conv

-Rita: When I called Mr.Willford, after I discovered the body, he immediately asked me if I called the police. I told him I did and I could tell that he got upset over it. #Conv
Rita: He arrived before the police, and while I was still in a state of shock, he seemed quite worried, but in a strange way. #Conv
Rita: Then, he wanted to know what I saw, what  I said to the police when I called, etc. I told him that right before the gunshot, I believe I heard Mrs.Willford shout "I TRUSTED YOU !", or something along these lines. #Conv
Rita: He tried to calm me down and told me that I probably imagined it, but I insisted. He then told me that I'm a rational woman and I shouldn't jump to conclusions, because it wouldn't benefit me and he told me not to "mislead" the officers. #Conv
Bingo. #Thought
Rita: I could tell by his voice that he really meant it. This attitude really frightened me, that's why I didn't mention these things at first. #Conv

*["Better late than never..."]
Noah: Better late than never, you did the right thing. #Conv
Rita: I believe so. I've wanted to do this for a few days and now that I've sorted things out here, I finally found the courage. #Conv

*{crime_scene.ask_rita_couple}["I thought you said they were happily married."]
Noah: I remember you saying they were happily married... #Conv
Rita: I thought so... Mr.Willford always seemed more aloof and distant, but he still gave the impression of a kind husband. That's why I can't believe he could be involved in this ! #Conv

*["Did you hear any other voice ?"]
Noah: Did you hear any other voice ? #Conv
Rita: No, unfortunately. Whatever happened had to be calculated. #Conv

-Rita: That's all I know, though, I hope you find this information useful. Honestly, I don't know if I would have been brave enough to confess this if I were still in Atallon. #Conv
Rita: I feel like my family's life would have been in danger up there. I'm still cautious, though. Anyway, for that I have to thank you again, I don't know what I would have done. I'll forever be grateful ! #Conv
Noah: Thank you for your help, too. Stay safe... #Conv

~ statements_ += ritas_late_confession

-> next_move

=== suspects ===

Rita's words sparked some curiosity.
If all of this is true, the murder had to be premeditated. Probably by more than one person... #Thought

+[Suspect Cristina.]
Someone from the building that Claudia "trusted"... Artuso's pretty face could be just a mask. #Thought

**[Interrogate Artuso.]

~ accused = "Artuso"
-> decision

++[Think it over.]
-> suspects

+[Suspect Okamoto.]
Something felt off with the Okamotos from the get go. Maybe it's time to dig into that... #Thought

**[Interrogate Okamoto.]

~ accused = "Okamoto"
-> decision

++[Think it over.]
-> suspects

+[Suspect Willford.]
The evidence suggests that he was absent from the scene of the crime. That being said, his overall behavior seems erratic. {opened_drawer: Besides, I shouldn't forget Claudia's opened drawer.} #Thought

**[Interrogate Willford.]

~ accused = "Willford"
-> decision

++[Think it over.]
-> suspects

+[Suspect Isenberg.]
A seemingly genuine and trustworthy man. Veterans sure like their guns, though... #Thought

**[Interrogate Isenberg.]

~ accused = "Isenberg"
-> decision

++[Think it over.]
-> suspects

= decision

{accused} it is, then. I'll talk to {partner == "Milton": Milton|Johnson} to arrange an interrogation, tomorrow. #Thought

->END

=== cristinas_ex ===

= outside
#background #troys
{once:Noah and {partner} find themselves standing outside Troy Berkins' supposed house.}
It's a noticeably small house, minimal on the outside, while showcasing some traditional Asian architecture, much like the rest of the neighborhood.
{once:Noah: He must be really secluded, very few people knew anything about him. Or so he wants us to think...} #Conv


+ [Look around the house.]
Adjacent to the house seems to be a storeroom with a tiny window.

    ++ [Peek through the window.]
    Several typical toolkits and cleaning equipment appear to be stored inside.
    {analytical >= 2: Noah {once:also notices a |already noticed the }handbarrow filled with brushes, tins of paint and a set of carefully preserved canvases. [Analytical] }
    {!back && analytical >= 2:Noah: Looks like we found our friend. He probably still gets his artistic outbursts.} #Conv
        +++ (back) [Go back.]
        -> outside
    ++ [Go back.]
    ->outside
    
* [Ring the doorbell.]
-> greet

= greet
{once:A diminutive woman opens the door. Wearing a simple tunic in earthly colors and having her hair tightly tied back, she seems overly courteous and mature for her young age.}
{once: The woman awkwardly greets the two men|This clearly didn't go as planned}. #Conv

*(straight_forward) [Ask for Troy.]

{
    - recruiter_fail:
    -> irritated_troy
    
    - else:
    Noah: Good afternoon, Miss. This is detective Noah Taulen from Stillfork P.D. #Conv
    Noah shows his badge.
    Noah: We're looking for Mr.Troy Berkins. We would just like to ask him a few questions, concerning a currently open case. #Conv
    Young Woman: Oh, dear. What is going on ?! #Conv
    Noah: There is nothing to worry about. This is a typical interview, we just have reason to believe that he might have some insight, based on some old acquaintances. #Conv
    Young Woman: Of course, just a second. Come in, please. #Conv
    The shakiness in her voice shows her nervousness. 
    Young Woman: Troy, could you come here, please ? Somebody wants to talk to you... #Conv
    -> meet_troy_smooth
    
}

* [Lie to her. (Rhetor)]
Noah: Good afternoon, Miss. #Conv

    
    ** (disturbance)["We've been notified about some disturbance."]
    Noah: We are police officers, we're working for the Stillfork P.D. Our colleagues here have been notified several times about a strange man who's been disturbing people around the area. #Conv
    Noah: We have reason th believe that he may linked to a case of our own up in Stillfork. Has anything come to your attention ? #Conv
    Young Woman: Not really, I haven't seen or heard anything, I'm afraid. #Conv
    Noah: Does anyone else live here ? The more statements we take, the better, I hope you understand. #Conv
    Young Woman: Of course ! My husband is here, too. He's probably in his room, I'll go call him. Don't stand out in the cold, come inside. #Conv
    
    ***[Wait quietly.]
    Noah and {partner} quietly wait in front of the doorstep.
    ***(isolate)[Think of a way to isolate Troy.]
    Noah discreetly whispers to {partner}.
    Noah: When she returns, we better think of an excuse to talk to him in private. I get the feeling that she doesn't know. #Conv
    Noah: No need to upset her, she looks like a sweet person. Leave it up to him. #Conv
    
    --- A few seconds later, the woman returns.
    Young Woman: He's coming right away. #Conv
    -> meet_troy_smooth
    
    
    ** [Pretend to be a cult recruiter.]
    -> recruiter_fail
    
    = recruiter_fail
    Noah: Would you be kind enough to let us in your household for five minutes. We would love to share with you and your family the values of our humble lord and savior, Sirus. #Conv
    
    {partner} is just as confused as the woman and glances away out of embarrassment.
    Young Woman: Oh no, I'm afraid you lucked out, I'm not into these neo-scientific doctrines, with all due respect. #Conv
    Noah: Why would I think this is a good idea... #Thought
    -> greet


= meet_troy_smooth
#background #troyinterior

A thin, somewhat skinny man with long grey hair and a matching bushy beard comes out of one of the rooms. He can't be older than 50, yet he looks drained and fatigued beyond his age.
Troy: Gentlemen... #Conv

{
    - disturbance:
    ~ sly += 1
    {
        -isolate:
        Noah: Mr.Berkins we're with the Stillfork P.D. We're investigating a series of reported disturbances around your neighborhood and we'd like to take your statement, if that's ok. #Conv
        Troy: Uh, sure... But I don't know what to tell you, I havent- #Conv
        {partner}: Excuse me, Miss, would you happen to have an aspirin, by any chance ? A headache has been bothering me all day. #Conv
        Young Woman: Sure, I believe I have some left, give me a minute. #Conv
        Nice. #Thought
        -else:
        Noah: Mr.Berkins, we're with the Stillfork P.D. I'm detective Noah Taulen and this is my partner. We're sorry to misinform you, but we're here for another reason. #Conv
        Noah: We have some questions for you, regarding a former romantic partner of yours and her involvement in an illegal organization. #Conv
        Young Woman: Is this some kind of farce ?! #Conv
        Troy: How dare you lie to us like that and make these absurd accusations on top of all ? #Conv
        Noah: The false pretense was an impulsive call on my part, I was worried that you would exhibit a hostile behavior, had you known why we wanted to see you. #Conv
        Noah: I apologize for that, but I guarantee you that anything we discuss shall remain confidential. If you choose to co-operate, you have my word that you won't face any charges. #Conv
        Noah: Otherwise, I'm afraid that we'll have to come back with an arrest permit. It's up to you. #Conv
        Troy takes a deep breath.
        -> dropped_gun
    
    }
    
    -else:
    Young Woman: The policemen are looking for you about a case they think you're linked to. I hope this is all a misunderstanding... #Conv
    The man's eyes glare, immediately.
    Troy: Officers, there has to be a mix-up. I've never had any trouble with the law ! #Conv
    Noah: We only have a few questions to ask you, regarding an old romantic partner of yours and her involvement in an illegal organization. #Conv
    Noah: We strongly advise you to co-operate, your anonymity will be guaranteed and you have nothing to worry about. Otherwise, we'll be forced to return with a permit. #Conv
    Young Woman: You never mentioned this ! What is happening ? #Conv
    Troy turns to his wife, while a familiar gloom overwhelms him.
}


-> dropped_gun

= irritated_troy
#background #troyinterior
Noah: I'm sorry, this is not why we're here. We're police officers from the Stillfork P.D. and we've been told that your husband could have some important information regarding a case. #Conv
Noah: You have nothing to worry about, we just didn't want to upset you... #Conv
The woman looks upset and slightly scared.
Young Woman: What the hell is happening here ?! You better show me some badges or I'm calling the actual police ! #Conv
Noah and {partner} regretfully pull out their badges.
A thin, disheveled, bearded man emerges from a room and approaches the doorstep.
Troy: What's going on here ?! #Conv
Young Woman: Troy, these supposed cops lied to get to you ! #Conv
Troy pulls out a handgun out of his back pocket and aims at Noah and {partner}.
Troy: Kiara, stand behind ! Make one move and you'll be sorry ! #Conv
Maybe not the best time to try anything stupid... #Thought

->handle_troy

= handle_troy
* {stealthy >= 5} [Grab your gun and throw him off. (Stealthy)]

{
    - try(stealthy,8) == true:
    
~ XP += 30
Through a blazing-fast motion, Noah grabs his gun.
-> aim
    
    - else:
    Noah attempts to quickly grab his gun, but it slips through his hand.
    In a rushing act of fear, Troy pulls the trigger.
    {
        - HP <= wounded:
        ~ ending(handle_troy)
        
        - else:
        ~ HP -= 2
        Noah screams in pain as the bullet pierces his {~right shoulder|left leg|right arm|left ear}.
        This gives {partner} enough time to get a hold of his gun and aim at Troy.
        -> handle_troy
        
    }
}

* (leaveweapon)[Leave your weapon down.]
Noah: We came here with no intention to hurt you, whatsoever. To prove it, my partner and I will put our weapons down, right here. #Conv

{
    -try(empathetic,5) == true:
    Noah and {partner} place their handguns on the wooden floor, calmly and slowly, as Troy nervously stares at them with his arms tensely stretched while aiming at them.
    - else:
    Noah's words sound disingenuous to Troy, who strenghtens his grip.
    Troy: I just told you to not make a move ! Don't test me, this is your last warning ! #Conv
    -> handle_troy
    
}

*[Talk to him.]
Noah: We should all try and use reason here. #Conv
Troy: Is that a threat ?! #Conv

**["I need your help."]

~ troys_trust++
Noah: I need your help. I'm working on a case about a missing kid. The circumstances indicate that it could be linked to a kidnapping ring. I was told you could have some information on that. #Conv

Troy: What are you accusing me of ? #Conv
Noah: Nothing. I also know that you're no longer associated with them and that you had to escape. The only thing I want from you is information, then we'll never bother you again. #Conv

**(arrest_threat)["This is up to you."]
Noah: This is up to you, Mr.Berkins. We could do this another time if you choose to, but if so, I have to warn you, we'll be back with an arrest warrant. #Conv

-- Troy's expression suggests that he knows what Noah is talking about. He puts his gun in his pocket. 
->dropped_gun


= aim
* [Shoot the gun off Troy's hand. (Stealthy)]

{
    - try(stealthy, 10) == true:
    With one steady, swift move, Noah's bullet scratches Troy's forearm, making him drop the gun.
    Troy: AAAGH ! THAT HURT ! #Conv
    -> dropped_gun
    - else:
    
    ~ ending(aim)
    
}

= dropped_gun
{
    - disturbance:
    {once:Troy: I'm listening.} #Conv
    - leaveweapon:
    {once:Troy is keeping his guard up, but slightly eases his posture.}
    - straight_forward:
    {once:Troy: Kiara, calm down. I'll explain later. What do you want to know ?} #Conv
    - else:
    {once:This gives {partner} enough time to get a hold of his own gun.}
    {once:Noah: I did not intend to hurt you, you practically forced me to ! It's nothing compared to what could've happened.} # Conv
}

{
- isolate:
Noah: Mr.Berkins, would you care to move this conversation somewhere more private ? The subject is sensitive and I think it would be in our best interest to leave your family out of it. #Conv
Troy's face turns pale-white.
Troy: Wh-what are you talking about ? I-I don't... #Conv
Noah: We're not after you. Based on your past environments, you might have some important information and we figured that sharing it in front of your people might be difficult for you. #Conv
The woman returns with an aspirin and a glass of water.
Young Woman: Here you go. #Conv
{partner}: Thank you very much. #Conv
Troy: Honey, I offered to show the detectives around the neighborhood, I think I might be able to help them. #Conv
Young Woman: Oh, alright. Please keep us posted if anything comes up. It's a safe neighborhood and we need to keep it that way. #Conv
Noah: Of course. We won't bother him for long. Thank you and take care. #Conv
The three men head off to a nearby park. #background #park
}

* [Tell him you know 'Skid'.]
->mentionskid

*[Ask him about his ex.]
->talkaboutex

*[Ask about the organization.]
Noah: What do you know exactly about this group of people ? #Conv
Troy: They call it "Arbor". It's latin, I think it means "tree", or something. But don't think of it as a glorified crew. We're talking about an entire secret society. #Conv
Troy: They have a strict hierarchical system, their own moral code and a specific agenda. I guess they resemble the Mob in that way. They also bear a symbol on their skin, it basically looks like the letter "A", but it's not easy to see. They bear it in some part that is typically covered by clothing. #Conv
-> ask_organization

= ask_organization
*["What's their agenda ?"]
Noah: So, what is their agenda ? #Conv
Troy: I don't know how to put this. I understand that they recruit young people systematically. From this point forward, these people become their "soldiers". They're given new identities, while being force-fed the "Arbor" propaganda. #Conv
Noah: What kind of propaganda ? #Conv
Troy: They believe that our civilization is bound for a revolution. Just like it happens every few centuries, when the status quo becomes obsolete in the face of societal challenges. #Conv
Troy: Obviously, everything was in shambles, after the war. Hence, the establishment of the New Republic, a democratic regime designed to regain the population's trust. #Conv
Troy: Well, for a lot of people, not only did the New Republic fail to restore the overall living standard, but the flimsy structure of this regime enabled lawlessness, corruption and chaos. #Conv
Troy: That's where "Arbor" come into play. Their mission statement orders for an underground manipulation of key political and social affairs, which in time will enable them to stage a coup. #Conv

**["Are you off your meds ?"]
Noah: Are you off your meds ? Do you hear what comes out of your mouth ? #Conv
Troy: You think I sound like a nutcase, right ? I get it, but it goes to show how well they're covering their tracks. Trust me, they have people in your line of work, too. #Conv

**["Are we dealing with fascists here ?"]
Noah: Are we dealing with fascists here ? #Conv
Troy: It's a bit more complicated. They don't discriminate racially while recruiting. That being said, they believe that humanity shall be governed by the "Archetype". #Conv
Troy: That is a person who not only has reached their upper physical, mental and intellectual limits, but can also be ruthless in the name of order. #Conv

**{rogue>=4}["Things have to change."]
Noah: I can't say I blame them. For the past 30 years, all our hopes for a better future have been flushed down the drain by these so-called moralists. #Conv
Troy: For a while, I was conditioned to think that way, too. However, I've seen the things they're willing to do and I snapped out of it. #Conv

--{partner}: {partner == "Milton":If true, these are very serious allegations|Umm, could you slowly repeat, like, everything ??} #Conv
{partner == "Johnson":Noah: I got this, detective.} #Conv

-> ask_organization

*["What was your involvement ?"]
Noah: What was your involvement in all of this ? How did you contribute ? #Conv
Troy: I never had an active role within their main operations, just to make things clear. I would strictly serve them through public relations. They found my networking to be very useful and influential. #Conv
Troy: It basically means that I would try to introduce important people of various industries to the "Arbor" people. I would find opportunities at corporate events, business meetings, concerts, art exhibitions, and so forth. #Conv
Troy: Obviously, I never exposed "Arbor". I would simply entice outsiders to get in contact with the right people by false pretences. Simple networking. #Conv

    ** ["You were heavily involved."]
    Noah: Looks to me like you were heavily involved, then. #Conv
    Troy: I'm no saint, I'll admit it. But that's as far as I ever went with them. They make their connections either way, I was just another drone. Still, I never forced anything. Whoever ended up doing business with them, did so willingly. #Conv
    
    **["What sort of people were you fishing for?"]
    
    Noah: What sort of people were you fishing for ? #Conv
    Troy: Highly influential people from my circles. Could be working in tech, pharmaceutics, stocks, politics, you name it, even in showbiz. Specifically, people who I knew would always crave more power, no matter what. #Conv
    
    -- Troy: Make no mistake though, I stopped enjoying it very quickly. The more time went on, the more I wanted to distance myself. But they were being manipulative, trying to make me feel ostracized if I didn't do my part. #Conv 
    
    -> ask_organization


*["Why did you get out ?"]
Noah: Why did you get out ? #Conv
Troy: I started fearing for my life ! Once I had become considerably detached, I started receiving subtle threats. #Conv
Troy: Well, that and... a little friction from some business deals... They thought that I was trying to take advantage of them. #Conv
-> ask_organization

* -> exit_conv

= talkaboutex
Noah: I would like to discuss your former female partner. As per protocol, I need to write down some basic information, as provided by you. Full name, ethnicity, age, for a start. #Conv
{
    - troys_trust == low:
    Troy: I'm not sure I follow you. This must be a mistake, I had no "partner" during any of this. #Conv
    -> talkaboutex_lowtrust
    - else:
    -> talkaboutex_proceed
}

= talkaboutex_lowtrust
*["We're off record." (Sly)]

~ sly++
~ troys_trust++

Noah: I assume you're afraid that this information will reach the wrong ears. Believe me, the only people in my precinct who aknowledge your existence are me and my partner. #Conv
Noah: This investigation was initially just about a kid who disappeared, but the only reason I took the case is because nobody else cares. #Conv
{partner}: Besides, {partner=="Milton":if I may,} if we {partner=="Milton":regarded you as a potential threat to our nefarious interests, we would have taken other measures|wanted to shut you up for good, we would've been done here }by now. #Conv
Troy: Fine. #Conv
-> talkaboutex_proceed

*[Threaten to turn him in.]
Noah: I'm afraid you don't have much of a choice. Your other option would have you being charged with conspiracy under the state of federal law and human trafficking. #Conv
Noah: If the prosecutors are thoughtful enough to stop there, which I highly doubt, you're looking at 20 years, minimum. #Conv
Troy: You're threatening me ? Even so, how would that benefit you ? #Conv
Noah: For us two, we put another one behind bars, earn our paycheck, ascend the hierarchy. These cases are often dragged out too much, at some point we're looking for a scapegoat to take the fall. #Conv
Noah: When it comes to you, though, how would it serve you to have yourself exposed to every headline and news broadcast in the state ? Wouldn't that draw your former associates' attention ? #Conv
Noah: Do you think they would be relieved that you took one for the team or would they be on their toes thinking you could rat on them at any minute to cut yourself a deal ? #Conv
Noah: Would you like constantly living in fear of your own shadow ?{bluff: Not to mention our unnamed source who could tell us interesting stories about you, if they were to find out we talked...} #Conv 
Troy: God... Why not hold a knife to my neck instead... Alright. #Conv
-> talkaboutex_proceed


= talkaboutex_proceed
Troy: Her name is Cristina Artuso. Long-haired brunette, early thirties, of Italian descent. #Conv
WHAT ? #Thought
Troy: She used to live in that neo-classical, upper-class residence, Stilton Avenue, 48. I don't know if she still lives there, haven't spoken to her in years, obviously. #Conv
Troy: I met her about a decade ago. She came to an art exhibition I was hosting. I sold her what she thought was an authentic unknown painting of Caravaggio, so we started talking. This particular style really intrigued her, probably reminded her of her anscestry. #Conv
Troy: Anyway, shortly after, we started dating. At first, I thought everything was perfect, we lived separately and nothing seemed off. She'd only get a little tense whenever we would go on trips, but I just figured she couldn't be away from work. #Conv
Troy: About a year later, we'd gotten more serious, so I asked her to move in with me, but she turned me down. I didn't get it then. #Conv
Troy: As I would spend more and more time at her place, I also got to know the other residents of the building. I discovered that she would spend a lot of time with them and eventually, so did I, by association. #Conv
~ statements_ += troys_ex
->dropped_gun

= mentionskid
Noah: I'm here because a mutual 'friend' of ours, 'Skid', told me you could help us with something. #Conv
Troy: I'm sorry, I have no clue who you're referring to. #Conv
{observant >= 3: He avoids eye contact and his inflection sounds unnatural... He's clearly lying.} #Thought

*[Confront his lying.]

Noah: Lying won't do you any favors, you've given yourself away. 'Skid' told me all about your past as a con-artist. #Conv
Troy: What kind of crap did this guy tell you exactly ?! #Conv

** (bluff) {rhetor>=5} [Bluff to learn more details. (Rhetor)]

{
    - try(rhetor,10) == true:
    
    ~ troys_trust++
    ~ XP += 20
    Noah: That you and your previous girl were devoted to a cult that abducts underaged kids and does weird things with them. We also know that you disappeared after they found out you were ripping them off. #Conv
    Noah: Apparently nobody saw it coming, since you entered their circle as this bright artist who would gift them paintings, etc. #Conv
    Noah: Another unnamed source has given us critical personal information about your former girlfriend. The only thing we need from you is to cross-examine some details. It's her who we're really after. #Conv
    Hopefully, he'll bite. #Thought
    Noah: If you're kind enough to discuss some of those details with us, you won't have to worry about us. #Conv
    {
        - !isolate:
        Kiara stares in disbelief, with a frozen expression on her face.
        Kiara: This... this can't be real. #Conv
        Troy: That's not what happened ! Kiara, it's not like that, believe me ! #Conv
    }
    Troy: Alright, hear me out !! First of all, I did NOTHING to any kid, EVER ! They would snatch underprivileged kids and they would enroll them in some private program, in order to brainwash them. #Conv
    Jackpot. #Thought
    Troy: Personally, I NEVER took part in this whole operation and I NEVER endorsed it, either ! I know, it's messed up. I only started finding out little by little over time, mostly by accident. #Conv
    Troy: By the time I realized how wrong everything was, I was already too deep in. I disappeared overnight, once they discovered I had sold them some counterfeit artwork. #Conv
    Troy: Actually, this was just the straw that broke the camel's back. I'd been planning my way out for a while but I was too scared to go through with it. #Conv
    Troy: Of course, some of them had started getting wary of me. Others didn't want me there from the start, i know that for a fact. #Conv
    {
        -!isolate:
        Kiara: I... I need some air. #Conv
        Troy: Kiara, wait ! #Conv
        The woman storms out of the house.
    }
    ->dropped_gun
    
    - else:
    Noah: I know all about your group using kids to get stuff for the organ market. Some really high profile people involved have come forward, even politicians. Need I say more ? #Conv
    Troy: In all honesty, I have no idea what you're talking about. Do you ? #Conv 
    Shit. Maybe I should leave improv to the pros. #Thought
    ->dropped_gun
    
}

**[Tell him exactly what you know.]

~ troys_trust++
Noah: Based on our research, you are a scientist. You used to date a woman that associated with a secret group that abducts minors and manipulates them and eventually, she introduced you ot them. #Conv
Noah: You also happen to be an art enthusiast and you have developped a process of creating counterfeit works of art, which you started selling to them. #Conv
Noah: Only problem being, once they found out you were a fraud, you had to come up with an exit plan, which brings us here. #Conv
{
    -!isolate:
    Kiara: What are you talking about ?! Troy, what is happening ? #Conv
    Troy: Kiara, I promise I'll explain everything later. #Conv
}
Troy: I guess it was all a matter of time, then. Deep down, I knew the past was going to catch up on me... What do you want to know ? #Conv
-> dropped_gun



* {empathetic >= 4} [Make him feel safe. (Empathetic)]

{
    - try(empathetic,7) == true:
    
    ~ troys_trust++
    ~ empathetic++
    
    Noah: {partner}, lower your weapon, now. #Conv
    {partner} hesitantly puts his handgun down.
    Noah: I know this feels overwhelming and I'm sorry that we frightened you, I swear you're safe. #Conv
    Noah: We're looking for some people that you allegedly used to be affiliated with. #Conv
    Noah: We have reason to believe that you now feel threatened by them. If you talk to us, we'll make sure you won't have to worry about them anymore. #Conv
    Troy loosens up a little.
    ->dropped_gun
    
    - else:
    Noah: No one needs to get hurt here, relax. Just kick your gun in front of us and we'll have a peaceful chat, I promise. #Conv
    Troy can sense that Noah is still tense from the shot he just took.
    Troy: I don't trust you, you clearly have other things in mind and your friend is still pointing his gun at me. Plus, you almost took me out ! #Conv
    Can't get him to relax yet... #Thought
    -> dropped_gun
}

*[Focus on other questions.]
Maybe I should cut right to the chase. #Thought
->dropped_gun

= exit_conv
{partner}: Detective, we just received a notification from the center. Divisional report scheduled at 8 p.m. #Conv
Noah: We should be moving, then. #Conv

{
    -troys_trust == significant and isolate:
    Troy: I guess I should thank you for not confronting me in front of my wife. She knows very little about my past life and I need to ensure that, for everyone's sake. #Conv
    Troy: You seem to be trustworthy cops, not a common thing these days. I'd like to give you something that I've kept in my storeroom. Hopefully, it will come in handy. #Conv
    -> troys_gift
}

= troys_gift
#background #workshop
Noah and {partner} are curiously awaiting as Troy goes through his impressive gadget kit. The man presents to them some sort of a small computer.
Troy: It basically allows you to read and copy all hidden files stored in any type of drive, no matter the encryption level. Once you connect it, it can also break through any security wall. I dedicated years of my life and quite a bit of my sanity to develop this, but it's truly remarkable. #Conv
Troy: However, it requires some basic knowledge of operating systems in order to be able to use it properly. #Conv
Troy: Once I realized that my days in Cristina's world, or the world in general might be numbered, I secretly started to retrieve files from her devices. #Conv
Troy: I couldn't go through her devices that often, because she was very wary about them. However, a couple of times, she accidentally let her "work" phone exposed and I managed to extract some data. #Conv
Troy: From what I understand, she also had other much more private streams of communication, whatever that could be. Still, you can take this for what it's worth. #Conv
Troy hands the computer over to Noah.
~ inventory += tracker
Troy: I never bothered inspecting what's in there. This whole process lasted about two weeks or so, then I disappeared overnight for my own good. #Conv 
Troy: I hope this gives you some leverage. I'm not in a position to tell you more, I'm sorry. Good luck on your mission. #Conv

The two detectives thank the man and take off.

-> END
=== checkpoint ===

->END
