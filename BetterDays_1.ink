LIST inventory = photo, shell,bible,okamoto_footprints, elaines_box, claudia_wine_sample, cristina_wine_sample, tracker, red_pill, green_pill, blue_pill, clip, terrells_gun, magnet, cigarette

LIST evidence = corpse_state, murder_weapon, second_shell, richters_comp, claudias_records, astrecamine_sample, bottle_sample_clear, necklace, pill_is_astrecamine, daria_document, unlocked_drawer, cristinas_mark, scene_footprints, palmers_photo, crate_of_astrecamine, crate_of_guns, crate_of_chips


LIST statements_ = ritas_arrival, no_missing_property, scanner_malfunction, calm_neighbors, cristina_not_there, hana_saw_cristina,hana_pills_unpredictable, james_theory, artuso_dislike_isenberg, elroy_hates_them, elroy_heard, not_church, richter_saw_cristina, ritas_late_confession, hana_dislikes_isenberg,okamoto_blames_rita, richter_blames_rita, elaines_confession, troys_ex, cristina_accusing_rita

LIST state = neutral, box

LIST profiles = Denis, Rita, Claudia, James, Hana, Cristina, Emerson, Elroy, Skid, Troy, Richter

LIST skid_favor = nothing, warning, took_money

LIST suspicion = none, mild, worrying, alarming

LIST stat_direction = one, two

VAR blunt = false
VAR motel = false

VAR choice_one = false
VAR choice_two = false

VAR decrease = false
VAR increase = true

VAR wontpayhim = false
VAR wontpayher = false

VAR visited_hotel_morning = false
VAR visited_hotel_night = false

LIST timetable = Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Monday, Next_Tuesday, Next_Wednesday

VAR gave_cristina_number = false
VAR day = Tuesday
VAR day_gave_pills = Next_Wednesday
VAR day_met_hotel = Next_Wednesday

LIST timezones = morning, night

VAR time_of_day = night
VAR mins_in_richters_office = 0
VAR mins_in_okamoto = 0
VAR holdup = 0

VAR HP = 50
VAR maskedman = 30

VAR XP = 500

VAR audacious = 1
VAR analytical = 1
VAR sly = 1
VAR empathetic = 1
VAR rogue = 1

VAR handyman = 1
VAR versed = 1
VAR stealthy = 1
VAR rhetor = 1
VAR observant = 1

VAR money = 10000

VAR accused = "Willford"
VAR partner = "Milton"

VAR cristinas_call = true 
VAR played_message = false

VAR string_example = "Jennifer"

VAR willford_suspicion = none

VAR cristina_suspicion = none

VAR opened_drawer = false


VAR claudia_sample = false
VAR cristina_sample = false

VAR found_pick = false
VAR jammed = false
VAR accepted_job = false
VAR custodian_charge = false

VAR caught_mentor = false
VAR caught_cristina = false


LIST interest = low, medium, significant

VAR cristinas_interest = none

VAR troys_trust = low
VAR elroys_trust = low

//~ SEED_RANDOM(RANDOM(1,100))


-> get_in_car




    === troy_shot ===

    Noah tries to instantly aim for Troy's gun, but in the heat of the moment, he misses. #shot
    Kiara watches her husband lying on the floor with a surprised expresssion engraved on his face and a river of blood spurting from his chest. 
    A strange tingle overwhelms Noah. It's not the typical neural discomfort caused by the mechanical arm, this feels a hundred times stronger.
    He can see the wife hysterically crying, trying to help her husband, his partner trying his best to maintain his composure, but he can't hear a thing.
    I gunned down an innocent man. There's no going back. #Thought
    It's over. #news
    *[...]
    
    -> shot_news
    
    = shot_news
    #background #newslady
    "Breaking News, ladies and gentlemen, a police detective shot down an unfortunate 45 year old man in his home in Vo Ngang last night, in front of his wife. Sources say that the helpless victim had sensitive information regarding a case that the deranged detective was working on."
    "The policeman willingly came forward to the local authorities, claiming he acted hastily in self defense. A handgun was found to be in the victim's possession at the scene of the crime, seemingly backing up the perpetrator's claim." 
    "Due to the policeman's cooperation and the supporting evidence, it is believed that he will avoid a life sentence, although he could be up to a 15-year sentence."
    "No matter the outcome, the incident sparked a wide outrage with hundreds of people fiercely protesting against police brutality all over the city. We'll be broadcasting live these scenes of chaos in a minute, please with us."
    -> END
    
    === noah_shot ===
    #background #black
    A thunderous shot is heard momentarily, before a piercing ringing is all that Noah can hear. 
    Everything becomes a blur, while he realizes that he's no longer on his feet. #shot
    
    A brief, strange moment of calmness and peace, as he faces the ceiling.
    And then, darkness... #news
    *[...]
    -> noah_died
    
    = noah_died
    #background #newslady
    "Ladies and gentlemen, we're bringing you some breaking news, a police detective was shot down by a 45 year old man last night. The shooting took place in the 45 year old's home, while the detective and his partner were there to interview him about an ongoing case." 
    "The perpetrator willingly escorted himself to the local police station."
    "The procedural questioning was said to be brief, as the 45 year old man only claimed that he felt threatened and that he acted on self-defense. Oddly enough, his behaviour gave the officers the impression that he just wanted to get the process over with."
    "More details are expected to emerge over the next days surrounding this bleak tragedy. Changing gears to lighten the mood, you can customize your meals into a one-inch pill ! A groundbreaking invention by the faculty of the University of Volaron allows users..." 
   
    -> END


=== function fight(a) ===
~ temp noah_luck = RANDOM(-1,5-a/2)
~temp masked_luck = RANDOM(-2,2)
~ temp masked_attack = RANDOM(5,8)
{
    -noah_luck == -1:
    Noah missed !
    
    -noah_luck == 0:
    ~maskedman = maskedman - a
    {~Noah |The detective }{~delivers |throws |lands |lays }a {~solid |steady } {a==5:punch|kick}.
    
    -noah_luck == 1:
    ~maskedman = maskedman - (a+noah_luck)
    {~Noah |The detective }{~delivers |throws |lands |lays }{a==5:{~a forceful |an effective }punch|{~a devastating |an explosive }kick}.
    
    -noah_luck == 2:
    ~maskedman = maskedman - (a+noah_luck)
    {~Noah |The detective }{~delivers |throws |lands |lays }a {brutal |nasty } punch.
    
    -noah_luck == 3:
    ~maskedman = maskedman - (a+noah_luck)
    {~Noah |The detective }{~delivers |throws |lands |lays }{a devastating |an explosive }punch.
}

{
    -masked_luck < 0:
    The masked figure missed !
    
    -masked_luck == 0:
    ~HP = HP - (masked_attack + masked_luck)
    The {~masked |mysterious |unknown }{~man |figure |person }{~delivers |throws |lands |lays }a {~solid |steady }{~blow|hit}.
    
    -masked_luck == 1:
    ~HP = HP - (masked_attack + masked_luck)
    The {~masked |mysterious |unknown }{~man |figure |person }{~delivers |throws |lands |lays }{~a forceful |an effective }{~blow|hit}.
    
    -masked_luck == 2:
    The {~masked |mysterious |unknown }{~man |figure |person }{~delivers |throws |lands |lays }{a devastating |an explosive }{~blow|hit}.
    
}




=== function try(a,b) ===
~ temp rand = RANDOM(1,6)
~ temp result = a + rand
    { result >= b:
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
        #background #dayfont
    - else:
        #background #nightfont
}

~state = neutral

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


{
     - day == Sunday && cristinas_call == true && (time_of_day == night && ((LIST_COUNT(evidence) >= 10) or gave_cristina_number == true)) :
    Back home, the detective's device starts ringing. It's a call from Cristina Artuso.
    Why would she call me on a Sunday ? #Thought
    
    *[Answer.]
    Noah: Hello, Ms.Artuso. Is everything alright ? #Conv
    Cristina: Hello, detective. I'm very sorry to disturb you, in case you're not on duty. I just feel the need to talk to you, it's important. You can come to my house later in the evening. If it's your day off, I understand, you're human too, after all. #Conv
    
        **[Accept.]
        Noah: Don't worry, I can make it. What time should I be there ? #Conv
        Cristina: Around 20:00 would be good, if it's no problem. #Conv
        Noah: Good, 20:00 it is, then. #Conv
        
        ~XP += 40
        
            ***[...]
            ->cristina_sunday
        
        **[Decline.]
        Noah: I'm sorry, I won't be able to do so today. You can call the precinct and ask for my partner, {partner}, though. He will brief me tomorrow morning and I will get back to you as soon as possible. #Conv
        Cristina: I see. Alright, detective, have a good evening. Again, my apologies. #Conv
        The call ends.
        Quite odd. She calls me several days after our conversation, let alone on a Sunday. Nevertheless, if it was really urgent, she would have insisted. I guess I'll find out tomorrow.
        ~cristinas_call = false
            ***[...]
            -> final_call
    
    - time_of_day == morning && skid_favor == warning:
    Noah receives an early voice messsage.
    
    It's from "Skid"... #Thought
    The detective plays the message.
    ~played_message = true
    Skid: Mr.Taulen ! Thank you for doing business ! Our friend Terrell came here like a dog in heat, so eager to pay his debt . You sure set him straight, you little fiend ! #Conv
    Skid: Anyways, I'm a man of my word, so, time to hold my end of the deal. #Conv
    Skid:This guy I told you about, he resides in the eastern suburbs, in the Vietnamese neighborhood of Vo Ngang. #Conv
    Skid: As you take Exit 34 from here and then turn right for Chinzou, at some point you'll see the main square of Vo Ngang. There's quite a few ramen shops, I believe he lives somewhere across one of them. #Conv
    Skid: He changed his name to Troy Berkins, so you can start from that. Hope you find whatever it is you're after. #Conv
    Skid: Oh, and don't forget, next time you come around, drinks and girls are on the house. See ya ! #Conv
    The message ended.
    
    ~skid_favor = nothing
    
    
    Finally. #Thought
    
    
    
    - time_of_day == morning && day == Sunday && crime_scene.housekeeper3.give_her_money:
    It's Sunday morning and Noah wakes up early once again.
    Today is supposed to be my day off. Maybe I should catch a break indeed. A morning walk and a cup of coffee afterwards would be nice... #Thought
    
   
    
    *[...]
    -> rita_reveal
    
    - time_of_day == night && day_gave_pills == day && !examiner_pill_update:
    This afternoon in Mr.Richter's office gave the detective some perspective. 
    It's time to rest now.
    
    -> examiner_pill_update
    

    
    - day == Sunday && time_of_day == morning && !crime_scene.housekeeper3.give_her_money:
    Sunday, finally a day off. Not sure I should be relieved, though. This case has gotten to me. Maybe I should have a walk to clear my mind. #Thought
    
    *[...]
    -> rita_died
    
    - day == Wednesday && time_of_day == night && get_in_car.ask_sokolov && !sergeant_call.daria_update:
    This day is over. Time to rest... #Thought
    
    
    -> sergeant_call.daria_update
    
    -time_of_day == night:
    
   
    {~There are still things left to do...|Sun has set...The job doesn't care.} #Thought
    
    - else:
    
        
        
        {~Another rise for the sun... Grabbing some coffee and getting down to business.|Let's see what this day has in store...} #Thought
}
    
    
*{sergeant_call.daria_update and time_of_day == night and day != Sunday} [Visit 'Skid'.]
-> rosey_sqr




*{accepted_job && day != Sunday} [Visit Terrell Foe.]
I'd be better off if I did this alone.{partner} doesn't need to know. #Conv
    
    **[...]
    -> terrell_foe

* {(terrell_foe.drop_off_money or played_message or red_hole.shovegun) and day!=Sunday} [Visit Troy Berkins.]

-> cristinas_ex

* {!dr_castello and day != Sunday} [Visit Dr.Castello.]
->dr_castello

*{day!=Sunday}[Find Mr.Willford.]
->meet_james

*{(time_of_day == morning && (back_to_hotel.outside_james_room or back_to_hotel.leave_directly) && !visited_hotel_morning) and day != Sunday}[Visit the hotel again.]
-> back_to_hotel
*{(time_of_day == night && (back_to_hotel.chewed_out or back_to_hotel.leave_directly)  && !visited_hotel_night) and day != Sunday} [Visit the hotel again.]
-> back_to_hotel
*{(day_met_hotel != day && meet_james) and day != Sunday}[Go back to Willford's hotel.]
-> back_to_hotel

* {!mr_richter and day != Sunday}[Visit Mr.Richter.]
->mr_richter.meet_richter

*{inventory has bible and (analytical >= 3 or versed >=3) and day != Sunday} [Look for the coordinates in the bible.]
-> coordinates



*
-> almost_there

*
-> final_call

= almost_there

{
-LIST_VALUE(Monday) - LIST_VALUE(day) >= 2:
{LIST_VALUE(Monday) - LIST_VALUE(day)} days later...
}

{
    -crime_scene.housekeeper3.give_her_money:
    -> rita_reveal
    -else:
    -> rita_died
}


=== final_call ===
#pixel_river

//~day = Monday
~time_of_day = morning

{
    -LIST_VALUE(Monday) - LIST_VALUE(day) >= 2:
    {LIST_VALUE(Monday) - LIST_VALUE(day)} days later...
    -else:
    The following morning...
}

*[...]
->captain

= captain

#background #captain
~ temp james_points = 0
~ temp artuso_points = 0
~ temp okamoto_points = 0
~ temp richter_points = 0

The captain of the precinct calls Noah in his office early in the morning.
Captain Crawford: Taulen, I think you know why you're here. As Sergeant Jacobs informed you, there is a certain pressure on us concerning the Willford case. Apparently, a few highly regarded members of the Republic strongly vouch for the community on Stilton Avenue and deem the amount of negative publicity of the area unecessary and insulting. #Conv
Captain Crawford: I don't need to point out to you their power and influence on us. In fact, Deputy Chief Alfonso called me and demanded closing the case as suicide if we don't find concrete evidence within the first 36 hours. #Conv
Captain Crawford: However, the case seemed unusual enough to me, especially after you started reporting some interesting pieces of information. That's why I fought tooth and nail and put my name on the line in order to convince him to grant us a few more days, until Monday. Well, today is Monday and this is our deadline and there is nothing I can do about it. #Conv
Captain: So, unless you have one last compelling argument pointing to a primary suspect, we're closing the investigation effective immediately. #Conv
I hope I'm doing the right thing here... #Thought

*(accuse_james){statements_ has ritas_late_confession or evidence has unlocked_drawer or rita_died or evidence has claudias_records}[Point to James Willford.]
Noah: I think we should ask for an arrest warrant for James Willford. #Conv
Captain: You know he had an alibi for the approximate time of the incident, right ? What makes you say that ? #Conv

{
    - statements_ has ritas_late_confession:
    Noah: A few days after the incident, the housekeeper called me to alter her original statement. She told me that when Willford arrived home, he seemed upset when he learned that she had called the police. According to her, he was acting strangely and tried to convince her that she was wrong, to the point that he slightly threatened her. #Conv
    ~ james_points += 1
    - else: Noah: Here it is. #Conv
    
}

{
    - evidence has unlocked_drawer:
    Noah: The day after the incident, as I was about to take statements from the neighbors, I decided to take another look at the crime scene. I noticed that Mrs.Willford's bottom drawer had been unlocked, however I clearly remember it being locked the night before. #Conv
    Noah: Interestingly enough, earlier that day, Mr.Willford was escorted back to their apartment to to collect some personal possesions, allegedly necessary. I believe some tampering must have taken place. {statements_ has james_theory:What's more, when I confronted him about it, he came up with a weak excuse of smoking pot and right when he felt cornered, he pointed to the housekeeper.} #Conv
     ~ james_points += 1
    -else:
    Noah: Actually, there's more. #Conv
}

{
    -rita_died and (statements_ has ritas_late_confession or statements_ has james_theory):
    Noah: On top of what I just told you about Mr.Willford and the housekeeper, there's the mysterious death of the housekeeper as well. The primary witness. #Conv
     ~ james_points += 1
    -else:
    Noah: I swear that's not all. #Conv
    
}

{
    -evidence has claudias_records:
    Noah: And finally, my strongest card, a video statement by Claudia Willford herself provided by a close friend of hers, revealing that her husband introduced her to a nefarious sect and that she feared for her life. #Conv
     ~ james_points += 2
     
    -else:
    Noah: OK, maybe I'm finished. #Conv
    
}

{
    -james_points >= 3:
    Captain: This seems like solid evidence. Still, it doesn't incriminate him with the act of physical murder, but it may be enough to make a case for conspiracy to murder. #Conv
    Captain: I'll contact the magistrate, hopefully an arrest warrant is on the way. #Conv
    -> arrest_james
    -else:
    Captain: If this is the best you got after all these days, it's not going to fly. We'll only make fools of ourselves to the higher-ups and to the public eye ! It's over, the case is closed. #Conv
    
    -> no_arrests_made
}
*(accuse_hana){(inventory has okamoto_footprints and evidence has scene_footprints) or statements.okamoto_rude1}[Point to Hana Okamoto.]
Noah: I believe we should go after Hana Okamoto. #Conv
Noah: She had a very condescending attitude when I interviewed her. {statements_ has okamoto_blames_rita:One moment, she would attribute the incident to Claudia's supposed depressive tendencies and two minutes later she would throw shade at the housekeeper.} #Conv

    ~okamoto_points += 1
{
    -statements.okamoto_rude1:
    Noah: I remember hearing a bumping noise coming from somewhere inside her apartment that was clearly human-like, {statements.kenji_here:even though she had told me that her husband was absent|even though she wouldn't admit it.} When I confronted her about it, she became hostile, almost throwing me out of her house. #Conv
    
    ~okamoto_points += 1
    
    -else:
    Noah: I am very skeptical about her demeanor. #Conv
    
}

{
    -inventory has okamoto_footprints and evidence has scene_footprints:
    Noah: Now, this is very interesting.While inspecting Claudia Willford's balcony, I noticed distinct footprints and they were branching off towards the scaffold right by the balcony. The same kind of footprints were also found on Okamoto's balcony, which were placed as if someone was coming from Claudia's balcony. I know very well that construction workers' safety shoes leave no marks behind. #Conv
    ~ okamoto_points += 1
    
    -else:
    Noah: I don't know what else to say... #Conv
}

{
    -inventory has okamoto_footprints and evidence has scene_footprints:
    Captain Crawford: You're trying to tell me that an elderly woman shot the much younger deceased woman and then was able to pull of circus stunts jumping all over a scaffold ? This is your primary suspect ?! Thank God I didn't hear about the rest of them... Suicide it is, then. #Conv
    -> no_arrests_made
    -else:
    Captain Crawford: I have no clue how you connected these dots inside your head, but there is nothing tangible here ! You disappointed me. Suicide it is, then. #Conv
    -> no_arrests_made
}

*(accuse_richter){mr_richter.tuesday_night or (claudia_sample and evidence has pill_is_astrecamine) or evidence ? (richters_comp,claudias_records)}[Point to Maxwell Richter.]
Noah: My findings lead to Maxwell Richter. #Conv

{
    -mr_richter.tuesday_night:
    Noah: His alibi for Tuesday night didn't convince me. He lives right across the hallway and somehow did not react to all the commotion that the housekeeper described prior to entering the apartment. He claims he was cooped up to his studying room. #Conv
    ~ richter_points += 1
    -else: Here it goes. #Conv
}

{
    - claudia_sample and evidence has pill_is_astrecamine:
    Noah: As we had informed you, a substantial dosage of astrecamine mixed up with wine was found on site. While inspecting Richter's office, we discovered somewhat of a stockpile of small astrecamine bottles. #Conv
    -else:
    Noah: Let me see... #Conv
}

{
    - evidence ? (richters_comp,claudias_records):
    Noah: Mrs.Willford had trusted a good friend of hers with a mysterious sealed box. Unbeknown to her friend, the box contained a video statement by Mrs.Willford, where she mentioned a nefarious secret organization doing questionable neural experiments to people, members of which organization are supposedly among her neighbors. #Conv
    Noah: Werdly enough, we retrieved some equally controversial academic essays of Mr.Richter on the subject of neural implants to children. #Conv
    ~ richter_points += 2
    
    -else:
    Noah: That's it. #Conv
}

{
    -richter_points >= 3:
    Captain Crawford: This we can probably work with. We'll inform the magistrate in order to proceed with the arrest. #Conv
    -> arrest_richter
    -else:
    Captain Crawford: I don't like your chances here, Taulen. I don't think you'll get the green light from the magistrate. I think your work here is done. #Conv
    -> no_arrests_made
    
}

*(accuse_artuso)[Point to Cristina Artuso.]
Noah: There is no doubt in my mind. It's Cristina Artuso. #Conv

{
    -statements_ has cristina_not_there:
    Noah: The housekeeper never mentioned seeing Artuso at the night of the incident. It seemed strange, since she mentioned everyone else. #Conv
    
    ~artuso_points += 1
    
    -else:
    Noah: Let me explain. #Conv
    
}

{
    -statements_ has troys_ex:
    Noah: Our protected testifier, Troy Berkins, named her explicitly while claiming that the two were dating and she introduced him to a shady group comprising several members of the residence on Stilton Avenue. He said that he moved and changed his name  out of fear for his life. #Conv
    
    ~artuso_points += 1
    -else:
    Noah: This is crucial. #Conv
}

{
    -evidence has claudias_records:
    Noah: A close friend of Claudia Willford handed us a video statement recorded by Claudia herself, {statements_ has troys_ex:backing up Berkins' claims about this group|exposing the existence of a nefarious secret group based on the residence on Stilton Avenue}. She even went on to confess fear for her life, weeks prior to her passing. #Conv
    
    ~artuso_points += 1
    
    -else:
    Noah: If only we had any sort of document of Mrs.Willford validating all of this... #Conv
}

{
- inventory has okamoto_footprints and evidence has scene_footprints and statements_ has cristina_not_there and analytical > 4:

Noah: I also discovered footprints starting from Claudia's balcony and leading to Mrs.Okamoto's with the aid of a scaffold right in between. I believe that right after it happened, Artuso realized that the housekeeper could be there any moment, so in order to avoid being seen in the hallway, she decided to escape from outside to the nearest point. #Conv
Noah: {claudia_sample and cristina_sample:I believe Cristina visited Claudia under a friendly pretense and tried to poison her with a glass of wine. However, Claudia was probably suspicious of her, that's why she never drank from the poisoned glass. In an act of desperation, Artuso decided to shoot her, but missed at first, hence the fight marks. Evntually, she had her way, thought.|It is not as far-fetched as it may sound at first.} #Conv
Noah: The way I see it, that is why the housekeeper didn't see her right after the incident. Artuso stayed in Okamoto's house to calm down and clean her self up, which could mean that Okamoto is an accomplice. #Conv 

~ artuso_points +=2

    -else:
    Noah: The only thing I can't quite put together is the chain of events that transpired between the two women shortly before the incident. #Conv
}

{
    -the_crypt or evidence has cristinas_mark :
    Noah: I have a confession to make. Last night, Cristina Artuso called me, she wanted me to visit her. I know now that she was trying to {the_crypt:get me out of the picture|prize information out of me and have me on her good side}. #Conv
    Noah: Anyway, despite not being on duty, I was really curious as my suspcicions had alreayd escalated. {the_crypt: I pressured her into confirming some of my speculations and to show me the group's meeting point, an underground vault right below the building. She did, but she set me up. Someone attacked me and she ran away, although I managed to escape.| On her stomach, I noticed a tattoo of the symbol of the mystic group I described.}
    
    ~ artuso_points +=5
    Captain Crawford: What the hell are you talking about, Taulen ? And what were you thinking ?! You could have put the entire investigation in jeopardy ! #Conv
    The detective shows the captain everything he was able to document.
    
    -else:
    Noah: Had I encountered Artuso once more, maybe things would be definitive. #Conv
}

{
    - artuso_points >= 4:
    The captain stares at Noah, blatantly upset, but also concerned.
    Captain Crawford: I don't know what to say... You took so many shortcuts and not into account our procedure, in a way that makes me look like an idiot ! For your sake, I hope the judges oversee your ways and focus on the evidence. #Conv
    -> arrest_artuso
    -else:
    Captain Crawford: Not much we can do with that... If this is your primary suspect, I don't even see us taking her to court... #Conv
    -> no_arrests_made
}

= arrest_artuso

#background #court

{
    
    -the_crypt.arrest or cristina_sunday.arrested:
    
    
    ~ caught_cristina = true
    The detective escorted Cristina to the 45th precinct. Identity verification and collection of biometrics followed, soon after. 
    During the inspection of her aparment, a 99K Arnold handgun was discovered. Despite her attorney's best efforts, the evidence against Cristina didn't allow her to post bail. #justice
    Artuso later {evidence has necklace:confessed to having an affair with James Willford and} pleaded guilty to the charge of first degree murder, while also confessing the existence of the underground organization, called 'Arbor'.
    
    Subsequently, several other arrests followed, including the likes of James Willford, Maxwell Richter, Hana and Kenji Okamoto{statements.maximus:, Maximus' parents} and Emerson Palmer.
    
    -the_crypt:
    A few hours later, the magistrate issued an arrest warrant for Cristina Artuso.
    Police arrived at her work, but she had allegedly called in sick. When they raided her apartment, she was nowhere to be found. #justice
    A large portion of her belongings was also missing. Her disappearance solidified  her as the primary suspect for Claudia's murder. 
    Noah's evidence from the vault authorized more arrests, including the likes of James Willford, Hana and Kenji Okamoto, Maxwell Richter and Emerson Palmer. James confessed to having an affair with Cristina and helping her conspire the murder of his late wife, while declaring his remorse.
    Their entire operation got exposed and the missing children were located and returned to their homes.
    
    -else:
    A few hours later, the magistrate issued an arrest warrant for Cristina Artuso.
    Police arrived at her work and arrested her on the spot. #justice
     During the inspection of her aparment, a 99K Arnold handgun was discovered. Despite her attorney's best efforts, the evidence against Cristina didn't allow her to post bail.
      Artuso later {evidence has necklace:confessed to having an affair with James Willford and} pleaded guilty to the charge of first degree murder, while also confessing the existence of the underground organization, called 'Arbor', as well as their involvement in several cases of missing young people. Subsequently, several other arrests followed, including the likes of James Willford, Maxwell Richter, Hana and Kenji Okamoto{statements.maximus:, Maximus' parents} and Emerson Palmer.
      
     
    
}

{
    -get_in_car.talk_to_sokolov_2:
    *[...]
    -> bar.sokolov
    -else:
    *[...]
    -> bar.partnerbeer2
}

= arrest_james

#background #court
Later that morning, the magistrate ordered an arrest warrant for James Willford. He was located and arrested at his office in 'Ichor'.
During the interrogation, he {evidence has necklace:admitted taking his wife's necklace and handing it to Cristina Artuso per her request, since the two were secretly dating.|admitted having an affair with Cristina Artuso.} #justice
He confessed plotting his late wife's death along Cristina, while stating that he had always done so reluctantly and that he deeply regrets it.
He accused Cristina of being the main orchestrator behind the plan, the one who talked him into it and the one who commited the physical act of murder. James also exposed 'Arbor', the secret organization who indoctrinated children and conducted experiments on them. Aside from himself, he named Maxwell Richter, Kenji and Hana Okamoto and Cristina Artuso among key members.
He mentioned the mastermind behind Arbor, a man of undisclosed identity, who they simply refer to as 'The Mentor'. Much like his identity, the rest of his life remains a mystery as well, even to most key members of the group. 
'The Mentor' is now targetted by the Investigations Bureau.
~ caught_cristina = true
Within the next few hours, Cristina Artuso was also arrested and charged with first degree murder. During a search in her house, a 99K Arnold was found.
The children were located and rescued from the special facility they had enclosed them.

A lenghty trial awaits Artuso, Willford, Richter, Palmer and Okamotos, among others.

{
    -get_in_car.talk_to_sokolov_2:
    -> bar.sokolov
    -else:
    -> bar.partnerbeer2
}

= arrest_richter
#background #court
Police entered Volaron University and arrested Maxwell Richter during a lecture.
They handcuffed him and escorted him to the station. #caught
However, his lawyer visited him in jail shortly thereafter and managed to grant him the chance to post bail. The same afternoon, Richter was released from custody and returned to his home, while awaiting a trial date.

Several months later, the judge declared Richter innocent.
-> no_arrests_made2


= no_arrests_made

#background #statement
The magistrate did not issue a warrant for the arrest of {accuse_james:James Willford|{accuse_hana:Hana Okamoto|{accuse_artuso:Cristina Artuso|Maxwell Richter}}}. 
The evidence was deemed insufficient. #caught
*[...]
-> no_arrests_made2

= no_arrests_made2
The same day, Captain Crawford made the official statement, attributing the passing of Claudia Willford to suicide.
{rita_died:The investigation of Rita Stamopoulos' death was never completed and remains a mystery to this day.|Despite Rita Stamopoulos' public outcry about the investigation being hushed, nothing has changed. The police's stance remains unchanged.}
Soon after, Noah quit law enforcement and left the city. He now resides hundreds of miles out of the city, in a small fishing town where he owns and operates a bar and supports the local community.
{get_in_car.talk_to_sokolov:To this day, Daria Kozlov has yet to appear.}
The End
-> END

=== back_to_hotel ===
#background #lobby
Noah and {partner} find the opportunity to return to James' hotel.
Upon arrival, they stop by the reception. #hotel

{
    - time_of_day == morning:
    
    ~visited_hotel_morning = true
    
    A smiling, friendly young lady greets them.
    Receptionist: Good morning gentlemen ! How may I be of help ? #Conv
    
    - else:
    
    ~visited_hotel_night = true
    
    A clean-cut, stone-faced, yet well-mannered gentleman greets them.
    Receptionist: Good afternoon, gentlemen. #Conv
    
}

Noah: Detective Noah Taulen, Stillfork P.D., this is my partner. We're looking for Mr.James Willford's room. #Conv

The two men show their badges to the receptionist.

Receptionist: Sure, I will call him to his room right now. #Conv

+[...]
Receptionist: I'm afraid he is absent at the moment. I may transfer a message, if you wish. #Conv

- Noah: Could we have the number of his room at least ? #Conv

{
    - time_of_day == morning:
    Receptionist: I'm sorry, officer, I am not allowed to share this information without a permit. #Conv
    -else:
    Receptionist: I cannot do that until I see a warrant officer. It would be greatly irresponsible on my part. #Conv
} 

{empathetic > 4:{time_of_day == morning:She seems like a genuine and upright person. Maybe I should be honest to her. [Empathetic > 4]|This dude doesn't give me a compassionate vibe. Perhaps I should use other means to persuade him. [Empathetic > 4]}|What should I do...} #Thought
-> receptionist_negotiations


= receptionist_negotiations

The receptionist is curiously looking at Noah. 
+{(time_of_day == morning && wontpayher == false) or (time_of_day == night && wontpayhim == false)}[Convince {time_of_day == morning:her (Rhetor + dice roll > 6)|him}.]


    Noah: We are running a high-profile murder investigation and we have good reason to believe that Mr.Willford is hiding crucial evidence inside his room. All we need is for you to grant us access to his room, we know he is at work and he won't be back for a few hours. #Conv
    Noah: A search warrant could even take a few days to get issued and with every hour that is passing, our chances of finding it are getting slimmer. #Conv
    {
        -time_of_day == morning:
        
        {
            -try(rhetor,7) == true:
            ~XP += 40
       
        ~empathetic++
        The receptionist stands there with a look of concern drawn on her face.
        Receptionist: Look... I don't... Well, if it is that important maybe I can open the door for you for a few minutes, but you have to promise me you will be quick and cautious. #Conv
        Noah: It goes without saying. #Conv
        Receptionist: Alright. Follow me. #Conv
        The two policemen tactfully follow the receptionist to the elevator.
        -> james_room
        
            -else:
            The detective's words don't seem to mellow the young woman.
            Receptionist: I am sorry, officer, but I would be bearing a great amount of responsibility. #Conv
            Receptionist: Such instances have occured in the past, which have resulted in lawsuits. I have to follow protocol. #Conv
            This is tougher than I though... Maybe I don't have a chance. #Thought
            
            ~wontpayher = true
            -> receptionist_negotiations
            
        }
        -else:
        The receptionist{&'s face remains completely unchanged| starts to look irritated| is losing his patience}.
        Receptionist: {&I'm sorry, detective|Like, I told you before:|Sir, you're testing my patience.} This doesn't change the fact that you do not have the legal documentation required for me to do so. Now, unless I can't help you with anything else, you will have to excuse me. #Conv
        
        ~wontpayhim = true
        -> receptionist_negotiations
    }

+[Bribe {time_of_day == morning:her|him}.]


~rogue++
Noah: You know, I won't leave you empty handed. #Conv
The detective reaches for his wallet and places {money>=3000:3000|{money}} meridians discreetly on the counter.
Noah: {money<3000:It's all I have left at the moment.|I hope it's enough.} #Conv
{
    -time_of_day == morning:
    Receptionist: How dare you bribe me, sir ? This is highly unprofessional and unethical, especially from someone representing law enforcement ! I'm afraid I'm going to politely ask you to leave, otherwise I will call security. #Conv
    Damn, I screwed this up. #Thought
    Noah: Alright, alright, no need to make a fuss about it. Have a nice day. #Conv
    The two men walk shamefully towards the lobby's exit, while the woman is staring at them.
    {partner == "Milton":Milton: That was...something.|Johnson:I gotta say this, boss, you watch a lot of movies...} #Conv
    Noah: Maybe we should come back another time, some afternoon preferably. Hopefully, we'll stumble upon another receptionist. #Conv
    **(chewed_out)[...]
    
    ~timepass()
    -> next_move
    
    -else:
    
    ~ XP += 30
    Noah sees a sudden glare in the man's eyes.
    Receptionist: {money>=3000:3000|{money}}, huh. I guess that could be the cost of the number of the room. #Conv
    Noah: I need you to get me inside, too. #Conv
    Receptionist: Considering the risk I would be taking, it's only fair that I get compensated accordingly. #Conv
    **{money>3999}[Offer him {money>=5000:5000|{money}}.]
    Noah: Look, I'll give you {money>=5000:5000|{money}} and that's it. #Conv
    Receptionist: Come with me.
    {
        -money>= 5000:
        ~money -= 5000
        -else:
        ~money = 0
    }
    
    -> james_room
    **["Fine, tell me which room."]
    Noah: Fine, tell me which room. #Conv
    The detective leaves the money to the receptionist.
    {
        -money>= 3000:
        ~money -= 3000
        -else:
        ~money = 0
    }
    Receptionist: Room 34, second floor. Now, if you'll excuse me... #Conv
    {partner} and the detective proceed towards the second floor.
    -> outside_james_room
}

+(leave_directly){wontpayhim or wontpayher}[Leave.]

{
    -time_of_day == morning:
    
    ~timepass()
    
    -> next_move
    
    -else:
    
    -> side_activity
}

= outside_james_room
#background #hotel_corridor
Upon arriving in front of James' door, they realize that the door's mechanism uses a voice pattern recognition system.
Noah and {partner} are standing again right outside James' room. #pixel_river

    Noah: This is going to be tricky. The only way of opening it would be by James' voice. #Conv
    -> try_to_pry


= try_to_pry
{
    -partner == "Johnson":
    Johnson: Nothing we can do about it. If it's not an old-fashioned mechanical assembly, I can't help. #Conv
    Noah: Shit. Neither can I. There goes my money. We should come back tomorrow morning, the day shift in reception is probably covered by a different person. Maybe we'll get luckier. #Conv
    The two men leave the hotel, defeated.
    *[...]
    -> side_activity
    -else:
    Noah: Wait ! I remember you telling me about a voice analysis feature you discovered you had embedded in you. Since, you've heard of James' voice, maybe you could recreate it accurately. #Conv
    Milton: Detective, this revelation was confidential. To my understanding, this feature was either quickly abandoned by the manufacturers or it was unintentional, as we were never formally introduced to it. Nevertheless, identity fraud is against the standars and practices of law enforcement and a method I am expected to condemn. #Conv
        
        *[Try to talk him into it. (Rhetor + dice roll> 9).]
        
        {
            -try(rhetor,10) == true:
            
            ~ XP += 50
            Noah makes a compelling case about the reasons they have to do this. He mentions how James' stance has been questionable from the beginning and how this potential item could be crucial in helping to blow the case wide open. 
            Milton: While still not condoning it, I understand. Let me try. #Conv
            Milton replicates James Willford's voice with pinpoint accuracy and the door opens.
            Noah: You're the man. #Conv
            -> james_room
            - else:
            Despite his best efforts, Noah fails to convince Milton to bypass his moral reservations.
            Milton: I am sorry, detective. As long as the magistrate does not give his permission, the presumption of innocence still applies. #Conv
            Great, all of this for nothing. No point in staying here any longer. #Thought
            The two men leave the hotel, with Noah being visibly upset over the turn of events.
            {
                -time_of_day == morning:
                **[...]
                
                ~timepass()
                -> next_move
                -else:
                **[...]
                -> side_activity
            }
        }
        *[Leave.]
        Noah: I don't see any way of convincing you. Let's go... #Conv
        The two men leave the hotel, with Noah being visibly upset over the turn of events. 
        {
                -time_of_day == morning:
                **[...]
                
                ~timepass()
                -> next_move
                -else:
                **[...]
                -> side_activity
        }
}

= james_room

#background #hotel_room
Noah and {partner} scan James' room throughly, inch by inch.

{
    -day <= (day_met_hotel + 2) and !meet_james.abrupt :
    At some point, the detective discovers a small, enigmatic box. #pixel_river
    *[Open the box.]
    
    ~XP += 30
    It is a golden necklace, with a bright red gemstone as a centerpiece.
    ~evidence += necklace
    {observant > 2:This is the necklace that Claudia wore in the picture she had on her nightstand. Could this be the item he retrieved ? [Observant > 2]|Interesting piece of jewelry...} #Thought
    What does he want this for ? #Thought
    {partner}: Aside from this necklace, nothing else stands out, {partner == "Milton":detective|boss}. Maybe we should go, we are putting ouselves to great risk. #Conv
    Noah: You're right... #Conv
    
    
    -> leave_james_room
    
    -else:
    Half an hour goes by without the two men finding anything of substance.
    Noah: I'm starting to sense that we got here late. We should have visited yesterday... #Conv
    {partner}: There is nothing we can impute to him from what we see here. Besides, the more we stay here the more we are putting ourselves to risk. #Conv
    Noah: You're right... #Conv
    -> leave_james_room
    
}

= leave_james_room
The two policemen leave the hotel, {evidence has necklace:thinking how the only thing they could possibly hold on to is the strange necklace|burdened by their disappointment}.

{
    -time_of_day == morning:
    *[...]
    
    ~timepass()
    -> next_move
    -else:
    *[...]
    -> side_activity
}

    
    

=== meet_james ===

#background #cafe
The detective managed to get a hold of James Willford.
Upon James' request, Noah and {partner} agree to meet him {time_of_day == morning:the next morning|the same afternoon} at the café inside the hotel where the man is temporarily staying. #pixel_river

Noah: Thank you for meeting with us, Mr.Willford. I understand all of this still feels rough, but last time we talked, the circumstances weren't ideal. I wanted to have a more well-rounded chat with you. #Conv

James Willford: Sure, detective. I'm trying to get by... What would you like to talk about ? #Conv

-> james_conversation

=james_conversation

*{evidence has unlocked_drawer}["The bottom drawer of your wife's nightstand was unlocked."]

~XP += 20
Noah: The day after your wife's passing, I returned to your apartment for a follow up inspection. Interestingly, I realized that the bottom drawer of your wife's nighstand had been opened, yet I vividly remember it being locked the night before. #Conv

James Willford: Are you sure, detective ? We had no reason locking our drawers inside our own house. We were a couple, after all, what was there to hide from each other ? Perhaps you were mistaken. #Conv

Noah: I'm pretty sure, trust me. Coincidentally, the same day, you were escorted to your apartment by two officers, because you wanted to collect a few person things, as I was told. I assume that we could examine that day's fingerprints on the nightstand, but I find it rather unnecessary. #Conv

James Willford: Wait a second... Oh, that's right. I'm sorry, yes, I just remembered ! You see, those muscle-relaxants I've been taking these past few days can sometimes leave me in a fog... #Conv
James: No need to jump to hasty conclusions, detective. See, I have a confession to make. I have the guilty pleasure of smoking some marijuana, on occassion. Nothing alarming, mostly for medicinal purposes. Claudia was never fine with that. She tolerated it, but she was passionately against it. #Conv
James: Anyhow, one day we got into an argument about me using a little more than what we had agreed on, she snapped and hid it somewhere. She wouldn't tell me where, though. The day I went over to pick up some of my things, I decided to give it a last shot and look inside her drawer, because I felt the need to smoke, who can blame me ? To my convenience, my hoard was there... #Conv

    **[Ask him where he keeps it.]
    Noah: Where do you currently keep this stash, Mr.Willford ? #Conv
    James: Well, how is this relevant to the investigation, detective ? I understand that it is not technically legal, but should I really contact my lawyer over such a frugal amount ? #Conv
    {sly > 4: Something doesn't seem right. Maybe I should find a sneakier way to confirm his story... [Sly > 4]} #Conv
    
        ***(abrupt)[Ask him to show you.]
        Noah: I'm afraid me and my partner are obliged to validate that. We civilly request that you show us. #Conv
        James: I know my rights, detective. I don't know what this is about or whether you're simply trying to abuse your power, but you'll need a permit for that. If you insist, I should call my lawyer. #Conv
        Noah: No need, Mr.Willford. #Conv
        -> james_conversation
        
        ***[Let it go.]
        Noah remains silent for a moment. #Conv
        Noah: No need, Mr.Willford. #Conv
            -> james_conversation
            
    **(smart)[Change the topic.]
        
        ~ XP += 20
        
        ~sly++
        Noah: No sir, pardon me. So, you have returned to you work, from what I understand... #Conv
        James: Yes, tomorrow actually... I know it sounds far-fetched, everybody's been telling me that I should take some time off and they can't believe how I'll able to perform back in the office. The truth is, it's my only way of coping, at the moment. #Conv
        James: My boss insisted that I take a small sabbatical, but I was adamant. If I stay idle, self-pitying for one more day, I will lose my mind ! I need a reason to not think about Claudia 24/7... #Conv
        Noah: I don't know what to say, maybe it's for the best. #Conv
        -> james_conversation
*["Was you wife expecting someone on Tuesday night ?"]
Noah: Was you wife expecting someone on Tuesday night ? The glasses of wine we found suggested that she wasn't alone while you were out. #Conv

James: No, I don't believe so ! She hadn't told me anything like that. Did you find fingerprints ? #Conv
Noah: No. #Conv
James: Then, how can you say so ? What did you find exactly ? #Conv

{sly>3: He seems a little too adamant that she had to be alone, almost like he's trying to convince us and also see what we know... (Sly > 3)|Could she have been alone ?} #Thought
{empathetic>3:He sounded overly defensive, in a slightly aggressive way. (Empathetic > 3)|I just can't decipher his behavior...} #Thought

    **[Tell him.]
    
    ~XP += 30
    
    {
            -evidence has second_shell:
            Noah: Remains of a second bullet were extracted from your bedroom wall, as well as from the floor. That alone leaves very little chance of suicide.
            -else:
            Noah: If you insist...
    } 
    Noah: There were bruises found on your wife's face and arms, estimated to have occured around the time of the incident. #Conv
    {
        - claudia_sample:
        
    Noah: Inside the bathroom, we found shatters of a glass of wine. How the glass broke remains a mystery, but the wine drops still on the glass contained a lethal dosage of astrecamine, a dangerous type of sedative. Yet, no astrecamine was found in your wife's system.
    -else:
    Noah: That had to be neither accident, nor self-inflicted.
    } #Conv
    {
        - evidence has scene_footprints:
        Noah: Finally, what appear to be footprints were spotted across the wall right next to your balcony, leading to the scaffold.
        -else:
        Noah: Need I say more, Mr.Willford ?
    } #Conv
    
    James seems very much taken aback by the detective's findings.
    James: Detective, I-I really don't know what to say... This is too much information to take in at once ! Give me a moment, please.#Conv
    The two policemen let the man soak all of it in.
    James: I think it's clear as day now. I don't want to admit it, but I have to, at this point ! Our housekeeper !! #Conv
    
    James: She was the one who found Claudia ! She did it, detective, how can you not see it ?! #Conv
        
        ***["I doubt it."]
        Noah: I doubt it. The street camera corroborates the timeline of her version of the events and we have no evidence to back this up. Besides, why would she call the police, instead of sneaking out ? #Conv
        
        James: I don't know, Mr.Taulen, but don't tell me I'm crazy. I always sensed a strange vibe from her. It has crossed my mind before that she might have had feelings for my wife... Seeing how these weren't reciprocated, she must have commited a crime of passion... #Conv
        James: I'm telling you, that's it ! You have to look into it ! #Conv
        
        
        
        ***["Could she have a motive ?"]
        Noah: Could she have a motive ? #Conv
        James: I know this might sound silly, but it could be all too real. I always sensed a strange vibe from her. It has crossed my mind before that she might have had feelings for my wife... The way she looked at her, talked to her, how she avoided me and rushed to leave whenever I would come home... #Conv 
        James: Claudia not reciprocating these feelings must have costed her too much, to the point that she commited this crime of passion.
        
        ---James: Claudia herself had secretly told me about the housekeeper's sexual orientation. How she preferred women. One day, she just opened up to her. How could I have not seen it... #Conv
        
        {analytical > 4:He took a second to come up with an answer... Maybe to craft this theory ? (Analytical > 4)|That is also a theory...} #Thought
        
        ~ statements_ += james_theory
        -> james_conversation
            
    **[Don't tell him.]
    Noah: I am not authorized to share this type of information with third parties, Mr.Willford. #Conv
    James: Maybe you should reevaluate your evidence, is all I'm saying. #Conv
    -> james_conversation
    
* -> leave_hotel

= leave_hotel
Noah: That will be all, Mr.Willford. My apologies if we upset you, just trying to be thorough. We wish you a smooth readjustment to your work. We'll keep in touch for anything new. #Conv
James bids farewell to the two men with polite dispassion. #Conv
Noah: He definitely took something from his wife's locked drawer. We need to find a way to search his hotel room. He doesn't leave the hotel without our guys' eyes on him. Chances are that whatever he's hiding is up there. #Conv
{partner == "Milton":Milton: The ethical approach requires the request of a warrant. Anything else would be against our code of conduct.|Johnson: I like your style, boss ! Screw the warrant, there's no chance of one getting issued. Let's rock & roll.} #Conv
Noah: The warrant won't happen, I've been around the block for a while. One of these days, we should come back and find our way in his room, while he's gone. #Conv
The two men leave the hotel for now. 

~ day_met_hotel = day

{
    -time_of_day == morning:
    *[...]
    
    ~timepass()
    -> next_move
    
    -else:
    -> side_activity
}



=== cristina_sunday ===

#background #cristinas


Noah arrives at Cristina's apartment, 20:00, sharp.
~timepass()
Cristina greets him and shows him in. Her outfit looks sleek and compliments her accordingly. #old_city
{sly > 4: She put a little too much effort on her appearance, given the occasion. [Sly > 4]} #Thought
Cristina: Thank you so much for coming, detective ! I understand that you're very busy, but it means a lot to me that you still found the time. First of all, would you care for a drink ? I have some very fine Italian amaretto. #Conv
{evidence has necklace and observant > 4:Something else about the woman's appearance tonight stands out to the detective.|The detective can't help but stare on ocassion.} 
 {rogue < 3: This wouldn't be professional on my part. [Rogue < 3]|This could be fun.} #Thought
 
 *(accept_drink) [Accept.]
 

 ~rogue++
 
 Noah: That would be great, thank you. #Conv
 Soon enough, Cristina returns with two glasses of amaretto and the bottle.
 Cristina: You know, detective, someone could have called me inappropriate, but the other day you struck me as such a class act that you really earned my trust. That's why I feel comfortable talking to you in this setting. #Conv
 
 *(decline_drink) [Decline.]
 
 
 {
    -rogue > 1:
    ~rogue--
 }

Noah: No, thank you, it wouldn't be appropriate on my part. A glass of water would be fine. #Conv
Cristina: Pardon me for my boldness, detective, it's just that you made a great impression on me the other day with the way you handle the case. #Conv

- {evidence has necklace and observant > 4:Suddenly, Noah realizes what stood out to him before about Artuso.}
{evidence has necklace and observant > 4: This can't be... She's wearing Cristina's necklace ! The one James kept to his hotel room !} #Thought
Noah: No problem. What did you want to talk about ? #Conv
Cristina: You know, these last few days have been a real struggle for me and for the other residents, too. Strangely, with each day I'm getting more scared and confused. Is there any update that you can share ? #Conv

-> cristina_dialogue

= cristina_dialogue

*(arrested){evidence has necklace and observant > 3}["Nice necklace. Where did you get it ?"]
Noah: This is a pretty necklace you're wearing. May I ask, where did you get it from ? #Conv

~XP += 20
Cristina: Oh, thank you ! It was actually a gift, they told me they got it from a jewelry shop in Sicily which makes detailed custom pieces. #Conv

Noah: If I'm not mistaken, Mrs.Willford had a very similar necklace, too, I saw it in the picture she had on her nightstand. In fact, I believe it's identical. #Conv

Cristina: Oh, right, yes. She liked it very much when she saw it, so much so that I asked for a nearly identical one from my friend who knew this place. As I said, these pieces are all handcrafted and one of one, so it may look identical, but it's not. #Conv

Noah: Pardon me, but I don't remember you wearing it, last time we talked. #Conv
Cristina: It's quite possible. I usually take it off when I'm home alone, I think it makes sense. #Conv

Noah: While inspecting Mrs.Willford's apartment, we searched thoroughly, but whe didn't notice such a necklace. #Conv
 Cristina: I don't know what to tell you, detective. I was never in charge of Cristina's wardrobe and I don't know what you're trying to imply here. #Conv 
 
    **[Arrest her.]
    The detective puts out his handcuffs. 
    Noah: Ms.Artuso, I'm afraid you're under arrest for the murder of Claudia Willford. #Conv
    Cristina: WHAT ?! Are you out of your mind ?! This is nonsense, I'm contacting my attorney immediately ! #Conv
    Noah: You have the right to remain silent. Anything you say can and will be used against you in a court of law. You have the right to talk to a lawyer for advice before we ask you any questions. You have the right to have a lawyer with you during questioning. If you cannot afford a lawyer, one will be appointed for you before any questioning if you wish. If you decide to answer questions now without a lawyer present, you have the right to stop answering at any time. #Conv
    Cristina: You'll regret this... #Conv
    
        ***[...]
        
        ~ day++
        ~ timepass()
        -> final_call.arrest_artuso
    
    **[Don't arrest her.]
    Noah: I see. #Conv
    
    
        ***[...]
        -> cristina_dialogue
    
* {rita_died} ["Mrs.Willford's housekeeper was found dead this morning."]
Noah: I'm assuming you didn't hear about this, but Mrs.Willford's housekeeper, Rita Stamopoulos was found dead this morning. A boat discovered her in the Hagslow River. #Conv
Cristina: Oh, my God. This is terrible ! But, how, why ? #Conv

    ** [Tell her what you read.]
    Noah: The police is still looking for motive. They don't presume foul play, for now. As far as this continues to be the case, they'll call it suicide. #Conv
    Cristina: I don't know what to say... I'm devastated. Maybe being the one who discovered Claudia's body took a serious toll on her. She worked for the couple for years, after all. Poor woman ! #Conv
    
        ***[...]
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
            
                ****[...]
                
                ~day++
                ~ timepass()
                -> final_call
        
        ***["She didn't see you when the word got out."]
        Noah: When the neighbors got notified about what happened, she didn't mention seeing you. It felt strange, since she mentioned the other neighbors and you were here, according to you. #Conv
        Cristina: If she deliberately stated anything like that, it's a lie. I sincerely hope that it's a misunderstanding and that she didn't have motive to have me put under the microscope. #Conv
        Cristina: Like I told you the day we met, I was in deep sleep at the time of the incident. It wasn't until much later when I realized what had happened. Maybe she didn't notice me in all that commotion or she simply forgot to mention me, but I was there. You can ask the other residents, they can testify. #Conv 
        Cristina: What is with this distrust all of a sudden ? Did it really cross your mind that I could do this to my friend ? #Conv
        
            ****["No, just going over the statements. (Leave)"]
            Noah: No, I'm simply going over the witnesses' statements in my head. I'm sorry but I don't have any updates worth sharing at the moment. Now, you must excuse me, but I should be going. You can always contact our task force if you feel the need to. Goodnight. #Conv
            Cristina looks slightly perplexed, as she escorts the detective to her front door.
            {empathetic>4:Didn't seem particularly shook by Rita's passing. Her friend's housekeeper for years... [Empathetic > 4]|I need to start sorting things out...} #Thought
            {sly>4:{empathetic>4:But that's not all. }She kept seamlessly suggesting Rita's involvement, throughout the conversation. I don't recall her doing so while she was alive...|At this point, I'll have to weigh my options.} #Thought
            The detective returns home to review the situation.
                *****[...]
                
                ~day++
                ~ timepass()
                -> final_call
            
            ****["I'm sorry. How can I be helpful ?"]
            Noah: I'm sorry. How can I be helpful ? #Conv
            Cristina: I don't know, to be honest. I mean, you're doing your job, obviously, what more could I ask from you ? I have an unwavering amount of appreciation for what you and your colleagues do. #Conv
            Cristina: But, when times are tough, I really struggle inside this empty house. My friend died so ghoulishly and mysteriously right above me and I have to deal with the sorrow, the fear, the anger, the doubt. And once this door closes, I'm all by myself, nobody to lean on. These last nights felt like falling into madness. #Conv
            Cristina: Since you probably have experience in similar cases, I wondered if you have any advice for people close to the victim. Needless to say, I wouldn't bother calling you, hadn't you struck me as such a reliable and sensible individual...  #Conv
                
                *****[...]
                -> flirt
        
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

*
-> leave_early

= leave_early
Noah: Excuse me, but I realize that this is an inappropriate time to visit. I must go. #Conv
Despite Cristina's best efforts, the detective insists on leaving.
I shouldn't have been here... #Thought

-> final_call

= flirt
Noah:{cristina_dialogue.flirt_back: What about you ? A woman such as yourself can't possibly stay alone.|I don't mean to sound intrusive, by any means, but, if you have a partner, you could ask them to stay with you. It would make you feel more secure.} #Conv

Cristina fiddles with her hair playfully. #flirty

Cristina: Not thrilled to inform you that I am indeed single, haha. You know, focusing on my career doesn't leave me with that much time to fool around. Having said that,  If I'm spending the little time I have left in the week with someone, they have to know what they want, but they are hard to find these days. Do you know what you want, detective ? #Conv
{rogue > 4: What's wrong with a little more "hands-on" investigation ? [Rogue > 4]} #Thought
{empathetic > 3:This seems highly unethical. [Empathetic > 3]} #Thought

* ["Yes."]


~rogue++

Cristina and the detective come closer to each other. Despite the circumstance, Noah could not deny her appeal. They start kissing, before slowly undressing.
Cristina: I could tell you wanted this from the first day you came here. I promise, it's worth it ! #Conv
    Noah spots signs of a couple of bruises and scratches on her neck and back.
    Noah: What's up with those ? #Conv
    Cristina: Don't worry. I'm just a little naughty in bed. These are from some time ago, don't let them make you feel less of me... #Conv
    
With Cristina's blouse off, Noah notices a miniscule symbol on Cristina's stomach.Noah gradually succumbs to the temptation.

~ evidence += cristinas_mark

{
    -evidence has claudias_records or statements_ has troys_ex:No way ! A symbol resembling the letter "A"! She's indeed a member of the "Arbor" !
    -else:
    I'll probably regret this in the morning... But not right now.
} #Thought

    **{evidence hasnt claudias_records and statements_ hasnt troys_ex} [Proceed.]
    
    
    ~rogue++
    
    -> get_together
    
    **{evidence has claudias_records} [Make her lead you to the vault. (Rhetor + dice roll > 8)]
    
    {
        -try(rhetor,9) == true:
        
        ~XP += 50
        Noah: Wait, I have an idea. Let's build some tension, first. It makes it so much better. Meanwhile, there's this place I wanna show you. Let's go and you'll see. I promise you, it's worth it. #Conv
        This caught Cristina off guard. #pixel_river
        Cristina: Tension, huh ? I like it when a man sets the night's pace. Take me to that place, detective... #Conv
        As they walk across the building's entrance hall, Noah stops next to the painting.
        #background #portrait
        Artuso looks confused.
        
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
        
            ***[...]
            -> the_crypt.crypt_with_cristina
        -else:
        
        ***[...]
        -> cristina_refuses
    }
    
    **{evidence has claudias_records or statements_ has troys_ex} [Go home.]
    Noah: I'm sorry, this isn't right. It's unethical, I shouldn't even be here. I have to go. Let's keep things formal from now on. For anything case related, you can contact the precinct. #Conv
    Cristina restrains herself, too, although reluctantly. #old_city
    Cristina: You're right, I don't know what came over me. Excuse me for my behavior, I just liked something about you. #Conv
    The detective grabs his coat and storms out of the apartment. On his way to the car, one thing has become clear in his mind.
    She's way deep into this, whatever this is exactly. Tomorrow, we may have to take her in for questioning. #Thought
        ***[...]
        
        -> final_call
    
* ["No. (Leave)"]



~empathetic++
Noah: No, on your terms, I don't. Excuse me, I have to go, this was a mistake. #Conv
She gets taken aback. #old_city
Cristina: It's ok, detective, nothing happened, you don't need to go ! #Conv
Before Cristina gets the chance to properly finish her sentence, Noah is already walking towards the door. He opens it and disappears with a shameful feeling, in the still of night. 

    **[...]
    ->final_call

= get_together
The two of them start spending a passionate evening together. During this time, Noah's actions elude his better judgement, while both of them enjoy it for what it is.

*[...]
-> ambushed.succeeded2

=== cristina_refuses ===
Cristina notices Noah's sudden uncomfort.
He made it pretty obvious, too. #pixel_river
Cristina: What's wrong ? #Conv
Noah: It's nothing... I just felt a little rush, it's probably vertigo, I've had it in the past. Would you mind going for some fresh air ? #Conv
Cristina: Well, you can open the window and step out on the balcony here. #Conv
Noah: No, I think I need to walk a little bit. Come with me, a quick stroll around the block and we'll continue where we left off, I promise. #Conv
Cristina: Sorry, my legs are killing me. If you don't want to go to the balcony, another time, maybe. #Conv

*[Tell her to show you the crypt.]
Noah: There have been reports about a crypt inside this building and I believe you can show me where it is. #Conv
Cristina: I don't understand. Now you're worrying me, what are you talking about ? #Conv

~XP += 40

Noah: You can drop the act. I saw the "A" on your stomach. If you don't show me now, a squad can be here in no time and we'll find out for ourselves. How does that sound ? #Conv

Artuso's expression changes and a devious look takes form.

Cristina: Really smart, detective, good work. You've been assigned to solve a murder and you choose to study anthropology. You won't find a thing, I promise you. At least, give me a minute to use my restroom. #Conv

Artuso escorts the detective downstairs to the building's entrance hall.
Cristina: You know, we could have had a great time together, but you chose to distrust me, just to play supercop. #Conv
She places her left eyeball looking at the center of the mirror being depicted in the painting.  
#background #portrait
{versed > 3: "The Arnolfini Portrait" by Jan van Eyck. You'd always hear rumours about this painting. I wonder if it's the original{cristinas_ex:, or one of Troy Berkins' rip-offs}...} #Thought
A trapdoor emerges right next to them.

    **[Get in.]
    -> the_crypt.crypt_with_cristina


*[Leave.]
Noah: Alright, I'm sorry then. I have to leave. For anything case-related, you're free to reach out. #Conv
Cristina: Did anything happen ? Was it something I did ? #Conv
Noah: No, no, it's a condition, it happens sometimes. Good night. #Conv
The detective leaves Cristina's house in a daze. It's clear to him that Claudia's allegations are legitimate. Now, he only needs that defining piece of evidence to arrest the right person, or people. 
    **[...]
    -> final_call

=== the_crypt ===

= crypt_with_cristina


#background #crypt
{once:A large elevator takes them several levels below.|There is definitely something spooky about this vault.}
The detective sees a spacious, dimly lit venue with amphitheatrical architecture. #crypt
Across the perimeter, there is a digital mural, illustrating the human evolution. On the opposite side, there is a platform with a gothic throne on it. Facing the platform is a half-circular formation of sections of seats, much like a parliament. On the wall behind the platform, there are three doors, one in the middle and one in each corner.

*(whats)["What's with the mural ?"]
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
    
*(who)["Who is that throne for ?"]
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
        
        ~XP += 20
        
        
        ~rogue++
        Noah: Maybe I could cut a deal with your righteous leader. #Conv
        Cristina: Of course you want something out of this, you're just like every other cop in this city. We'll see about that. #Conv
        -> crypt_with_cristina
    
* (what)["What do you do in this room ?"]
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
    
    *{cristina_refuses and what and who and whats}[...] 
    -> ambushed
    *{!cristina_refuses and what and who and whats} [...]
    I think it's time. #Thought
    -> arrest_her
    
= arrest_her
*(arrest)[Arrest her.]
Noah: Ms.Artuso, you have the right to remain silent. Anything you say can and will be used against you in a court of law. You have the right to talk to a lawyer for advice before we ask you any questions. You have the right to have a lawyer with you during questioning. If you cannot afford a lawyer, one will be appointed for you before any questioning if you wish. If you decide to answer questions now without a lawyer present, you have the right to stop answering at any time. #Conv
The detective puts Cristina in handcuffs.
Cristina: You don't realize what you're doing. You're going to pay for this, I promise. #Conv
    
    **[...]
    
    ~ day++
    ~ timepass()
    -> final_call.arrest_artuso
    
    
=== ambushed ===
VAR patch_alert = false
{
    -stealthy > 4:
    Wait a second... #Thought
    *[...]
    ->failed
    -else:
    What in the world have I gotten into... #Thought
    *[...]
    ->succeeded
}
= succeeded
#background #black
Out of nowhere, the detective feels a momentary, yet explosive pain on the back of his head.
Before he gets a chance to figure out what happened, everything turns pitch-black... #smack
The detective slowly opens his eyes.
My head is killing me... Someone knocked me out cold. Wh-where am I ? #Thought
*[...]
-> succeeded2

= succeeded2
#background #tied
Instinctively, he tries to get up. But he can't.
He quickly realizes that he is tied to the chair he's sitting on. #tiedup
His hands are cuffed to the arms of the chair by thick straps, similar to his legs. The chair itself has anatomical features, it looks like the medical type. He is also stripped of most of his clothes. He is only left with his underwear.

-> hostage

= hostage
*[Shout.]
Noah: Help ! Let me out of here !! #Conv

*[Look around in silence.]
Noah looks around, trying to figure out where the have taken him. It's a cold white room, devoid of any decorations, much like a hospital. Around him he sees computers, advanced tools and expensive surgical equipment.
This is bad. I need to get out of here asap... #Thoughts


- Two men enter the room. They are both dressed in total black uniforms. Their faces are covered by some kind of eerie sacramental masks, identical to each other. They both appear to be male, judging by their physiques.

*["Who the hell are you ?"]
Noah: Who the hell are you ? #Conv
Man No.1: This is not important. #Conv

*["Where have you taken me ?"]
Noah: Where have you taken me ? #Conv
Man No.2: Not far from where you were.  #Conv

- Man No.1: The man will come to see you soon. Just wait here quietly. #Conv
Wait ! My NeuroSync Patch from work ! I think I accidentally took it home with me and then put it in my jacket. If I could find a way to gain access to my jacket, maybe I could retrieve it and put it on. Then, the squad will track down my signal... #Thought

* ["I need my pills."]
Noah: At least, let me get my pills ! I really need to take them. #Conv
Man No.1: What do you need them for ? #Conv

    **["Hard Epileptic Seiruzes."]
    Noah: When I'm under severe stress, I experience aggresive epileptic seizures ! I feel it happening any minute now ! #Conv
    Man No.2 : You have seizures when you're stressed and they assigned you to the Homicide Squad ? Nice try, but you really underestimated our intelligence. #Conv
        
        ***[...]
        -> meet_mentor
    **["Severe Asthma."]
    
    
    ~empathetic++
    ~XP += 40
    Noah: I suffer from severe asthma, which is easily triggered in such underground environments with poor air quality, dust and mold. #Conv
    Noah: Please, I might not be able to breathe in a few minutes ! #Conv
    Man No.1: Fine, we'll bring the pills over here. #Conv
    
        ***["I'll need to check inside the jacket myself (Rhetor + dice > 5)"]
        
        {
            -try(rhetor,6) == true or inventory has blue_pill or inventory has green_pill:
            
            ~XP += 20
            Noah: Actually, I'll need to check inside the jacket myself. I have them all mixed up, you won't be able to tell the difference. #Conv
            Noah: I swear, I have nothing to hide, you can feel the jacket if you don't trust me. I'm just gonna look for my pills here with you watching me. #Conv
            The men look at each other for a moment and reluctantly seem to agree.
            ****[...]
            -> patch
            
            - else:
            Noah: I'd like to have my jacket, too. It's cold in here and the humidity doesn't help either. #Conv
            Man No.1: We'll tweak the thermostat. You're not here on vacation. We'll bring you the pills and that's it. #Conv
            I blew it... #Thought
            
            ****[...]
            -> meet_mentor
        }
    
    
    **["Headache."]
    Noah: I'm having a terrible headache, as we speak ! #Conv
    Man No.1 : You'll get over it. It won't be troubling you for long anyway. #Conv
    
    Man No.2: From now on, you will stay silent, until the man arrives. Otherwise we will request authorization to silence you. #Conv
    This is not good... #Thought
    
        ***[...]
        -> meet_mentor
    

= patch
One of the men returns with the detective's jacket. One of the men unties Noah, while the other points at him with a pistol. Then, they throw his jacket at him.
Man No.1: As soon as you get your pills, we're tying you right back to the chair. Don't try anything stupid. #Conv
Good thing I actually have some pills on me, in case they want to see them.{inventory has blue_pill or inventory has green_pill:I even have some of the pills I snatched from Richter's office !|Let's hope they're not overly curious.|}#Thought
Noah pretends to be searching his jacket, while the two men keep an eye on him. They tersely start chatting and the detective senses the opportunity.
I have my hand on the patch. {analytical > 4:It will be easier to place it on my wrist, but they're likely to notice it. On the other hand, wearing it behind the ear could make it unnoticeable, but I'll have to be very careful sticking it there. [Analytical > 4] |Now, I have to be swift and wear it discreetly somewhere.} #Thought

*(on_wrist)[Wear it on the wrist.(Stealthy + dice roll > 7)]

{
    -try(stealthy,8) == true:
    
    ~XP += 20
    
    ~ patch_alert = true
    With gentle and clandestine hand movements, Noah places the NeuroSync patch on his wrist under the men's noses and gives it a light squeeze, in order to activate the silent alert and transmit the signal to his colleagues. 
    **[...]
    -> meet_mentor
    -else:
    **[...]
    -> caught
    
}

*[Wear it behind the ear. (Stealthy + dice roll > 9)]

{
    -try(stealthy, 10) == true:
    
    ~XP += 20
    ~ patch_alert = true
    In an act of exemplary stealthiness, Noah sticks the NeuroSync patch behind his right ear and squeezes it lightly, in order to activate the silent alert and transmit the signal to his colleagues. The guards don't seem to have realized anything.
    **[...]
    -> meet_mentor
    -else:
    **[...]
    -> caught
}


= caught
Man No.2: What are you doing there ?! Let me see your hand. #Conv
    The masked man recognizes the patch in Noah's hand.
    Man No.2: You think we're stupid, don't you... I know what this is. You aren't notifying anyone. You'll go to sleep until the man arrives. #Conv
    
    What...not...again... #Thought
    #background #black
    the men apply some form of gas on his face.
    
    Before the detective is able to find his words, he falls unconscious.
    
    
    *[...]
    -> meet_mentor
    

= failed
#background #henchman
The detective senses someone creeping behind him and turns around. [Stealthy > 4].

He sees a sturdy figure in an all-black outfit. Their entire face is covered by a eerie silver mask. #fight
Masked Figure: You shouldn't be here, detective. Now, it's too late. Remember, you brought this upon yourself. #Conv
The man is ready to attack Noah. 

*[Fight him.]
-> fight_figure

= fight_figure
+[Punch them. (Average Damage: 5, Low Chance of Missing)]

~fight(5)
{
    -maskedman <= 0:
    -> defeated_masked_man
    -HP<=0:
    ->lost
    -else:
    ->fight_figure
}


+[Kick them. (Average Damage: 8, High Chance of Missing)]

~fight(8)
{
    -maskedman <= 0:
    **[...]
    -> defeated_masked_man
    -HP<=0:
    **[...]
    ->lost
    -else:
    ->fight_figure
}

= lost
#background #black
The masked man's last blow stuns Noah. The man takes capitalizes on the opportunity and puts Noah in a headlock. The detective gasps desperately for air, but his surroundings start getting darker and darker.
Eventually, everything turns pitch-black.
*[...]
-> lost2

= lost2
#background #tied
The detective slowly opens his eyes.
My head is killing me... But I'm still alive...The masked guy got me good. Wh-where am I ? #Thought
Instinctively, he tries to get up. But he can't.
He quickly realizes that he is tied to the chair he's sitting on. His hands are cuffed to the arms of the chair by thick straps, similar to his legs. The chair itself has anatomical features, it looks like the medical type. He is also stripped of most of his clothes.
-> hostage

= defeated_masked_man

#background #crypt
Noah tackles the mysterious person and brings them down to the ground. He manages to apply a chokehold on them and after a few seconds, the person lays unconscious.
~XP += 70

*[Unmask them.]
Noah takes the mask off of the person's face. It's Emerson Palmer.
Noah: Palmer ?! What the hell... Then again, nothing should surprise me at this point. Everyone in this building must be part of this. #Thought
The detective takes a picture of Emerson Palmer.
~evidence += palmers_photo

Crap ! Cristina got away. I have to find another way out of here. #Thought
    **[...]
    -> get_out.main_area

=== meet_mentor ===

{
    -ambushed.caught:
    A seemingly distant murmur starts stimulating Noah's ears. He can't quite piece everything together yet, but he's able to pick up some phrases.
    
    ...waking up anytime now... ...shall we notify... ...procedure... ...afterwards...
    
    *[Open your eyes.]
    
    #background #tied
    The detective opens his eyes. Although still slightly dazed, he realizes he's still in the same room. In the other corner of the room he sees the back of a silhouette that looks familiar.
    
    The silhouette turns around.
        **[...]
        -> mentor_arrives
    
    -else:
    For the next 20 minutes or so, he sits tied down in silence, with the two men guarding him.
    Suddenly, an all too familiar figure walks in the room.
    
    *["Richter !"].
    -> mentor_arrives
    
}

= mentor_arrives
#background #richter_vault
Noah: Maxwell Richter... Not exactly a surprise. So, you are 'the man' ? The 'Mentor' ? #Conv
    Richter: Good to see you, Mr.Taulen. Be patient and all your questions shall be answered. #Conv
    
    The henchmen stand straight, as if something just intimidated them.
    Richter eagerly stands up, as well. #boss
    
    The detective feels a menacing presence approaching.
    Someone is about to arrive.
    #background #mentor
    A tall, imposing man, enters. 
    He's wearing a long, grey trenchcoat, black boots and black gloves. His face is completely covered, not by a ceremonial mask, like the guards, but by some sort of medical face mask, the kind of which is used for surgical reconstruction. 
    
    Man: At last we meet, Mr.Taulen. #Conv
    His voice sounds unnatural, as if not oranically generated.
    
    *["Who are you ?"]
    Noah: Who are you ? #Conv
    Man: I am sure you have some idea by now. Had you not, you wouldn't be in this position. Unfortunately for you, though, you are. But, I reassure you, it is for the best. #Conv
    
    Man: You might have heard of me, referred to as 'The Mentor'.
    
    *["I finally meet the so-called 'Mentor'."]
    Noah: I finally meet the so-called 'Mentor'.
    The Mentor: And I finally meet the infamous Noah Taulen, the homicide detective who almost single-handedly pulled back the curtain and got a glimpse at my vision, the work of a lifetime. #Conv
    
    - {patch_alert == true:Whatever they're planning to do to me, I have to hinder them until the police arrive.|He's got something in his mind for me. This might be the end... } #Thought
    
    The Mentor: Don't worry, I won't bother you for long... I was just so curious to meet you. #Conv
    
    *(canny)["Likewise..."]
    Noah: Likewise... great minds usually find each other. Honestly, the way you developped this whole enterprise makes me admire you, if nothing else. #Conv
    Despite his position, the detective looks at the Mentor with a canny grin on his face. 
    *(aggresive)["You don't scare me."]
    Noah locks eyes with the Mentor in a cold stare.
    Noah: You don't scare me, plasterface. In fact, I'm going to kick your ass before I hand you over to my colleagues. #Conv
    
    *(straight)["You have abducted a police detective !"]
    Noah: First of all, let it be known that you have forcefully abducted a police detective. On top of all the other pieces of evidence that my team and I have assembled, do you think that this is going to look good on you ? #Conv
    
    - The intimidating man keeps staring at Noah without the slightest expression.
    
    {
        -canny:
        The Mentor: I don't know if this is sarcasm, but either way, I admire the way you maintain your composure. #Conv
        
        -> mentor_dialogue
        
        -aggresive:
        The Mentor: Fancy words from a man who will stay immobilized, unless I say different. I don't know whether you are trying to intimidate me or you're simply letting your emotions get the best of you, but I have to assure you Mr. Taulen, either way, you won't accomplish much. #Conv
        -> mentor_dialogue
        
        -else:
        The Mentor: Thank you for reminding me, Mr.Taulen, but I am aware. Believe it or not, I don't intend to harm you. Granted that your curiosity led you to uncharted territory, I am simply looking to capitalize on the opportunity and present a solution that will benefit both of us. #Conv
        -> mentor_dialogue
        }
        
    
    
= mentor_dialogue
    
    The Mentor: You may not know much about me, but I shall fill some blanks. You see, I was no spectator to the war. I was a highly decorated military officer in Marine Corps Intelligence. For as long as I was deployed, I served with all my heart. I was young, noble and proud. #Conv
    The Mentor: It was instilled in me that it was our holy duty to defend the interests of our motherland, no matter the cost. In my case, the cost being visual impairment, spinal cord injuries, third degree burns, not to mention chronic PTSD and moral injury. During that time, it seemed like a reasonable trade, though. #Conv
    The Mentor: Then, of course the war was over. We evaded our nation's extinction by an inch, for which we would have been responsible too, might I add. Now, it was time to come back and "celebrate". #Conv
    The Mentor: But come back to what ? No spouse, because she couldn't wait forever for a shell of her man. No friends, because half of them were left on the battlefield and the other half were just as checked out mentally. No family. No job. #Conv
    The Mentor: What you get back instead is a "thank you for your service" and a check for a month's rent. It drove me to madness, almost to the point of ending my own life. #Conv
    The Mentor: The state of the government was a complete shambles, so an emergency committee was formed, taking on temporary Congressional duties. They decide upon the formation of the New Republic, a whole new body taking over as Congress, President and Supreme Court, all in one. Its members a wrecking crew of traitors and crooks with no vision or interest in the country. #Conv 
    The Mentor: 30 years after the war and so little has changed. Unemployment drug addiction and crime rates through the roof. An overpowering sentiment of degeneracy and hopelessness everywhere you look. #Conv
    The Mentor: Luckily, I had foreseeen all of this, almost 30 years ago. I started looking for likeminded people to pubs, theaters, parks to share my views, thoughts, feelings about our situation. I'm glad to say I found them. Radical, passionate, educated people from all walks of life assembled around me. 'Arbor' was founded soon thereafter. #Conv
    The Mentor: My vision was to create a dogma based on will to power, self-improvement and collectivity. What life should all be about. Beyond Man. But in order to prosper in unison, there needs to be a hive mind. And for the first time, we are so close to breaking into the mainstream and claiming the rights to rebrand society.  #Conv
    *[...]
    ->mentor_dialogue_2
    
    = mentor_dialogue_2
    
    {~This guy is mental.|Somebody should lock him in an asylum...} #Thought
    
    {
        -RANDOM(1,6) >= 5 && ambushed.on_wrist:
        One of the henchmen notices something strange on Noah's wrist.
        Man No.1: Wait a second, what is that sticker on your wrist ? It wasn't there before ! #Conv
        The second man comes to check on the detective's wrist.
        Man No.2: I know what this is ! It's one of these high-alert patches policemen wear on duty !
        Crap, they noticed it ! I should've put it behind my ear... I needed to stall them for a little longer. #Thought
        *[...]
        -> vault_good_ends.mentor_escaped
    }
    
    *["Why did you have Claudia {rita_died:and Rita|Willford} killed ?"]
    Noah: Why did you have Claudia {rita_died:and Rita|Willford} killed ? #Conv
    The Mentor: It is true that Ms.Willford posed a risk to our venture, as we discovered that she neither agreed with our vision nor our practices, yet was attepting to sabotage us rather than express her frustrations within the group and leave amicably. #Conv 
    The Mentor: However, I am not a mobster. To my understanding, other trusted members of 'Arbor' would take care of the matter in a civilized manner. Whatever transpired is beyond my knowledge or consent. #Conv
    
        **[Pretend to only be interested in the killer.]
        Noah: Maybe we can work something out, after all. The only thing I need is the identity of the person who committed the physical act of murder. If you let me go now, I give you my word that you and 'Arbor' will be in the clear. But I have to give them a name and additional evidence to shut the case. #Conv
        
        The Mentor: Mr.Taulen, I have every reason to believe that you are a brilliant man, but you have to walk me through your plan here. Why would I do that ? How can I trust you ? #Conv
        
        ~holdup += 5
        
            ***{patch_alert}["They're coming to find me as we speak."]
            -> vault_good_ends.mentor_escaped
            
            ***["You have to, because I got leverage."]
            Noah: You have to, because I have leverage. #Conv
            The Mentor: Oh, really ? You're trying to blackmail me ? #Conv
            
            Noah: I know too much. If you try anything funny with me, they're going to come after you like hounds. #Conv
            The Mentor: Trust me, Mr.Taulen, you're not going to disappear. I have something else in mind for you and I have a feeling you won't want to expose me. #Conv
            ~ holdup += 5
                ****[...]
                -> mentor_dialogue_2
                
        **["You have no shame."]
        Noah: Even at this moment, you choose to answer like a politician. You have no shame at all. #Conv
        The detective angrily spits on the Mentor's feet.
        The two guards surge forward, ready to straighten out the detective.
        
        The Mentor: It's okay, stand back. He has already decided what to believe, I cannot change his mind with my words. #Conv
        
        ~ holdup += 5
        -> mentor_dialogue_2
        
    
    *["Why do you kidnap and brainwash children ?"]
    Noah: Why do you kidnap and brainwash children ? #Conv
    The Mentor: I guess that would be the uncultured and weak minded way of interpreting my social work. #Conv
    The Mentor: The truth is that I find young people from unhealthy, underprivileged environments and I pluck them from obscurity. Youth full of potential who would have been lost causes, had I not taken them under my wing, because if I didn't, who would ? The state ? The state is the reason that these communities suffer, to begin with. #Conv
    The Mentor: We never force ourselves on them when they come with us. They do so willingly. Our recruiters simply introduce themselves and share their truth. If you were an uninsured, underaged immigrant with not a penny to your name, no permanent roof and no future, wouldn't you take advice from a fine-looking, well-spoken, educated and successful young man or woman, who is also part of a community that breeds these kind of people ? Because that's what I do. I breed greatness. #Conv
    The Mentor: But I have to break them down before I build them back up. Indeed, greatness comes at a cost. As soon as they choose to come with us, they get new identities and need to leave their past lives behind. That means friends and family. #Conv
    The Mentor: Soon after, their special education and training begin in our academy. Once they complete this journey, they are ready to take on the world and start giving back to 'Arbor'. #Conv
    
        **["Don't forget the neural implants."]
        Noah: You forgot to mention the neural implants you use on them. #Conv
        
        The Mentor: I see that you leave no stone unturned. The 'Cognitus' implant, which you're referring to, is a harmless chip that monitors our apprentices' wellness. From their sleep cycles to their cortisol levels, it keeps track and regulates everything. It also serves as a reliable diagnostical tool, providing real-time updates on potential health issues. In short, it offers them an unmatched quality of life ! #Conv 
        
        ~ holdup += 5
            
            ***["Is it part of the 'hive mind' initiative, too ?"]
            Noah: Is it part of the 'hive mind' initiative, too ? #Conv
            The Mentor: Detective, the 'Cognitus' implant is an absolute marvel of medical engineering, dare I say decades ahead of its time. Its' manufacturing and operation is above the understanding of most engineers and scientists today, let alone of a police investigator. #Conv
            The Mentor: Let's just say that it stimulates the prefrontal cortex of the brain in a way that encourages reasonable thinking. #Conv
            
            ~ holdup += 5
                ****["Reasonable by your definition ?"]
                Noah: Reasonable by your definition ? #Conv
                
                The Mentor: Reasonable for our cause. Left to their own devices, people are fickle, weak, easily swayed by lies and distractions. They needed guidance, a gentle push in the right direction. #Conv
                
                The Mentor: 'Cognitus' helps them steer away from toxic habits, behaviors, addictions and certain types of people. It cultivates the need for physical exercise and hard work. #Conv
                    
                    ~ holdup += 5
                    *****{sly>4 or analytical>4}["It also cultivates total obedience to you." (Sly/Analytical > 4)]
                    
                    Noah: It also cultivates total obedience to you. There is a certain way everyone here talks about and acts around "The Mentor". They place themselves below. #Conv
                    
                    The Mentor: You clearly don't value the true essence of respect. Our members see in me the personification of the ideas our community embraces and represents. They also see the man who started this whole thing and gave them a place to flourish. And the way they conduct themselves shows ther appreciation. #Conv
                    
                    The Mentor: If there is one thing I valued from my time in the military, it is the chain of command. We all fight for the same cause, we all put the maximum effort, but not everyone can give orders. #Conv 
                    The Mentor: A few people stand out because of their experience in the battlefield and their honed strategic skills. We entrust these people with the plan to victory. However, the margins of error during a war are very thin, therefore this social structure must be very disciplined and nonnegotiable.  #Conv
                    
                    ~XP += 40
                    ~ holdup += 10
                    
                        ******[...]
                        -> mentor_dialogue_2
                    
                    *****["It sounds noble, but forced."]
                    Noah: It sounds noble, but forced. You're messing with their brain chemistry in a way they can't comprehend. #Conv
                    The Mentor: So does an antibiotic. A vaccine. Even an aspirin. Most people don't really know what's actually inside these things. Yet, they trust the doctor, because the doctor knows better than anyone that 99% of the time the medicine will help the patient. #Conv
                    
                    ~ holdup += 5
                    
                        ******["I see."]
                        Noah: I see. Although I have some serious reservations, I can't argue with that. #Conv
                        The Mentor: I knew that you are a reasonable man. #Conv
                        
                            *******[...]
                            -> mentor_dialogue_2
                        
                        ~ holdup += 2
                        
                        ******["Do your followers have the freedom of choice ?"]
                        
                        ~ XP += 20
                        
                        Noah: Do your followers have the freedom of choice in this case ? #Conv
                        The Mentor: During a pandemic do people have the freedom to choose whether they'll get vaccinated or not ? Maybe, virtually, but it is a matter of public health, so the government must convince as many people as possible to vaccinate. #Conv
                        The Mentor: They do so, either by educating the people or by restricting their freedoms in order to exasperate them enough to change their minds. If someone is so stubborn, yet finds the government unbearable, they are always free to try to live elsewhere.  #Conv
                        
                        The Mentor: I don't force it upon anyone, but refusing to get it makes my work considerably harder. #Conv
                            *******[...]
                            -> mentor_dialogue_2
                        
                        ~ holdup += 7
                        
                    *****[Say nothing.]
                    Noah feels too drained to come up with a follow-up question. #Conv
                    
                        ******[...]
                        -> mentor_dialogue_2
                    
                ****["There is nothing reasonable about you."]
                Noah: There is nothing reasonable about you. #Conv
                The Mentor: Agree to disagree, Mr.Taulen. Although, I think you're going to change your mind pretty soon... #Conv
                
                 ~ holdup += 1
                -> mentor_dialogue_2
                
            ***["It shouldn't be done to minors."]
            Noah: It shouldn't be done to minors. #Conv
            The Mentor: There is no gray area there, detective. On the contrary, such constant internal monitoring can keep an underaged person on the right track and instill good habits in them from a young age. #Conv
            The Mentor: I can assure you that every sensible precaution has been taken into account and all the necessary tests have been thoroughly carried out beforehand. #Conv
            
            ~ holdup += 5
                ****[...]
                -> mentor_dialogue_2
            
        **["These kids have families they don't see again !"]
        Noah: These kids have families they don't see again ! #Conv
        The Mentor: Families who either can't provide for their children or even worse, don't care about them. Arbor is a much better home for these people. Like I said before, the youth join us by choice. Maybe this should give you an idea of who they consider family. #Conv
        
        ~ holdup += 3
        
            ***["Is a child suitable to make this decision ?"]
            Noah: Is a child suitable to make this decision ? #Conv
            The Mentor: Youth are much smarter than we give them credit for. Not that long ago, a young man could be eligible to enlist in this country's army and deploy to a war zone on the other side of the world for 9 months and if he came back, he could still be not old enough to buy a beer ! #Conv
            The Mentor: Maybe we should finally decide as a society what a young person is and isn't capable of. Because, if they are old enough to drive a vehicle, they can probably tell who has their best interests in mind. #Conv
            
            ~ holdup += 10
                ****[...]
                -> mentor_dialogue_2
            
            ***["This is sickening to hear."]
            Noah: This is sickening to hear. #Conv
            The Mentor: I wasn't expecting you to understand. You may be smart, but clutter-minded, like the rest of them. I hope to change that soon. #Conv
            
            ~ holdup += 2
            -> mentor_dialogue_2
            
            
    *["What's with your face ?"]
     Noah: What's with your face ? #Conv
    The Mentor: It does not concern you. #Conv
    
    ~ holdup += 1
    -> mentor_dialogue_2
    
    *
    -> times_up1
    
    =times_up1
    The Mentor: Maxwell, are we ready yet ? #Conv
    *[...]
    -> times_up2
    
= times_up2
#background #richter_vault
Richter: Yes, my Mentor. We can start any time you want. #Conv
Noah: What are you talking about ? #Conv
Richter: Mr.Taulen, I thoroughly enjoyed our conversation. However, it's not the only reason you are here. #Conv
Of course... #Thought
Noah: You're going to put 'Cognitus' in me... #Conv
He just realized the situation in which he's in.
#background #mentor
The Mentor nods deviously. 
The Mentor: I have to admit that your commitment to the investigation caused me a lot of headaches. The more you persisted, the more I needed to find a way to deal with you. As you can imagine, your position made it much more difficult for me. #Conv
The Mentor: Nevertheless, at some point I realized that your brilliant mind could be really useful to us. I only had to find a way to lure you in and I think it worked. #Conv

    {
        - patch_alert:
        *[...]
        -> vault_good_ends
        -else:
        *[...]
        -> vault_bad_ends
        
    }

=== vault_good_ends ===
They all hear running footsteps approaching.
{
    - holdup >= RANDOM(30,35):
    *[...]
    -> mentor_caught
    -else:
    *[...]
    -> mentor_escaped
}

= mentor_caught
A third masked man comes running inside the room panicked. #heroic
Man No.3: Mentor, we have a problem ! Police are outside and they have surrounded the building ! They brought at least 5 vehicles, including a K-9 Unit and a Command Vehicle ! #Conv
The Mentor: What ?! #Conv
Man No.3: They're about to comb through the entire place ! Even down here, we're not safe, we have to leave now ! #Conv
The Mentor looks at Noah, bewildered as ever. 
The Mentor: What have you done ?!! #Conv

*["No idea what you're talking about."]
Noah: No idea what you're talking about...
A sardonic grin in Noah's face agitates the Mentor even more.
The Mentor: I SHOULD HAVE KILLED YOU WHEN I HAD THE CHANCE !! #Conv
-> mentor_caught_15

*[Show him.]
Noah: See this little thing right here ? #Conv
Noah turns his head to show them the BioSync patch.
Noah: Ever since I put it on completely under your noses, it's been sending an emergency signal to every police car within a 4 mile radius. #Conv
The Mentor: YOU IDIOTS !! HOW DID YOU NOT LET HIM GET AWAY WITH THIS ?! #Conv
-> mentor_caught_15

= mentor_caught_15
Man No.3: My Mentor, we must go !! #Conv
The Mentor takes a final desperate glance at the detective, before he leaves in a hurry with his henchmen...

*[...]
#background #raid
A loud banging sound echoes through the vault.
"POLICE ! STAY WHERE YOU ARE, DON'T MOVE !" #Conv
Noah: Here ! #Conv
A swarm of policemen arrive and find Noah still stuck to the chair.
Policeman No.1: Sir, are you alright ? Mr.Taulen, right ? #Conv
Noah: Yes, I'm fine... #Conv
Not a minute goes by and {partner} springs into the room.
{partner == "Milton":Milton: Detective, how are you ? Who did this to you ? |Johnson: Boss, what the hell happened ? You scared the piss out of us ! Where are they ?} #Conv
Noah: I'm alright. You just missed them. Maybe they didn't get far. #Conv
Policeman No.1: Just give us a minute to get you off this thing, detective... #Conv
Policeman No.2: Just got word from the radio. They have apprehended four eccentric men right outside the block. #Conv
Noah: That's them... #Conv
**[...]
-> mentor_caught_2


= mentor_caught_2
#background #aftermath
Sgt.Jacobs: What the hell, Taulen... how did you night off end up like this... #Conv

*["You know me, sarge."]
Noah: You know me, sarge.
Sgt.Jacobs: At some point, I should stop asking you to explain yourself, it's pointless... #Conv
    **[...]
    -> mentor_caught_3

*["I knew Artuso had something to do with it."]
Noah: I knew Artuso had something to do with it. I thought I could get something out of her last night, that's why I accepted her invitation. #Conv
Sgt.Jacobs: Looks like you were right. #Conv
Sgt.Jacobs: They're taking the men in for questioning right as we speak. Because of everything that just transpired between you and them, you won't be in the interrogation. I'll do this with {partner} instead. We have gathered all your previous evidence as well, so it will be fine. #Conv
Sgt.Jacobs: We're sending you to the hospital to get looked at. As soon as they discharge you, you'll give your statement and then you're taking some time off. I'll take care of it. #Conv

Noah: Thanks, sarge... #Conv
    **[...]
    -> mentor_caught_3

= mentor_caught_3
#background #court
The trial took place a month after the arrest. 
The Mentor was caught. #justice
His real name is Isidore McIntyre got convicted for sedition, human trafficking, weapons charges, criminal conspiracy and attempted murder, adding up to a sentence of 150 years. Other notable figures of Arbor have also ben arrested, including Maxwell Richter, Hana Okamoto, Kenji Okamoto and James Willford, facing multiple year imprisonments as well.
Cristina Artuso pleaded guilty for the murder of Claudia Willford and got a 40 year sentence, without parole.
A large scale operation is being carried out to track down the remaining members of the organization.
~ caught_mentor = true
The missing children were found in the organization's - until recently undisclosed - training facility in Westworld Pines. Before returning to their homes, they have to undergo a basic recuperation and rehabilitation program. 

{
    -get_in_car.talk_to_sokolov_2:
    *[...]
    -> bar.sokolov
    -else:
    *[...]
    -> bar.partnerbeer2
}

= mentor_escaped
#heroic
Noah: They're coming to find me, as we speak. Whatever you choose to do with me, my colleagues already know the location. Trust me, things don't look good for you... #Conv
The Mentor: You morons !! How did you let him trick you like that ?! #Conv
Man No.2: My Mentor, we are so sorry, but we should leave as soon as possible. Right now, they are probably dispatching numerous squads, they take this matter seriously... #Conv
Staring at Noah one last time with a numb expression on his face, the Mentor reluctantly follows his henchmen and they run off.

#background #raid
Several minutes later, numerous police vehicles arrive, including a K-9 Unit and a Special Command Vehicle. 
A squad makes its way into the vault and rescues the detective.
*[...]
-> mentor_escaped_2

= mentor_escaped_2
#background #aftermath
Sgt.Jacobs: We've combed through the area, but still, not a trace from those guys... We have arrested a few residents about whom you've collected some evidence and we're about to bring them in for questioning. #Conv 
Sgt.Jacobs: We're sending you to the hospital for some first aids. When they discharge you, you'll give us a statement. Then, you're getting some time off. I think the captain will agree on that. #Conv
Noah: Thank you, sarge... #Conv

*["They mustn't have gone that far."]
Noah: They mustn't have gone that far. #Conv
Sgt.Jacobs: That's probably true. Look, we've contacted all peripheral units and we've given them your description. They've sent patrol cars and drones looking for the men you saw. We're also setting checkpoints to all the big arterial roads and points of interest throughout the city. #Conv
Sgt.Jacobs: Normally, that would be more than enough... But this bunch seems really conniving, so I don't know. #Conv

*["I can't believe they got away..."]
Noah: I can't believe they got away... #Conv
Sgt.Jacobs: Hey, the numbers were against you, you were no match to them. You did some questionable things, like meddling in this place on your day off and taking your BioSync patch home, but in an unlikely way, it all worked in our favor. #Conv
Sgt.Jacobs: With all the evidence, they'll be on our most wanted list and don't forget that we'll press their associates to tell us everything they know. #Conv

- Sgt.Jacobs: Again, I'd normally come down on you for having duty equipment on you on a day off, but it probably saved your life and the way you utilized it is quite commendable. Don't worry, you've don't a great job, overall.  #Conv

{
    -get_in_car.talk_to_sokolov_2:
    *[...]
    -> bar.sokolov
    
    -else:
    *[...]
    -> bar.partnerbeer2
}

=== vault_bad_ends ===
Suddenly, Noah realizes that there is no happy end for him on the horizon. The BioSync patch was his last hope, but now it is gone. It has become clear to him that no analysis, no rhetoric and no ruse will allow him to leave this chair in the same state he entered the building yesterday. In a strange way, his mind is now emptied and that takes a significant weight off his shoulders.

Noah: What will my life be from now on ? #Conv
The Mentor: Honestly, you have nothing to fear. You're still going to be Noah Taulen, the young and talented police detective. You're still going to like and dislike the things you already do in life, still allowed to love, laugh, have a family down the road. #Conv
The Mentor: Only from now on, you'll feel the obligation to serve 'Arbor' and view me as you Mentor. If it's any consolation, you won't feel a thing during the operation, and afterwards, everything is going to feel natural to you. In fact, whenever you think about the past, you won't be able to identify with your former self. You'll be thinking 'How ignorant did I use to be ?". #Conv
The Mentor: I know that you think of me as the devil incarnate, but trust me Mr.Taulen, I only want to build a better world. I'm not punishing you, I'm not even taking advantage of you. I'm offering you my hand to lead you to you best self. Grab it ! #Conv

*["I'd rather die."]
Noah: I'd rather die. #Conv
Noah's tone sounded cold and lifeless.
The Mentor: Don't try to be a hero, detective, I am not going to fall for that and let you walk by. #Conv
Noah: I mean it. The only thing that makes life worth living is that we get to dictate it. If I can't do that anymore, it's a pointless torment. Seriously, I'd appreciate it if you killed me instead. #Conv 
The Mentor is taken aback by Noah's poignancy and self-reflection. The Mentor sees in him virtues that he himself holds to very high regard.

The Mentor: I was blinded by my ego and self-defense insticts, being adamant about putting the implant in you. It is a way for me to both neutralize you as a threat and use your talents for my purpose. But what I said before is true. I don't force this on anyone. A Götzenbild must abide by their code. #Conv
The Mentor: Of course, the sacrifices I have made for my vision don't allow me to put it in any danger. Tha is why I can't let you leave this vault like nothing ever happened. Are you sure you want this ? #Conv
Noah: I am. #Conv
The Mentor takes a few moments to recline in silent contemplation.
The Mentor: Vey well. I am not a vindictive spirit and I don't take pleasure in hurting others. Therefore, it will be painless. Dr.Richter will prepare a special injection. #Conv
The Mentor: I truly appreciate your character, detective. I see so many traits in you that I want to model this world after. It is a real shame that we couldn't see eye to eye when it comes to the way we go after change. #Conv
Noah doesn't say a word. He simply stares into nothingness. #Conv
The Mentor: Anyhow, it's been a pleasure... #Conv
The Mentor leaves and Dr.Richter prepares the syringe. 

    **[...]
    ->sacrifice



*[Say nothing.]
The detective utters no word as he stares into nothing.
The Mentor: I knew you'd come to your senses. You and I are going to accomplish great things, together. #Conv
    
    **[...]
    -> became_a_drone

= sacrifice
#background #newslady
BREAKING NEWS
"Good evening, ladies and gentlemen." #news
"The mysterious disappearance of a policeman has caused much unease to both law enforcement and the community in Stillfork. Police detective, Noah Taulen, 35 years old, was last seen this past Sunday, morning, inside a local café on Staley Street, near his house. A large-scale investigation is currently underway. Before going missing, the detective was working on the bizzare case of Claudia Willford, which caused a stir throughout the city.
Motives behind his disappearance remain unclear, albeit his investigating partner and a few people related to the case suspecting foul play. No new updates have been provided as of now, but we will following the story closely.
In other news, "Sunlight", the radical reformist party, marked a significant gain in momentum in December's polls, bringing them one step closer to being able to elect their representatives for the Republic. Many attribute the party's sudden surge in popularity to the new leader, Maxwell Richter, who, they say, applied an 'extreme makeover' to the party.
Ladies and Gentlemen, this is all the time we had for this evening. Stay tuned to our channel for the much awaited premiere of our reality program "Cache Me If You Can !"

The End.

-> END

= became_a_drone
#background #routine
Noah returned to his everyday life, as early as the next day. His demeanor never changed towards his friends and colleagues. He continued to do his job seamlessly, in the exact same way he always did. 
Only one thing changed.

*[...]
-> drone

= drone
#background #master
Noah: My Mentor, I report to you that we are ready for phase 1 of the plan. The implantation of Cognitus 2.0 will begin this week for law enforcement officers. The subjects have been meticulously selected and will undergo operation within the next few days. #Conv
The Mentor: Very well, Mr.Taulen. Proceed accordingly. You are excused. #Conv

-> END

=== get_out ===

VAR tied_up = false

= main_area
#background #crypt

{
    -left_door and central_door and right_door and vault_entrance and tied_up and !palmer_decision:
    *[...]
    -> talk_to_palmer
}
{once:The detective must find an exit.|Noah returns at the center of the vault's main area. Emerson Palmer is still lying down unconscious{tied_up: and tied up}}.
+[Check on Palmer.]
Let's see what Palmer is up to... #Thought

{
    -palmer_decision:
    ++[...]
    -> palmer_decision
    -else:
    ++[...]
    -> inspect_palmer
}

+[Walk through the left door.]
-> left_door
+[Walk through the central door.]
-> central_door
+[Walk through the right door.]
-> right_door
+[Take the elevator to go back up.]
-> vault_entrance

= left_door
#background #masks
{once:Upon entering|Again}, Noah notices {once:a|the} large display of masks on the left, evenly placed and specifically organized. There are different types of masks, each type allocated to their own section in the display. In front of him, {once:a|the}he sees a large hologram of the earth. 

+[Look at the masks.]
The first section of masks looks identical to Palmer's. Indeed, one of them is missing. The further Noah walks down the room, the more stylized the types of masks become.
{once: Looks like "Arbor" follows a ranking system. The simpler the mask, the lower the rank, the fancier, the higher. Judging by Palmer's mask, he's just a soldier following orders. In this case, dealing with me...} #Thought
-> left_door

+[Look at the hologram.]
The sphere is filled with marked bullets, pointing to various places throughout the world. They're interconnected in numerous ways and forms through lines, making the reading extremely difficult for an outsider.
{once: I imagine that this is their network. Far larger than I imagined. They have connections almost everywhere. I had no idea what I was getting into...} #Thought
-> left_door
+[Go back.]
-> main_area

= central_door
This doorway is considerably bigger than both the left and the right one. Although, this door is shut and seems to be far more reinforced.

+ {inventory has magnet and (versed > 4 or handyman > 4)} [Try using the magnet.]
There seems to be no applicable spot for the magnet.
    ++[Go back.]
    -> main_area

+[Go back.]
-> main_area



= right_door
#background #warehouse
{once:Noah enters the room.|There's something different about this area.}This large room lacks the pomposity of the rest of this cryptic vault, it reminds of a storehouse, instead. It is filled with huge crates neatly organized throughout the room. There's another door, barely visible in the opposite corner.

+[Look inside crate No.1.]
-> crate1
+[Look inside crate No.2.]
-> crate2
+[Look inside crate No.3.]
-> crate3
+[Go to the door.]
There's no lock to pick here. {inventory has magnet and (versed > 4 or handyman > 4):I wonder if this door has some magnetic mechanism I could breach with my magnet to open it.} #Thought
    
    ++{inventory has magnet and (versed > 4 or handyman > 4)}[Inspect the door.]
    Noah keeps inspecting every facet of the door, but the magnet won't do be of help here.
        +++[Go back.]
        -> right_door
        
    ++ [go back.]
    -> right_door
    
+ [Return to the main area.]
-> main_area

=talk_to_palmer

Palmer: Detective, stop ! #Conv
Upon returning to the vault's main hall, Noah sees that Emerson has regained consciousness. He's sitting by the platform, battered and tied-up, with an unusual aura of hopelessness surrounding him.
Palmer: Listen. I can help you get out. Now, I know you have no reason to believe me, whatsoever. You've seen things down here and you've definitely found out stuff that led you to this place for good reason. #Conv
Palmer: I know I'm probably the last person you would trust at the moment. But if you let me, I'll get us both out of here. I have the answers to all of your questions regarding the case, I can testify ! But, please, you have to get me out of this place ! #Conv

-> talk_to_palmer2

= talk_to_palmer2

*(question1)["Why do you want to leave so urgently ?"]
Noah: Why do you want to leave so urgently ? #Conv
Palmer: If they see that I failed at my task, I'm afraid there are going to be great repercussions for me... #Conv
Palmer: I don't know if I'm safe. They have little to no tolerance for mistakes. They have punished "seekers" before. The "lucky" ones are those get a second chance, though only after going through some sort of physical or mental torment that "teaches" them. #Conv
Palmer: The rest, the ones who act "inexcusably" meet a far more direct fate... #Conv
    
    **["What did your 'task' have to do with me ?"]
    Noah: What did your 'task' have to do with me ? #Conv
    Palmer: The higher-ups were getting wary of your progress in the case. Cristina wanted to tease information out of you, that's why she wanted to meet you tonight. She ordered me to be on standby tonight, in case anything fishy happened. #Conv
    Palmer: She managed to send me a message, saying that you were taking her down here and asking me to 'take care' of it. #Conv
    
        ***["To kill me ?"]
        Noah: You mean, kill me ? #Conv
        Palmer: I don't know, I don't think so ! Killing a police detective is a very bold move, such an act should have been approved by the "Mentor" first. To my understanding, I was supposed to restrain and immobilize you. #Conv
        ->talk_to_palmer2
        
        ***["How did you keep track of my progress ?"]
        Noah: How did you keep track of my progress ? #Conv
        Palmer: I believe you have somewhat of a grasp of what's going on here. Almost everyone in this building has given themselves to Arbor, of course they talk to each other. You were asking them the hard questions that showed you were on the right track. You were snooping around a lot and that didn't go unnoticed. #Conv
        ->talk_to_palmer2
        
    **["What do you mean by 'seekers' ?"]
    Noah: What do you mean by "seekers" ? #Conv
    Palmer: The entry rank in the organization. Once an apprentice completes the training, or "reprogramming", they get appointed to become a "seeker". We recruit younglings, we pick up and deliver shipments, we deal with problems of any kind and in general, we coordinate the technical aspects of the entire infrastructure. Basically, we do all the grunt work. #Conv
    
        ***["So, you abduct and mindwash children ?!"]
        Noah: So, you're telling me that you abduct and mindwash children ?! #Conv
        Palmer: Yes. We select children from underprivileged communities, because it's easy to promise them a bright future and most of them are eager to come with us. We're also looking for children who migrate here illegally or belong in ethnic minorities, because it's hard for the authorities to verify their credentials. #Conv
        Palmer: Then, we relocate them to Arbor's undisclosed training and education facility in Westworld Pines. By the age of 21, their "reprogramming" is complete and they're ready to serve as "seekers". #Conv
        Palmer: I'm not proud of it. In fact, I've come to loathe myself. The least I can do right now is tell you the truth. #Conv
        
            ****{get_in_car.talk_to_sokolov}[Ask him about Daria.]
            Noah: Does the name "Daria Kozlov" ring a bell ? #Conv
            Palmer: I don't know what to tell you. The children are given new identities when they come with us. Besides, there are many recruiters. #Conv
            
                *****{inventory has photo}[Show him the picture of Daria.]
                Palmer: Looks quite familiar. Even though the children go through a makeover soon after they get to Westworld Pines,first we gather all the new recruiters to give them instructions, divide them and assign them to their dorms. #Conv
                Palmer: For whatever reason, this faces jumps to mind. I can help you track her down. I promise ! #Conv
                Maybe he's telling the truth... #Thought
                ->talk_to_palmer2
                
                *****
                -> talk_to_palmer2
                
            **** ["You're a disgrace to society."]
            Noah: You're a disgrace to society, you know that ? #Conv
            Palmer: I know. I can't change my past and I'll have to live with it for as long as I'm around. #Conv
            -> talk_to_palmer2
        
        ***["What other ranks are in the hierarchy ?"]
        Noah: What other ranks are in the hierarchy ? #Conv
        Palmer: There are a few, but this is neither the time nor the place to elaborate. What might concern you is that the "Mentor" is the end-all and be-all. He's the founder of Arbor, in religious terms, we see him as the prophet.
        Palmer: Right below him, there's the High Council. They act as the executive board of the organization, responsible for making key decisions and ensuring that the Mentor's vision is carried out. The Council consists of Richter, James Willford and the Okamotos. One position further down are the "Keepers".
        Palmer: Each Keeper oversees a critical aspect of the organization's operations. They enforce the doctrines of the Mentor and maintain strict control over their domains. Cristina is a Keeper. #Conv
        I don't know about that last bit... #Thought
        -> talk_to_palmer2
        
    **["Are they going to kill you ?"]
    Palmer: Honestly, I don't know. They can be dramatically unpredictable ! One thing is for sure, I don't want to wait here and find out ! #Conv
    -> talk_to_palmer2
    
*[Question his motives.]
Noah: Half an hour ago, you tried to assault me from behind. Now, all of a sudden, you want to co-operate and double-cross your people ? #Conv

Palmer: At some point, I realized the error in their ways. But it was too late to back off. Once you're in, you're in, unless, they decide that you're not useful to them anymore or that you're a liability. In that case, they get rid of you, for good. #Conv
Palmer: Frankly, from that point on, I've been going through the motions. Disobedience is not an option in Arbob. Basically, I've been trying not to draw any suspicion, while  secretly looking for an exit plan at the same time. #Conv
Palmer: I'm not like the others anymore. This is why I didn't bring guns or knives with me, I didn't want to hurt you badly. I hoped to simply knock you out and then tie you up. Maybe deep down, I even wanted you to beat me and arrest me. I can't keep doing this... #Conv

    **{richter_files or evidence has claudias_records}[Ask about the brain chip.]
    Noah: During the investigation, I discovered evidence that a special kind of chip is being implanted to people. {richter_files:I got access to some of Richter's files and it seems like he's done some intense research on the subject.|It really grabbed my attention.} #Conv
    Noah: {evidence has claudias_records:I retrieved a hidden confession coming from Claudia Willford and she also mentioned neural implantations.|I don't know what to make of it.} What is going on ? #Conv
    Palmer: You're right. The "Cognitus" chip. An ever-evolving project, started decades ago. Once a young member of Arbor completes some physiological tests, they are awarded "Cognitus", an implant that promises augmented mental and physical capabilities. As per protocol, I also have it in me.
    Palmer: However, one day, I was experiencing sharp headaches for several hours, I couldn't figure why. The next day, I noticed a very strange shift in my attitude, almost to the point of depression. I couldn't remind myself why I was doing the things I was doing for Arbor, I couldn't find a single reason. It was as if an epiphany came to me that day. #Conv
    Palmer: I started to suspect that there must be some sort of malfunction to my implant, but I chose not to say anything. If I stay here, they're going to find out, because we are regularly scheduled for maintenance. I don't think this will go well for me... #Conv 
        
        ***{analytical>4}["Could the chip be controlling your mind ?" (Analytical > 4)]
        
        ~XP += 20
        Noah: Could the chip be controlling your mind ? #Conv
        Palmer: I think so. There's a difference before and after "Cognitus". In hindsight, I can see it. Not just in me, but in other "seekers" at the time. #Conv
        ->talk_to_palmer2
        
        ***["When is the next scheduled maintenance ?"]
        Noah: When is the next scheduled maintenance ? #Conv
        Palmer: There's no date set yet. Usually, it happens every 3 months and we are told a day or two beforehand. But it's coming up soon and I need to be gone until then ! #Conv
        -> talk_to_palmer2
        
    
    
*{question1} -> palmer_decision

= palmer_decision
{
    -!decline_help:
Palmer: Please, detective, I'll get you out, if you agree to take me with you ! #Conv
Noah: What do you want in exchange ? Let me guess: A get-out-of-jail card ?#Conv
Palmer: I'm prepared to pay for my sins, believe me. But, they have connections everywhere, even in prison. They'll have someone come after me ! #Conv
Palmer: What I want is a new identity, a new country, a clean slate. A way to make sure they'll never get to me. I'll give you all the information you need, enough to sentence those who killed Claudia for life. What do you say ? #Conv 
{empathetic > 5:There is something about his eyes and his inflection that seems raw and organic. Maybe he's telling the truth...|This sounds too good to be true. What if he's lying ?} #Thought

    -else:
    Palmer: Did you think it over ? Please, we don't have much time ! #Conv
}

*[Accept.]

~XP += 30
-> elevator_jump_

+(decline_help)[Decline.]
Noah: I think I'll take my chance and find my own way out. By the way, I'm not an idiot. Have fun waiting for your friends. #Conv
Palmer: No, detective, you're making a big mistake ! #Conv
Noah leaves Palmer sitting with his head down and on the verge of tears, unable to do a thing and keeps looking for a way out.
    ++[...]
    -> main_area

= elevator_jump_
Noah: Fine. But I won't take any chances. I'll untie your hands only after we've arrived outside the precinct. We'll say that you contacted me, because you wanted to confess. As long as you tell us everything we need to know, I promise to keep my end of the bargain. #Conv
The detective hesitantly unties Palmer's legs and helps him stand up.
Palmer: Thank you, detective ! Now, we shouldn't leave through the entrance hall, since they migh see us, if they're not already coming after us. #Conv 
Palmer: There's another exit, not in the vault's authorized plan, that leads outside, right behind the building. Follow me, we have to take the elevator. #Conv
Palmer leads the way, as Noah follows right behind him, keeping an eye on him at at all times.
-> elevator_jump

= elevator_jump
#background #lift
Palmer: If you press every button together, the elevator takes you to a semibasement, right below the surface. From there, we'll take a short unworn path that will get us out. #Conv 
The two of them get on the unusual elevator and Noah presses every button simultaneously, as instructed.
Indeed, the elevator starts to ascend. However, it suddenly stops at an unspecified height and the door opens.
Noah: What happened ? #Conv
Palmer: We're here. I told you this is an unplanned exit. Look below you. #Conv
*[...]
-> elevator_jump2

= elevator_jump2
#background #ledge
The detective notices a short ledge, about two meters below them. 
Between them and the ledge there's also a horizontal gap of one meter, give or take.
Noah: You're telling me we have to make the jump ?! #Conv
Palmer: Yes, there's no safer way out right now ! I'm sure you can handle it. It will be a lot trickier for me though, since my hands are tied. I'd appreciate it if you untied me for the jump. The moment we've both made it, you can tie my hands again. #Conv
{sly>5:This seems fishy. What if he tries to catch me off guard and push me to my death ? Police will never find me and they'll get away with everything... [Sly > 5]|What should I do ?} #Thought

    *[Untie him.]
    
    ~empathetic++
    
    Noah: Let's hope I won't regret this. #Conv
    The detective unbinds the cord cautiously around Palmer's hands.
    Palmer: Thanks. I'll go first, in case I haven't earned your trust yet. #Conv
    Palmer makes the jump and lands safely on the ledge. Right after him, Noah does the same thing.
    Noah: Before we continue, let's tie those hands once more. We made a deal. #Conv
    Palmer: Right... #Conv
    Palmer waits resignedly for the detective to restrain his hands again.
        **[...]
        -> escape_from_crypt
    
    *(dont_untie)[Don't untie him.]
    
   
    ~sly ++
    ~empathetic--
    
    Noah: That wasn't our agreement. I think you got this, even with your hands tied. I mean, there must be a reason they sent you to "take care" of me. You can move. #Conv
    Palmer takes a deep, exasperated breath.
    Palmer: Whatever, if you don't trust me, I'll go first. Anything to get out of this pit. #Conv
    The young man takes a literal leap of faith. However, on his way down to the ledge, he slightly loses his balance and lands very awkwardly on one of his feet. He immediately screams in pain. 
    Palmer: Aaagh !! My leg, dammit ! #Conv
    Noah makes the jump as well and meets him on the ledge.
    
        **[Apologize.]
        
        
        
        {
            -sly>1:
            ~sly--
        }
        ~ empathetic ++
        Noah: I'm sorry, I didn't know if I should trust you that much. I was wrong. Did you break it ? #Conv
        Palmer: I believe so, ouch ! What else will it take to convince you I'm not your enemy ?! #Conv
            ***[...]
            -> escape_from_crypt
        
        **[Keep going.]
        Noah: Get up, we should keep moving. #Conv
        Palmer: Don't you see I'm hurt ?! What is wrong with you... I need help, I can't even step on it alone ! I think it's broken. Ouch ! #Conv
        
            ***[...]
            -> escape_from_crypt



= escape_from_crypt
#background #cave
{get_out.dont_untie:Noah helps Palmer stand up and offers his body as a crutch, as they struggle to walk along the steep and poorly lit path.|The two men start walking along the steep and poorly lit path.}
Out of the blue, they become aware of a humming noise, coming from behind.
Palmer: Oh no, someone's taking the elevator from upstairs ! They're coming to check on us. We shouldn't be seen here, we must take cover ! #Conv
{get_out.dont_untie:Noah dumps Palmer behind a wall and gets down as well|They both fall down quickly and hide behind a wall}, until the elevator passes by the semibasement.
Palmer: Let's go, we have to move fast. Some of them know about this passage, it's a matter of time before they come up here ! #Conv
The men hurry to find the passage.
#background #exit
After a few minutes, they come across a thick steel door. 
{
    -inventory has magnet:
    Palmer: Crap ! I had a piece of neodymium magnet attached to my belt, but now I can't find it ! It was the only way of opening that door ! #Conv
    *[Give him the magnet.]
    -> give_back_magnet
    -else:
    Palmer: There's a piece of metal, a neodymium magnet attached to my belt, right here. One of the most powerful types of magnet you'll find out there. If used correctly, it can create a magnetic field strong enough to unlock this door.
    The humming sound of the elevator reaches their ears again.
    ->escape_from_crypt2
    
    
}

= give_back_magnet
Noah: I believe this is yours. I snatched it while you were out, in case I needed it. #Conv
Noah returns the magnet to Palmer.
~inventory -= magnet
Palmer: Thank god it's here at least. 
The humming sound of the elevator reaches their ears again.
-> escape_from_crypt2

= escape_from_crypt2
Noah: Whatever, you won me over, do your magic and get us out of here. #Conv
Noah unties Palmer as fast as he can and {get_out.dont_untie:supports him, as the young man attempts to unlock the door.|keeps an eye out, while Palmer methodically approaches the door.}
He presses the magnet against the door, feeling the immediate tug of attraction, the metal almost humming with potential. Sweat beads on his forehead as he adjusts the magnet's position, aligning it just so with the hidden pins inside the lock.
With a deep breath, they both begin to pull, straining against the weight of both the door and the old, rusted gears that hold it shut. The magnet clung fiercely, amplifying their every effort, but the door remains stubborn. He feels a creak, a subtle shift, as if the old lock is finally beginning to relent.
The haunting sound of the elevator gets louder and louder by the second, to the point that being caught is a mere matter of minutes.

Summoning all their strength, the two men give a final, desperate pull. The door groans, and then, with a resounding clank, the mechanism yields. The heavy door inches open, revealing the chilly atmosphere of the early morning hours.
*[...]
-> escape_from_crypt3

= escape_from_crypt3
#background #men_running
Palmer: We made it ! Now we just have to disappear from the area as fast as possible. #Conv
Noah: My car is parked right there. Come on ! #Conv
{get_out.dont_untie:Noah puts Palmer's arm across his neck and carries the extra weight, while the man desperately limps along, until they finally get in the car and disappear towards the city.|The two men engage in a fiery sprint and hop in the detective's car, disappearing towards the city.}

*[...]

~day++
~timepass()
-> precinct_w_palmer

    

= crate1
This crate contains medicine of all sorts, mostly pills and zip bags of unknown substances in powdery form. {examiner_pill_update.red_pill_reveal and observant > 2:While taking a closer look, something grabs the detective's attention. A stack of red pills.|The detective keeps inspecting, becoming fully aware of what he is witnessing.}
{examiner_pill_update.red_pill_reveal and observant > 2:Astrecamine ! This is it ! In the exact same casing as in Richter's office. The group's drug mediator...|They're a cartel too ?!} #Thought
{once:He takes a photo.}

~ evidence += crate_of_astrecamine
+[...]
->right_door

= crate2
This particular crate contains various types of advanced weaponry, specifically firearms. Special models of pistols, revolvers, railguns, SMGs, rifles, everything is carefully packaged inside here.
Most of these aren't conventional firearms. These are cutting edge, some of them I haven't even seen before. I doubt that even some of our most elite task forces have a hold of them. It's clear that we're talking about organized crime here, but to what level... #Thought
The detective notices a batch of an all too familiar pistol.
These are 99K Arnolds. The same pistol that was found on Claudia's bed. Of course, with such access to guns, getting rid of her was a piece of cake... #Thought
{once:Noah takes a picture.}
~evidence += crate_of_guns
+[...]
-> right_door

 = crate3
 This crate is filled with tiny packaged semi-conductors.
 This could be the brain implant, I've heard so much about... #Thought
 The detective gets an image.
 ~ evidence += crate_of_chips
 +[...]
 -> right_door
 
= vault_entrance 
#background #main_exit
 {!(try_magnet or bang):The elevator takes the detective back up|Again, facing that daunting obstacle}. In front of him, there is the door that separates him from the building's entrance hall. This is no ordinary lock, and brute force wouldn't do.
{inventory hasnt magnet:I don't have any tools with me to force that kind of door...}

+(bang)[Bang on the door.]
In an act of despair, Noah bangs on the metal door with tenacity. Even thought he knows that even if someone were to hear him, chances are they wouldn't want him out of there, he still tries.
He's also pretty certain that his brute force is no match for this door. Yet, he still tries. But nothing happens to the door. On the contrary, his hands now hurt.
    ++[...]
    ->vault_entrance

+(try_magnet){inventory has magnet and (versed >4 or handyman >4)}[Try using the magnet. (Handyman/Versed + dice roll > 8)]

{
    -try(versed,9) == true or try(handyman,9) == true:
    Placing the magnet against the metal, he begins to move it in slow, deliberate circles. The detective can almost sense the tumblers inside responding, the delicate mechanisms shifting under the magnet's influence. For a moment, nothing happens, the silence oppressive. Then, with a soft click, the lock disengages.
    Noah pushes the door open, its heavy steel groaning as it yields. 
    Noah: Yeah ! I did it !! #Conv
    **[...]
    -> escape_alone
    -else:
    With steady hands, Noah places the magnet against the door{!once:, just like before}, moving it in slow, practiced circles. He imagines the tiny tumblers inside, the complex machinery giving away, any second now. Yet, {~no soft click, the door remains unmoved|the lock refuses to yield}.
    Shit. I though this could work. Maybe I should try again later. #Thought
        ++[...]
        ->vault_entrance
    
}
+[Get back down.]
Noah takes the elevator to get back down to the crypt, hoping to find a better tool or way out.
    ++[...]
    -> main_area

= escape_alone
Noah runs towards his car, embracing the cold wind and the dark sky.
*[...]
-> final_call



= inspect_palmer

Emerson Palmer is still unconscious.
{analytical > 2: Maybe there's something on him that I could use to unlock a door to escape.} #Thought
+[Search him.]
He wears nothing on his head. He has a black close-fitting long sleeve shirt on, black surgical gloves on both of his hands, a belt, a pair of long cargo pants and combat boots.

    ++[Search his shirt.]
    Noah feels no objects over or under Palmer's shirt.
    ->inspect_palmer
    
    ++[Search his belt.]
    {inventory hasnt magnet:There's a piece of metal attached to the side of his belt. It looks extractable|Without the metal piece, it's just an ordinary belt.}
        
        +++[Take the piece of metal.]
        Noah removes the piece from Palmer's belt.
        {versed > 4 or handyman > 4: This looks like a neodymium magnet, one of the strongest types of magnet. If there's a magnetic door here, it could help me unlock it. [Versed/Handyman > 4]| Let's keep this, if he carried it down here, it must be useful.} #Thought
        
        ~ inventory += magnet
        -> inspect_palmer
    
    ++[Search his left pockets.]
    A pack of smokes.
    -> inspect_palmer
    ++[Search his right pockets.]
    {tied_up ==false:Some thin, thread-like cord.|Nothing else, beside the used cord.}
    {tied_up == false:I should use this to tie him up, he's going to regain his senses soon.|Enough with his pockets.} #Thought
    {once:Noah uses the cord to tie Palmer up.}
    
    ~tied_up = true
    -> inspect_palmer
    
+[Keep looking.]
-> main_area

=== precinct_w_palmer ===
#background #interrogation
Early Monday morning, the detective, Emerson Palmer, {partner} and Sergeant Jacobs are having a conversation inside the interrogation room.
The Sergeant looks noticeably astounded by the things he hears from the two men, on the verge of disbelief. #old_city
Sgt.Jacobs: You're telling us that this deranged cult is behind Claudia Willford's death ? #Conv
Palmer: Yes. They're all involved to some extent, even I. There was a common fear that she was about to expose the group. So, a council was held and somebody proposed eliminating her. The "Mentor" granted his permission, as long as they dealt with it and it didn't draw attention. #Conv
{partner == "Johnson":Johnson: That went terrific.|Sgt.Jacobs: What does this mean ?} #Conv
Noah: Who was that ? #Conv
Palmer: Cristina Artuso. She proposed and executed it. I don't know exactly what happened, but judging by the aftermath, I think it's safe to say that she shot Mrs.Willford. The rest of the residents tried to cover it up. #Conv
Sgt.Jacobs: What about her husband ? #Conv
Palmer: Mr.Willford knew, too. He was fully aware that it was going to happen. That's why he found an excuse to be late that night. Even though he didn't prevent it, he didn't want to get involved. He had serious reservations, because she was his wife, but in the end, he complied with the Mentor's order. #Conv
Sgt.Jacobs: Detective, do you have evidence that supports Mr.Palmer's claim ? #Conv

*["I sure do."]
Noah: I sure do. #Conv

{   
    -evidence has astrecamine_sample:
    Noah: My theory is that Artuso tried to poison Willford during a visit that night, but Claudia refused to drink the wine. A lethal dosage of astrecamine was found in one of the glasses, but Claudia was found clear. #Conv
    -else:
    Noah: I guess Artuso visited Claudia that night, under some pretense. #Conv
}
{
    - evidence has claudias_records:
    Noah: Mrs.Willford was already wary of her neighbors. She said so in the video confession I retrieved from her friend, Elaine Bronson. #Conv
    - else: Noah: From what I understand, she had to be suspicious of her neighbors. #Conv
}
Noah: Artuso decided to take more extreme measures and pulled out her 99K Arnold{evidence has second_shell:, but missed the first time, hence the second bullet.|and the fatal shot was fired.} #Conv
{
    -observant > 3:
    Noah: Before getting fatally shot, Claudia resisted a bit, hence the similar marks between them. #Conv
    -else:
    Noah: The marks on Claudia's body indicate signs of struggle against another party. #Conv
}
{
    -evidence has scene_footprints and inventory has okamoto_footprints and statements_ has cristina_not_there :
    Noah: The footprints spotted next to the scaffold, right by the Willfords' balcony indicate that she had to flee from there in order to avoid being seen, knowing that the housekeeper was approaching. #Conv
    Noah: Interestingly enough, similar footprints were spotted towards Mrs.Okamoto's balcony. While hopping between the two balconies might not have been the most reasonable thing to do, in a desperate time it felt like the only option. The housekeeper also stated that she didn't find Artuso when she was notifying the neighbors. #Conv
    - else:
    Noah: I believe all this evidence on top of Mr.Palmer's testimony can get us an arrest warrant for Artuso, let alone their entire operation ! #Conv
}
Sgt.Jacobs: Maybe you got something here... Let's hope the judge agrees... #Conv

    **[...]
    -> court.court_w_palmer

=== court ===

= court_w_palmer
#background #court
An arrest warrant was granted for Cristina Artuso.
A search warrant was also issued for the premises of the entire residence on Stilton Avenue. #justice
James Willford got arrested and prosecuted for aiding and abetting murder and accessory before and after the fact, facing a 20 year sentence. Artuso was also charged with all of the above, as well as with first degree murder, facing an additional life sentence.
On top of the charges relating to Claudia's death, Artuso, Willford, Richter and the Okamotos, among others, were also arrested and charged with racketeering, human trafficking and seditious conspiracy, facing 15 years. Willford was the first to admit Cristina's act, as well as his affair with her.
Cristina is nowhere to be found and the police have launched a thorough operation in order to track her down.
~ caught_cristina = false
The 'Mentor', the mastermind behind 'Arbor' is also facing a life sentence but there is no information regarding his whereabouts. He is still virtually unknown, as his inner circle either refuse or truly cannot offer anything of substance.

~caught_mentor = false
A special operation was carried out to locate the missing children in the organization's facility in Westworld Pines. The children were rescued and returned to their homes. However, a challenging recuperation and rehabilitation program is being implemented, in order to set their minds straight.

*[...]

A month later...

{
    -get_in_car.talk_to_sokolov_2:
    **[...]
    -> bar.sokolov
    -else:
    **[...]
    -> bar.partnerbeer2
}

=== bar ===

= sokolov

#background #barend
    Somebody's calling the detective on his device.
    The detective's face lights up. #bar
    Noah: Huh. It's Denis Sokolov. #Thought
    *[Pick up.]
    Denis: Mr.Taulen, this is Denis Sokolov. Thank you so much for everything you did for me and Daria ! I wish I had called you sooner, but this last month has been chaotic. #Conv 
        
        **(modest)["I was only doing my job."]
        Noah: Don't mention it, I was only doing my job. #Conv
        Noah: I'm just glad that the kid is back. #Conv
        
        Denis: You're too modest, detective. You uncovered an entire trafficking ring all by yourself ! #Conv
        Denis: The truth is, you could have easily turned a blind eye to me on that cold night, like most would have. But you didn't and that shows your quality as a human being. #Conv
        
        **["It was a hellish case and I gave it my everything."]
        Noah: I'm glad you acknowledge good police work. It was a hellish case and I gave it my everything. #Conv
        
        Denis: I know... Who could have imagined what you had to deal with... #Conv
        
        -- Denis: I'm pretty sure Daria's parents are smiling from above right now... #Conv
        {empathetic > 3:Noah hears the shakiness in the man's voice. He's evidently emotional as they speak. [Empathetic > 3]|Situations such as this tend to be awkward for the detective...}
        
        **["How's Daria doing ?"]
        
        ~empathetic ++
        Noah: How's Daria doing ? #Conv
        Denis: She's doing alright... I'm not going to lie, this process of helping her return to normality turns out to be very stressful. Even after they managed to extract that evil chip, she's still suffering from insomnia, bipolar behavior and panic attacks. #Conv
        Denis: Doctors say it might be a long time before she recoups her old state of mind, but everyday we're making progress. {modest:You can come see her anytime ! In fact, we'd love to have you come over for dinner this Sunday. It's the least we can do...|That's life detective, what can you do...} #Conv
        
        {
            -modest:
            Noah: Sure, that would be great. I guess I'll see you then. Take care, Denis. #Conv
            Denis: Again, thank you. Hope to see you on Friday ! #Conv
            -else:
            Noah: You can say that again... I'm glad you're back together, stay safe and keep on fighting. #Conv
            Dennis: You too, detective. Again, thank you for everything... #Conv
        }
        -> partnerbeer
        
        **["Go out and have some fun, you deserve it !"]
        Noah: Go out and have some fun, you deserve it ! After all you went through, you should celebrate the kid being back ! #Conv
        Denis: Sure, but now may not be the time yet. She needs me now, more than ever. Her recuperation and reintroduction to society will take time. #Conv
        Noah: I understand. I wish both of you the best. Take care... #Conv
        Denis: You too, detective. Again, thank you for everything... #Conv
        
        -> partnerbeer
        
        = partnerbeer
        This phone call sufficed to put a smile on Noah's face.
        {partner} is quick to notice. 
        {
            -sokolov:
            {partner}: {partner == "Milton":Getting positive feedback from civilians you help must feel like a unique accolade. |That Russian guy whose niece we found, right ? I'm telling you boss, you gotta run for mayor, people are almost asking you to take a picture with their baby ! Gotta strike when the iron's hot.} #Conv
            Noah: {partner == "Milton":In the end, I guess so. God knows we're not doing it for the money. Just trying to fill our existential void by making a change, being part of a brotherhood, or even purely out of pride. I'd like to think I'm operating in that order of preference. I know you are.|As a mayor, my first order of business would be to have someone smack you eveytime you open your mouth...} #Conv
            
        }
        
        *[...]
        -> partnerbeer2

    = partnerbeer2
    
    #background #barend
    
    {
        -!caught_mentor or !caught_cristina:
        The detective turns skeptical.
        Something still bothers him. #bar
        Noah: I'm not gonna pretend I'm happy with how things turned out. #Conv
        
        {partner}: Yet, but you managed to expose them. An entire operation is after them now. Maybe someday, they will find them. #Conv
        Noah: Yeah... hope dies last, I guess... #Conv
        
    }
    {partner == "Milton":Milton: Anyway, how are you adjusting to your new rank, sergeant ?|Johnson: So, how's life filling Jacobs' old smelly shoes, sarge ?} #Conv
    
    *(monsoon)["Double the trouble, but not the salary."]
    Noah: Double the trouble, but not the salary. In a twisted way, it's quite convenient, because the more time I spend at work, the less money I'm inclined to spend in my personal time. Being a clunky shell of a bachelor since Cynthia left me has made me quite thrifty too, so let me get you another round, I can afford it ! #Conv
   
   {
   -partner == "Milton":
    Milton: No need, sergerant, you know alcohol doesn't affect my system. I only pretend to drink as an act of camaraderie. #Conv
    Noah: You know, Milton, you might be the most unintentionally funny guy I've met in the force. #Conv
    Milton: It is flattering to hear, even without the intent from my part. Maybe it will sound ironic coming from an android, but you should consider searching for companion again. #Conv
    -else:
    Johnson: That's why you're the boss ! I feel you though, money is tight, that's why I've been working security gigs for rich people on my days off. For example, for a few weekends now, I've been surveilling Monty Monsoon. #Conv
    Noah: 'The Seer Who Makes Doubt Disappear' ? That guy is a charlatan ! Didn't he put his clients in Augmented Reality systems to show them their fate, only to spam them with pop-up ads ? #Conv
    Johnson: No such thing as bad press ! They'll never get rid of him, he's got connections everywhere. Besides, he pays well. #Conv
    Johnson: Anyway, I don't know, boss. Sounds like your ex did a real number on you, but there's other fish in the sea. Maybe you should get yourself back out there. Tell you what, tomorrow, after my shift watching Monsoon, I'll pick you up and we'll go to 'The Funky Zoo', some of my guys will be there too. There's tons of hot chicks there ! #Conv 
    }
        
        **["I'm good for now. I need to work on myself first."]
        Noah: Nah, I'm good. I need to work on myself a little bit first. I realize now, that's why Cynthia ended things. {partner == "Milton":Maybe we should fix you up with someone instead. I feel like you got the moves...|You go have fun, though.} #Conv
        
        {
            -partner == "Milton":
            Milton: Indeed, I just started seeing someone. She's two models older, she is assigned as a private banker. We met organizing a breadline, as we volunteer in the same community. I think it is going well. #Conv
            Noah: There you go, man ! That's awesome. Cute story, too. The older, the better, am I right ? #Conv
            Milton cracks his signature grin.
            -else:
            Johnson: As you wish. The invitation will still stand tomorrow, in case you change your mind. I've been going there often these last few months. You wouldn't believe how easy it is to hook up with straight 8s, maybe even 9s or 10s if you got the right moves... #Conv
            
            Noah: Not really a relashionship kind of guy, are you Johnson ? #Conv
            Johnson: You got me. No, never really been into that much commitment. I meet a girl, we have our fun and I'm out of there. The way I see it, life's already full of obligations and compromises as it is. Why have to settle even in my free time ? #Conv
            Noah: Those were some fair points. Whatever makes you happy, man. Although, I could recommend a shrink, if you ever feel the need. #Conv
            Johnson: Ouch. Tough love received, boss. #Conv
            
        }
        
        **(zoo)["Maybe you're right."]
        Noah: Maybe you're right. I've spent enough time feeling sorry for myself, I should get back out there. #Conv
        
        {
        -partner == "Milton":
        Milton: Maybe I can be of help, I recently started seeing someone. She is an android, too, we met in our community where we both volunteer. She has a lot of human female friends, maybe I could talk to her. Only if I am not violating the code of conduct, of course. #Conv
        Noah: You are hilarious, I underestimated you at first. Sounds fun, we'll see. Happy for you, too, man. #Conv
        -else:
        Johnson: Awesome ! I'll come pick you up around 23:30, I'll need to go home and take a shower first. It's gonna be legendary ! #Conv
        Noah: I'm already regretting this... #Conv
        }
        
    *["Feels oddly the same."]
    Noah: I don't know, it feels the same as before. I guess you do a good enough job, then you get promoted and this goes on and on, until you retire. There's not a higher sense of fulfillment that comes along with it. #Conv
    Noah: Sure, you feel some joy at first and you go out and celebrate, but then it's over. The next day, you have to wake up early, go to work, do your best to adjust to your new position and if you do that well, the cycle repeats. #Conv
    
    {
    -partner == "Milton":
    Milton: This human behavior is what I would classify as pessimism. The idea of chasing happiness is intended to serve as an opium, or even a survival instict. We set out goals that motivate us to get out of the unpleasant situations we find ourselves in. #Conv
    Milton: Having nothing to anticipate might seem alarming, but is sometimes a signal of inner peace. Sooner or later, something that you are missing will disrupt that inner peace and will push you to go after it. You have to trust the process. #Conv
    -else:
    Johnson: Well, you know what they say, life sucks and then you die. But seriously, imagine how we come into this world.  Screaming, crying and covered in crap, yet somewhere down the line we convince ourselves that we're destined for greatness. Maybe that is not by accident, there has to be a plan for all of us... #Conv
    Johnson: For example, why have our brains developed to a point where we can intellectually contemplate on what's out there ? There's got to be something calling us ! #Conv
    }
    
        **[{partner == "Milton":Is that working out for you ?"|"You're not often so reflective..."}]
        Noah: {partner == "Milton":Is that working out for you ?|You're not often so reflective...} #Conv
        
        {
        -partner == "Milton":
        Milton: It does. I understand that not being organically human alleviates some pressures humans have to deal with, such as procreation and we may be programmed to operate within a narrower emotional spectrum, so take it for what it's worth. #Conv
        Milton: In my opinion, it is good advice either way. You keep living everyday life to the best of your ability and necessary changes are bound to happen, either by your own actions or even by chance. #Conv
        
        Noah: I have a feeling that a time-travelling guy named Sigmund will visit you any day now and ask your thoughts on the unconscious mind... #Conv 
        Milton chuckles as he needlessly finishes his beer.
        -else:
        Johnson: Yeah, I don't know... I've always pondered on the meaning of life, but I could never find a good enough answer, so I'd just go back to doing stupid shit. #Conv
        Johnson: But the other day I came across this documentary where a bunch of scientists and theologians debated over the birth of the universe and it got me thinking again... Granted, I was slightly stoned, but you have to wonder... #Conv
        }
        **[{partner == "Milton":"Where did you learn all that ?!"|"I think I'm done with religious talk for a while."}]
        
        {
        - partner == "Milton":
        Noah: Where did you learn all that ?! #Conv
        Milton: From what I understand, our emotional components are very similar to your limbic system. I assume that a lot of it stems from the data my brain was trained on. Part of it comes from experience, as well. I also read a lot of books on psychology. #Conv
        -else:
        Noah: I think I'm done with religious talk for a while... We just arrested a deranged cult for crying out loud ! #Conv
        Johnson: You're right, sarge. I should have stuck to cars, women and fantasy football... #Conv
        }
    - {partner}: Anyway, I {partner == "Milton":shall be going. Thank you for the invitation, sergeant. Drive safe and have a nice weekend.|gotta wake up early tomorrow{monsoon: to guard that clown.|for an errand.}Thanks for the drink, boss. {zoo:See you tomorrow, wear your expensive cologne.|See you Monday.}} #Conv 
    
    Noah: {partner == "Milton":You too, Milton. See you Monday.|Night, Johnson, see you then.} #Conv
    
    The End.
    -> END

=== terrell_foe ===
#background #terrells
The detective manages to track down the address that 'Skid' gave him.
He now stands outside the guy's supposed apartment. #terrell
'Skid' said that the guy works night hours, so {time_of_day == morning:I should be able to find him here.|I won't deliver the "message" in person.} #Thought

*[Knock on the door.]

{
    - time_of_day == morning:
    He's probably here. #Thought
    **[...]
    -> terrell_morning
    - else:
    Let's make sure nobody is here. #Thought
    Noah knocks twice, but nobody responds.
    The door is locked, of course. I should find another way to enter. #Thought
    I think this building has a custodian. He must have keys for the apartments. Maybe I could convince him to unlock the door.  #Thought
    
    **[Try to pick the lock. (handyman + dice roll > 4 or stealthy + dice roll > 7)]
    -> lockpick_terrell
    
    **[Find the custodian.]
    -> terrell_custodian

}



= lockpick_terrell
{
    -try(handyman,5) == true or try(stealthy,8) == true:
    
    ~XP += 20
    ~rogue++
    
    Putting his craftiness into use, the detective manages to unlock the apartment's front door.
    *[...]
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

*[Pretend to be a new neighbor. (Sly + dice roll >= 6 or Rhetor + dice roll >= 7)]
Noah: Hello ! My name is Eric, I just moved in two stores above you. I was wondering if you could help me clear some confusion over the payment of the maintenance fees. I'll only take a minute off your time. #Conv

{
    - try(sly,7) == true or try(rhetor,8) == true:
    
    ~sly++
    ~XP += 10
    Cautious steps can be heard from the other side.
    #background #t_m
    The man opens the door. 
    Terrell: Look, sir, I'm 'bout to head out for some business, so let's make it quick. #Conv
    
    **[Pull out your pistol and threaten him. (Rogue + dice roll > 6)]
    
    {
    -try(rogue,7) == true:
    -> pretend_neighbor_success
    -else:
    -> terrells_got_a_gun
    }
    
    -> pretend_neighbor_success
    
    -else:
    Terrell: Uh... Sorry I'm very busy at the moment. #Conv
    Noah: Crap. That didn't work. Time to drop the masks. #Thought
    **(failed_acting)[Reveal yourself.]
    -> cops_visit
    

}

= pretend_neighbor_success



~rogue++

Noah: I wouldn't be so hasty if I were you. #Conv
The detective quickly grabs his pistol and aims at the man. Terrell raises his hands and takes a few steps backwards, in a defensive state of shock. This gives Noah the opportunity to close the door behind him.
Terrell: Please man, I-I don't any trouble ! Just take whatever you want and leave !! #Conv
Noah: What I want is 'Skid' to have his money back by the end of the day. I believe we've been putting this off forever, haven't we ? #Conv
Terrell: Alright, alright, I'm very sorry ! I've been trying to pay off my debt for quite a while. I-I just made a few bad investing decisions along the way and some other people took advantage of me ! #Conv
Terrell: Look, I finally have the money, I can get it for you, right now. Just give me a moment ! #Conv

    *[Watch him bring the money over.]
    Noah: Make it quick. #Conv
    Terrell rushes cautiously to the bathroom. The moment he steps in, he slows down, as if he's trying to remember where he hid the money.
    {empathetic >= 3:How did it come to this ? Is this really who I've become ?} #Thought
    Terrell tries to lift the lid of the flusher.
    {empathetic >= 3: Maybe that's what you saw in me, Cynthia...} #Conv
    Terrell lifted the lid. He's reaching for something.
    {
        - sly >= 3 or observant >= 4:
        Oh, no. He's reaching for a gun. #Thought
        **[Scare him off.]
        -> scare_him_off
        - else:
        
        **[...]
        -> terrells_got_a_gun
    }
    *[Go grab it yourself.]
    Noah: You stay right where you are. You'll tell me where it is and I'll go for it. And don't try anything stupid, my barrel will be looking straight at you. #Conv
    Terrell: Fine ! It's inside the cupboard, right behind the left bathroom mirror. #Conv
    Terrell: I really don't want any more troubles ! More than anything, I want to let this stuff behind me and try to be a better dad. My son's eight, I need to be around for him. A big part of that money went to his medical bills. #Conv
        
        **[Ask about his son.]
        Noah: What's wrong with your son ? #Conv
        Terrell: Vapor Lung. Not that uncommon in the area. With all the vaporized chemicals from malfunctioning industrial systems and leaks, you learn to deal with it. #Conv
        Terrell: Healthcare ain't no option here and treatment had me doing any extra job I could find, legal or not. #Conv
        Terrell: His condition got really bad at one point. We thought Jon wouldn't make it... Fortunately, he pushed through and got over it. He's still having some troubles and he'll have to face some chronic side effects, but my boy, he's a fighter and nothing will keep him down ! #Conv
        The man's story throws Noah a bit off guard as he stashes the man's money in a bag.
        ~ empathetic++
        
        {rogue >=2:
        ~rogue--
        }
        
        **[Ignore him.]
        Noah ignores the man's monologue as he stashes the man's money in a bag, while keeping an eye on him.
        
        ~ money += 30000
        
        --Noah: That will be it, I guess. #Conv
        
    - The detective is on his way out.{observant >= 3:`Before he leaves, Noah takes a last look at the house's interior. A picture of Terrell and his son and a bunch of child drawing catch his eye. }
    
    * {empathetic >= 4} [Give up the money.]
    Noah: You know what... Screw it. #Conv
    The detective throws the bag back to Terrell.
    Noah: I won't take the bread out of your kid's mouth. But you gotta make better choices. You have a family. Figure it out and pay him back real soon, because next time he'll send somebody else and it will be the last. #Conv
    Terrell: Oh man, thank you, thank you so much ! I won't forget this ! I'll never forget that. I will fix everything, I promise. Thank you ! #Conv
    ~ empathetic++
    ~ empathetic++
    
    {rogue>=3:
    ~ rogue--
    ~ rogue--
    }
    
    The detective leaves the man's house in a bittersweet mood. 
    I can't believe I almost did Skid's bidding. Where were my morals ? I shouldn't take any more shortcuts while working this case... #Thought
    
    ~skid_favor = nothing
        
        **[...]
        
        ~timepass()
        -> next_move
    
    *[Leave.]
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
    
    **[...]
    
    ~timepass()
    -> next_move

*[Tell him you're a cop.]
{
    -XP>50:
    ~XP -= 50
    -else:
    ~XP = 0
}
->cops_visit

= cops_visit
#background #t_m
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
    
    Terrell: I'll need to see your badge. #Conv
    The man doesn't hide his agitation.
     #background #t_m
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
    
    ~ money += 30000
    Noah grabs the bag and leaves the house.
    
        **[...]
        
        ~timepass()
        -> next_move
    
    *{empathetic >= 3}[Offer him a last warning.]
    Noah: I won't take money, but this is the last warning. I'm giving you a window here. You have 2 days, then I'm coming back with a permit. Unless, "Skid" gets really frustrated and decides to visit sooner, in a far less civilized manner. #Conv
    
    ~XP += 20
    ~ empathetic++
    {
        -rogue>=2:
        ~ rogue--
    }
    
    Terrell: Fine... I understand. #Conv
    Noah leaves the hopeless man alone.
    
    ~ skid_favor = warning
        
        **[...]
        
        ~timepass()
        -> next_move
    
//->END

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

~ money += 30000
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
    
    **[...]
    
    ~timepass()
    -> next_move

= drop_off_money

    Within an hour, Noah is already at the "Hole", sitting on a couch, waiting for Skid's primary henchman to meet him.
    At last, the man emerges from the back area. #pixel_river
    
    ~money -= 30000
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
    
    The henchman offers Noah a stack of money.
    
    Skid: It's 7000 meridians. Since, you went the extra mile and actually came back with my money, I though it would be fair. #Conv
    
    * [Accept the gift.]
    
    ~ rogue ++
    {
        -empathetic>1:
        ~empathetic--
    }
    
    Noah takes the envelope {empathetic > 3:reluctantly|joyfully}.
    Noah: T, I guess. #Conv
    
    Skid: Just a gift to solidify this new friendship.
    ~ money += 7000
    
    * (reject)[Reject the gift.]
    
    {
        -rogue>1:
        ~rogue--
    }
    ~ empathetic++
    
    ~XP += 30
    
    Noah: Thanks, but, no, thanks. The deal was simple: I make sure you get your money, you give me the information I want. We're not becoming "friends", not even close. #Conv
    Skid: Wow, tell us how you really feel, am I right ? A little rough around the edges, Mr.Taulen, I get it. Thanks for doing business, then.
    
    - You're {reject:still} welcome here any night, drinks and girls on the house. #Conv
   Noah leaves the "Red Hole".
        
    *[...]
    
    ~timepass()
    -> next_move

= terrell_custodian
#background #custodian
Noah finds the custodian in the studio apartment located on the ground floor. A miserable-looking middle-aged man with a light grey beard, not overly friendly. A distinct smell of booze and cigarettes appears to be following him.
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

**[Try to intimidate him. (Rhetor + dice roll> 7 or Audacious + dice roll> 6)]

{
    -try(rhetor,8) == true or try(audacious,7) == true:
    ~ XP += 30
    ~ audacious++
    Noah: There is a grand ongoing operation targeting a crime ring and our task force has been ordered to work under the utmost secrecy. Should I call the Head Commissioner to confirm this or would you prefer your employer first ? Maybe the commissioner himself would like to have a word with your employer and I hope he doesn't ask him why the custodian wouldn't cooperate and made himself an accomplice ? #Conv
    Custodian: Alright, relax detective ! I don't need that kind of trouble ! Give me a second to grab the keys. #Conv
    -> custodian_opens
    
    - else:
    -> custodian_intimidation_fail
   
}

*[Bribe him.]

~XP += 30
-> bribery_easy

= custodian_opens
The custodian returns anxiously with the key in his hand and opens Terrell's front door.
Custodian: Are we in danger, sir ? #Conv

*[Ignore him.]

~audacious++
The detective has no interest in engaging in conversation with this man and doesn't respond.
    
    **[...]
    -> terrell_night

*["No, you're not."]
The detective sighs.
Noah: No you're not. #Conv
    **[...]
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
    
    **[...]
    -> terrell_night

*[Offer him 1500.]


~sly++

Noah: Can't do that. I don't even have that much credit on me right now. You'll have to settle for 1500. #Conv 
Custodian: I'm putting my ass on the line here ! I'll take 2000, but not one meridian less. #Conv

    **["Deal."]
    
    Noah: Deal. Here you go. #Conv
    ~money -= 2000
    Custodian: There you have it. Hurry up, though and bring it over the moment you're done. #Conv
    
        ***[...]
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
    **[...]
    -> terrell_night

*[Offer him 2000.]

~sly++

Noah: I think you're overestimating the situation. Best I can do is 2000. #Conv
Custodian: No, you are the one who's clearly underestimating it. How about this, you'll give me 3000, I'll lend you the key for 5 minutes and maybe I won't mention anything. Or else... #Conv
This guy's got some serious nerve. #Thought

    **["Deal."]
    
    ~money -= 3000
    
    Noah: Deal, you can have that much. You must feel really drunk in power right now. #Conv
    Custodian: Nothing personal, detective, just your average Joe hustling for that extra payday. Here's the key, make it as quick as you can and return it to me. #Conv
            ***[...]
            -> terrell_night

= bribery_hard
Noah: Alright, we got off the wrong foot here. I actually admire your work ethic, but my admiration doesn't help here. I'll make it worth your while. How about 2000 meridians ? #Conv
Custodian: This has to be some kind of joke. I, on the other hand, seriously think that this conversation presented a lot of sensitive information and it's going to take much more than 2000 meridians for it to remain sensitive. Give me 6000. #Conv

*[Give him 6000.]
Noah: Way to exploit someone. Here's 6000. Now give me the key and never ever mention this. #Conv

~ money -= 6000
Custodian: A man's gotta have a code, detective. Make sure to bring the key over as soon as you're done. #Conv
The custodian hands the key and walks off with a saturnine smirk on his face.
    
    **[...]
    -> terrell_night

* [Offer him 3000.]
Noah: Look, you caught me in a vulnerable state. I don't have 6000 on me at the moment. I can give you 3000, though. #Conv
Custodian: Not good enough. 4000 then, or no deal. #Conv

    **["Deal."]
    Noah: That's reasonable. It's all I have on me, anyways. Here you go. #Conv
    
    ~ money -= 6000
    Custodian: Good. Take the key. Remember to drop it off as soon as you're done. #Conv
        
        ***[...]
        -> terrell_night

= terrell_night
#background #t_n
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

~ rogue++
~ rogue++

Targeting his son will probably staighten hi up right away. #Thought
Noah writes a note on the wall above Terrell's bed. The note says "Skid says 'hi' to the little fella. He might tell him in person soon." He also tears the picture of Terrell with his son and places the son's face right above the note.
Let's see how this plays out... #Thought
The detective decides it's time to go.
    **[...]
    -> side_activity

*{stole_money} [Let him know you took back Skid's money.]

~XP += 20
Noah writes a note on Terrell's bathroom mirror. The note says "Skid got tired of waiting for his money, so he took matter into his own hands. He won't be as subtle next time."
I'm practically doing this man a favor here... #Thought
Noah takes the money with him, closes the door behind him and goes about his business.
    
    **[...]
    -> side_activity

*[Give him the 'corrupt cop' warning.]

~ rogue++

Noah leaves a note under Terrell's door. The note says "Law enforcement kindly requests that your friends be paid back on time. We forward sincere greetings from the 'Red Hole'."
The detective marks the note with the law enforcement's signature stamp. Only police officers have these in their possession.
Having completed his objective, Noah walks off. 
    
    **[...]
    -> side_activity

*[Trash the house.]

~ rogue++
~ rogue++

The detective decides to follow a classic tactic. He throws different stuff around, rips some jerseys and drawings, nicks the wall and some furniture, breaks the bathroom mirror, among other things. He also leaves a note, saying "Don't make us come again."
That will do the trick. #Thought
After turning the apartment upside down, Noah thinks it's time to head for the exit.
    
    **[...]
    -> side_activity

*{empathetic>2}[Don't do it.]

{
    -rogue>1:
    ~rogue--
}

~ empathetic++

What am I doing here... This is wrong. I am not that kind of cop. Not that kind of person... #Thought
Filled with shame and regret, the detective decides to leave the man's house without doing Skid's work.
    
    **[...]
    -> side_activity


= terrell_kitchen
{once:The moment he walks into the kitchen, the detective notices a spoon and a lighter nexto to each other on the counter.|The spoon and the lighter depress the detective everytime he sees them.}
    + [Check out the rest of the house.]
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

+[Check the left mirror cupboard.]
Noah opens the left cupboard. {once:He finds a handful of stashes of money.}

{
    -stole_money: 
    Most of the stashes are now in his pockets.
    }
    
{once:Quite the hiding spot. I'm sure this is all from honest work. {rogue > 4 or sly > 4:Maybe some of that ought to keep 'Skid' content for a while.}} #Thought

    **(stole_money){rogue > 3 or sly > 3}[Take the money. (Rogue/Sly > 3)]
    The detective grabs the stash, without putting too much thought into it.
    ~ rogue++
    ~ sly++
    
    ~money+=15000

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
#background #trevor
~ HP = 50

Noah: Thanks, Trev, I feel quite better. #Conv
{~Trevor has always had his friend's back.|No matter how many times Noah gets knocked down, his friend has always picked him up.} #old_city
Trevor: {~I know your job is dangerous, just try to be a little more cautious|Maybe you should consider making better choices}. #Conv 
Trevor: {~One of these days, we will be scraping you up with a spoon|Otherwise, you'll end up in a bodybag.} #Conv
Noah: Alright, man. Tactful as always... #Conv 

*{get_in_car.talk_to_sokolov}[Ask him about Denis.]

~ XP += 20
Noah: I was meaning to ask you. A few days ago, just as I was leaving from here, this guy approached me. His name is Denis Sokolov. #Conv
Trevor: Oh right, Denis. He lives nearby. Good dude, I've known him for years. He's going through some hard times, with his niece missing. I told him about you, because I knew you could at least try to help him. #Conv
Trevor: Due to her migration status, every police station he contacted snubbed him. Trust me, he's solid. Any news on that ? #Conv
Noah: I've been doing some digging. Time will tell... #Conv
    
    **[...]
    
    ~day++
    ~timepass()
    -> next_move

+[...]

~day++
~timepass()
-> next_move


=== richter_files ===
#background #comp
{once:Noah sits in front of his computer and goes through the files he stole from Maxwell Richter's archive.}
*[...]
After hours of searching for something of note, there are only a handful of documents he hasn't checket yet.
-> richter_docs

= richter_docs

~XP += 30
These have to be important... #Thought
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
 
*[Return.]
-> richter_docs

= doc3
"Operation Successful: The latest implantation was successfully completed on Monday, November 30th. The subject is a 13 year old Caucasian female, 167cm, 53kg, blood type: 'O plus'. She has been responding as expected and has scored promising results on her cognitive tests. No signs of past memory awareness and no unexpected post-operation side-effects. Currently awaiting for the review by The Mentor in order to assign her to her class and dormitory."
{observant >= 2 and get_in_car.talk_to_sokolov:Daria Kozlov fits right in that description ! What have they done...|Poor kid, whoever you are...} #Thought

{
    -get_in_car.talk_to_sokolov:
    ~evidence += daria_document
}

*[Return.]
-> richter_docs


= files_end
{evidence has daria_document: That could be enough to issue a warrant and a full-blown investigation against this guy.|This guy can't be trusted for sure...} #Thought

*[...]

~day++
~timepass()
-> next_move

=== try_open_box ===


~ state = LIST_VALUE(box)

Noah {once:puts|has} the box in front of him. 
{observant > 2:Claudia wrote something about a key in her bible notes...} #Thought
{analytical > 4: It could be a numerical reference to that specific bible verse right below the note. Maybe even the number of the verse... [Analytical > 4]} #Thought 
Here goes nothing. #Thought #Input
The answer is 2239.

-> END

= unlocked_box

~XP += 100

{once:A green light appears, followed by a sudden click. The box is open.}
{once:Did that really just happen ?!} #Thought
Inside the box there is {once:a|the} small hologram projector and a pack containing a hard drive and some printouts. There is also a note that says "play the recording first".

What just happened ?! #Thought

*(play_rec)[Play the recording.]
#background #hologram

~ XP += 30

A hologram of Claudia appears, instantly creating a chilling atmosphere in the detective's room.
Claudia: My name is Claudia Rosalie Willford and I am 44 years old. I live in Stilton Avenue, 48, Stillfork, 44731. I am recording this message on December the 1st, 2047. #Conv
Claudia: I hope this message reaches the right people... If you are witnessing this, it probably means that I am no longer around. This is my confession. #Conv
Claudia: Fifteen years ago, I moved to my, then, soon to be, husband's, James' house, the one in which I reside to this day. I was excited to spend the rest of my life with him, especially in this beautiful apartment, located in such an esteemed neighborhood. For the first few years, everything felt so right. #Conv
Claudia: James had been living there for years, but even though he was making a good living, this place seemed quite above his budget at the time. He explained to me that his late uncle bequeathed it to him. These houses, he said, were inheritances that had been preserved and passed on through generations and a lasting community had been established between them. #Conv
Claudia: It really felt like a prestigious group of cultured and affluent people who support each other and want to give back to society. They would host fundraisers and dinner parties with high profile guests.#Conv
Claudia: I found most of the neighbors to be distant at first, they wouldn't embrace me as one of them, but over time, that changed. James started bringing me over to their gatherings, where some of them would sometimes approach me and talk to me about political and philosophical matters, sharing their "vision", asking me about my opinion as well. #Conv
Claudia: I, wanting to fit in in this protected environment, would usually reciprocate. Eventually, they started talking about the "Vision" more elaborately in front of me. An overly ambitious plan to put out a neural implant for mass distribution, promising to eliminate mental pathogenies and enhance brain activity to new heights. #Conv
Claudia: However... There's something really wrong about all of this. Last year, I overheard a discussuion between James and our neighbor, Mr.Maxwell Richter, about trying out the implant on unsuspecting university students. After the initial shock, I made it a mission to find out what this group is actually doing. I managed to gain their trust and discovered some despicable things... #Conv
Claudia: Among themselves they're called "Arbor". They are a cult-like based organization and they answer to an unknown person they refer to as "The Mentor". They used to mention him frequently, but I never got the chance to meet him. The elite members of "Arbor" bear a discrete symbol on some undisclosed part of their body. Some part that can't easily be seen. This scheme has been around for decades, constantly updating their members by recruiting or even abducting defenseless young people and enforcing their ideas on them by any means, thus creating new "seekers". #Conv 
Claudia: Their goal is to increase their political influence in order to be able to overthrow the New Republic and control the head of the state. Then they plan on passing a bill for mandatory neural implantations for whoever civilian they might see fit. Ultimately, what they aim for is rebuilding the state to their liking, with no opposition ever again. #Conv
Claudia: Inside this box, I've also included a pack of all the evidence I was able to collect. Names, transcripts, documents, transactions, conversations, anything I thought could be evidence. #Conv
Claudia: Lastly, I think that they've started to suspect me. Lately, they have been treating me differently. I've even gotten anonymous formal threats in my messages. James has warned me to mind my business, repeatedly. I know he's in this too, I just didn't want to believe it. I have to be careful of him too, after all. #Conv
Claudia: One final tip, there is a hidden vault, right under the ground floor of the building. The group have been secretly meeting there for decades, whenever they want to discuss serious matters or get in contact with the "Mentor". #Conv
Claudia: As you enter the hallway on the ground floor, on your right hand there is a painting. At its center, a circular mirror is depicted. They place their left eyeball at the center of the mirror and an underground stairway reveals itself right beneath it. That's the only way to access it, to my knowledge. #Conv
Claudia: Anyway, once I find the last pieces of evidence, I will contact the authorities. However, if anything happens to me, it won't be an accident.  Lord forgive their souls... #Conv

~ evidence += claudias_records

The detective tries to shake off his goosebumps.
Love your neighbor as yourself, right  ? You can't write this stuff... This narrows it down to a small "dream team" of suspects. #Thought
{get_in_car.leave and observant > 2: Maybe that's what happened to little Daria.} #Thought
-> unlocked_box

+ [Check out the pack.]
#background #nightfont

{
    -!play_rec: Maybe I should play the recording first... #Thought
    -> unlocked_box
    -else: Noah spends hours reading and dissecting every single file on the hard drive, every single detail written on the printouts. Funds illegally transfered to politicians' accounts, blueprints and beta testing reports on the infamous implant, transcripts, etc. Information that cannot help him determine who murdered Claudia, but can provide a solid foundation, backing Claudia's claims.
    
    **[...]
    
    ~ timepass()
    ~day++
    -> next_move
    
} 



=== coordinates ===

#background #police_station

{time_of_day == morning: As soon as Noah arrives at the precinct the following day|A few hours later}, he attempts to trace where the handwritten coordinates lead to. He types the numbers in his computer and quickly gets a result. 
    They point to an undisclosed location in the upper-west side of Aberstadt, an hour drive from the heart of the city. #old_city
    Nothing comes up about this location. Guess we'll have to find out for ourselves. #Thought
    *[...]
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
Intercom: You've reached the headquarters of VeilTech Creations, the one-of-a-kind facility that literally hands you your dreams ! Fabricate your own experiences, memories or identities with just a little help from our augmented reality environment ! #Conv
Intercom: We're sorry to announce that our workflow is in a temporary hiatus, until our legal team settles a technical dispute. We promise to be back in no time ! #Conv
-> intercom

*["Elaine Bronson"]
{observant >= 4:Elaine Bronson...that's the "E.B" from the bible note !|Is this a residence ? I don't know... [observant > 3]} #Thought 
A brash female voice answers through the intercom.
Intercom: Who is this ? #Conv

    **[Introduce yourself.]
    Noah: This is police detective Noah Taulen. Am I speaking to Ms.Bronson ? #Conv
    The other voice pauses for a moment.
    Intercom: Can you please show your badge to the camera ? #Conv
    The detective raises his police badge and displays it in front of the camera, just like he was asked to.
    
    -> ms_bronson_2

*[(blank)]
Noah: Nothing... #Conv
-> intercom

= ms_bronson_2
{once:Intercom: Yes, this is Ms.Bronson. Can I help you with something ?} #Conv

*{observant >= 4} ["Claudia Willford referred to you." (Observant >=4)]
Noah: I'm currently investigating the death of Claudia Willford and she referred to you in her private notes. #Conv

~XP += 20
A prolonged moment of silence disrupts the conversation.
Intercom: What are you talking about ? #Conv
{empathetic > 3:The pause and the slight voice break tell me that she knows.} #Thought

    ** {empathetic >3 or rhetor > 2}["I believe you knew Mrs.Willford."(Empathetic > 3 or Rhetor > 2)]

    ~ empathetic++
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


*[Explain how you found this location.]
Noah: My partner and I are investigating the death of a woman named Claudia Willford. While inspecting the scene of the crime, I found a hand-written note which included what I believe to be the coordinates of this address. Does any of this sound right to you, Ms.Bronson ? #Conv
Another silent pause, this time a bit more prolonged.
Suddenly, the building's entrance door opens automatically.
Elaine: Second floor, first door on the left. #Conv
    ** [Go find Elaine.]
    -> ms_bronson_3


= ms_bronson_3
#background #elaine
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

~ XP += 20
~ inventory += elaines_box

Elaine: The problem is, I don't know how to open this. As you can see, it is sealed by a combination lock of four slots. I remember her handing me the correct combination, but I've lost it ! I can't figure out any other way to open the box... #Conv
{versed > 3:It has to be some kind of titanium alloy, it would be virtually impossible to crack it apart, without damaging whatever is inside. [versed > 3]|I wonder if I could crack it open using something really hard.} #Thought
{partner == "Milton":Milton: This appears to be Grade 5 titanium, one of the most widely recognized for its strength and hardness. This alloy contains 6% aluminum and 4% vanadium, which significantly enhance its mechanical properties, including hardness. I would strongly advise against trying to use force to open it. |Johnson: This looks like one of those specialized cases we used in the military to store medicine. Practically impenentrable and no way to pick the lock, whatsoever. Our only chance would be the right combination. } #Conv

*[Ask Elaine about the combination.]

~ XP += 10
Noah: Can you recall any letters or characters, or even imagine what kinds of combinations she could have come up with ? #Conv
Elaine: I took a look at it when she gave it to me, I believe it was only digits. Claudia would usually hold on to numbers or phrases that meant something to her or affected her. #Conv
Elaine: I remember, at some point, her home alarm system password was a numerical reference to a verse from the bible. I wouldn't call it superstition, she was just a spiritual person. #Conv

*[Ask Elaine where Claudia found the box.]
Noah: This type of box is quite uncommon for public use and hard to find on the market. Do you know where she got it ? #Conv
Elaine: I'm afraid I don't, sir. What I do know from that is that she went to great lengths to keep the content of the box away from everyone, even her husband. This, especially alarms me. #Conv

- Noah: You've given us a lot to think about. In case you find out or remember anything more, call me or my partner on these numbers. #Conv
Elaine: I will, detective. You two seem trustworthy, not very common in your workforce these days. Part of the reason I was hesitant to hand the box to the authorities. Please, find out the truth about my friend... #Conv
The two men leave the woman's apartment, leaving her emotionally charged.

{
    -time_of_day == morning:
    **[...]
    
    ~timepass()
    -> next_move
    -else:
    **[...]
    -> side_activity
}


=== meet_partner ===
#background #police_station

Following his visit at the coroner's office, Noah arrives at the precinct.
As he walks to his office, he sees his new partner, {partner} waiting outside. #old_city 
{
    -partner == "Milton":
    Milton: Good morning, Detective Taulen. I've been informed by Sergeant Jacobs that you have appointed me as your provisional partner, effective today. #Conv
    Milton: I am honored and I will do my best to learn from you and contribute to the investigation. #Conv
    Noah: Wow, nice speech you wrote there. I appreciate it, but take it easy, we're doing the same job. #Conv
    Milton: My speech pattern is programmed in a certain way, detective. I will try to adapt to a more casual style overtime, if you wish so. #Conv
    Noah: Feel free to. Welcome aboard, then, let's grab some coffee and get down to it. #Conv
    *[Visit Dr.Castello.]
    ->dr_castello
    *[Visit Mr.Richter.]
    ->mr_richter.meet_richter
    - else:
    Johnson: Morning, boss. Cool to be on your team. We're gonna crack this case like nobody's business. #Conv
    Noah: Not really your boss, "detective" will do. I appreciate the optimism, I guess... You seem a little off today, though. #Conv
    Johnson: Oh, I just had a few drinks last night and my head's paying the bill today, haha... No big deal, I have my large black coffee right here and I'm ready for some real business... #Conv
    I hope I don't regret this. #Thought
    Noah: Get ready then, I'm grabbing some coffee myself and we're off. #Conv
    Johnson: Right on, boss. I mean, detective. Where to ? #Conv
    *[Visit Dr.Castello.]
    ->dr_castello
    *[Visit Mr.Richter.]
    ->mr_richter.meet_richter
}
    
    

=== side_activity ===


#background #nightfont
Looks like I have a couple of hours left before I go to sleep...#Thought
{~Noah feels the itch to do one more thing before calling it a day.|He feels as though he forgot something.} #pixel_river
{HP < 20:I'm hurt pretty badly though... Maybe I should go to Trevor to patch me up.} #Thought

+ {inventory has elaines_box and !try_open_box.unlocked_box} [Try to unlock Elaine's box.]
-> try_open_box

* {evidence has richters_comp} [Go through Richter's files.]
-> richter_files

+{HP < 50} [Get treatment.]
-> treatment

*{inventory has cigarette}[Light up the mysterious cigarette.]
It looks like the average blunt, but there's a slight chance I might end up regretting this. #Thought

Noah lights up the cigarette.

    **[3 minutes later...]
    
    -> mysterious_cigarette
    

+[...]

~day++
~timepass()
-> next_move

=== mysterious_cigarette ===
#background #beach
This is NOT your average blunt. #Thought

Noah finds himself on the shore of a tropical island. Crystal waters, golden sand and a lush forest inland. A soothing breeze massages his hair as he gazes upon the sight in front of him. #dream
Where am I ? #Thought

*[Walk forward.]
Noah keeps walking forward, observing more of this bizzare tropical paradise. He sees a flock of orange flamingos strutting along on the edge of the shore. As he keeps walking, he hears music getting gradually louder.

- I know this ! Mom used to play this at the piano almost every day ! Man, I haven't heard this in years. Probably since it happened... #Thought

*[Keep walking.]

- He sees a crippled one-legged young man in a police uniform trying to light a campfire. He looks rather familiar.

Noah: Garza ?! Dude, what the hell are you doing here ? #Conv
Garza: What am I doing here ? What the hell took you so long to come visit, Taulen ?! Bring it in bro ! #Conv

The two men hug it out like it's been years since the last time. And it has. 
Noah: Dude, long time no see. I missed your stupid face. What do we have here ? #Conv
Garza: Man, have you looked in the mirror ? Ah, trying to light the damn campfire cause we wanna have marshmallows later. #Conv

*["Oh, I used to devour these..."]
Noah: Oh, I used to devour these... #Conv
Garza: I know, your mom told me. I knew you were coming and I couldn't find the right snack for tonight's beach party. Then, Loretta said how you used to stuff your big fat mouth with these and here we are. #Conv

*["We ?"]
Noah: We ? #Conv
Garza: Yeah, all your friends and family. We're having a great time here, but we were missing you ! Mr.Hercules Poirot over here ain't got time, apparently... #Conv

- Noah gets taken aback.
Noah: My mom is here ?! #Conv
Garza: Of course she is ! How could she miss it ? Your dad is here too. #Conv
Noah looks surprised , only this time not as excited.
Noah: Is that so... dad, too... #Conv
Garza: They're all at the camping, about half a mile from here. Let's go see 'em. #Conv
The two of them start walking together. Garza leaves the flintstones down and springs up on one leg, without any aid.

Noah: How did you do that ? #Conv
Garza: As you remember, after the accident we didn't really have much time to hang out... A couple minutes if I'm not mistaken. Then, we were forced to go our separate ways, so you never really pictured me limping. That's why I can hop like a pogo stick like it's nobody's business ! #Conv
Garza: But seriously, we haven't seen each other since, except for a few foggy dreams of yours, but you would always leave too soon. This is the real deal. So, what's new with you, man ? #Conv

*["I've been working on this crazy case."]
Noah: I've been working on this crazy case for some days now. I'm telling you, it's nuts ! Crazier than the one where we discovered the loan shark nuns, dare I say. #Conv
Garza: Awww, tell me you didn't just say that ! What's this one about ? #Conv
Noah: There's this classy lady who died in her appartment on Stilton Avenue, and it's clear as day that there's foul play, Someone shot her straight in the head ! Thing is, the street camera never saw anybody enter or leave the apartment block apart from the other residents within the last 48 hours. So it has to be someone in there ! Also, most of them seem pretty weird. #Conv
Garza: Yeah, I don't like them either. But watch out, especially for that Italian one. She's a lsexy little devil. #Conv
Noah: But how do you... Right, it's just my mind. #Conv

*["Honestly, nothing good."]
Noah: Honestly, nothing good. In fact, most days, I can't even find a good reason to get out of bed in the morning. Everything is a vicious circle, the world is getting darker, relationships become more meaningless and people delve deeper into amorality every single day. And I feel like I have nobody close to me to convince me otherwise. #Conv 
Garza: Look bro, it's people like you that need to take it upon themselves and drag the rest of the world upward. Life is a plant. The more you water it, the stronger it becomes. Sure, sometimes there might come a dog to chew on you or step all over you, but you have unlimited seeds. So, you grow it back. #Conv
Noah: Have you also been hanging out with Confucius over here ? #Conv
Garza does his signature thundering laugh.
Garza: Just assembling thoughts that at some point might have crossed your mind. #Conv

- Noah: Anyway... I'm so sorry for how things played out. You shouldn't have been near that bomb. I should have cleared your path. We lost you way too soon... #Conv
Garza: Don't sweat it. Life happens. Come on now, let's get back to the others. #Conv
-> before_camp

= before_camp
#background #cabins
As they continue on, they finally reach the camp.
An idyllic, peaceful settlement.
Garza: Alright, man, it was great catching up, but I shouldn't keep you to myself. Time to catch up with your folks. See ya ! #Conv
A whirl of sand forms right below Garza and swallows him whole.
Noah: Wait !! What whas that, where did he go ?! #Conv
Okay, Noah, focus, you're hallucinating. #Thought
Noah decides to check out the tiny camp.
*[...]
-> camp


= camp
#background #cabins
{once:A man is sitting by the small dock, fishing.|He is still sitting there, fishing without a care in the world.} {once:About 30 meters behind him there's a small wooden cabin, with its door cracked open.The music he started hearing a while ago seems to be coming from there. It is now clearer than ever.|The cabin's presence is calling him.}

*(fisher)[Approach the man.]
-> fisherman

*(mom)[Visit the cabin.]
-> mother

*{mother and fisherman}[...]
-> cynthia

= fisherman
Noah walks towards the tranquil man. #background #dad
Noah: Excuse me, sir, I'm new here and I'm kind of lost. #Conv
Fisherman: Shhh ! You're gonna scare them away ! Do you know how hard it is to attract white mulefrogs this time of day ?! That's why I'm sitting here quiet, all by myself. #Conv

    **["Sorry."]
    Noah: Sorry, didn't mean to bother you. #Conv
    Fisherman: Well, that and 2 cents will get you a candybar. Now you ruined it. What do you want ?! #Conv
    
    **["'Mulefrogs' ? What are you talking about ?"]
    Noah: 'Mulefrogs' ? What are you talking about ? #Conv
    Fisherman: What don't you understand, boy ?! Half mule, half frog ! Quite a delicacy. They used to be everywhere around these places, but tourists such as yourself have driven them away ! #Conv
    
    --Noah: Right... I was looking for my mother. Her name is Loretta, Loretta Harding. I've been told she's staying in this camp. #Conv
    
    Fisherman: She's in the cabin behind us, playing that damn piano all day. You used to get a kick out of it. I, on the other hand, was ever too crazy of a fan of the medium. #Conv
    
    Noah steps a little closer to the man, trying to get a better glimpse of his face. With the fishing hat not hiding his face anymore, Noah witnesses an all too familiar face, someone who his mind had impulsively tried to delete from memory. He looks like he hasn't aged a bit since the last time Noah saw him, 25 years ago.
    
    Noah: You... Why are you here... #Conv
    
    Fisherman: What a way to greet your own father ! No wonder I left that day and never came back... #Conv
    
    **["So, I was the problem..."]
    Noah: So, I was the problem... #Conv
    Fisherman: Damn right you were. I did the best I could for you, and in return, you always disappointed us. Detention after detention, stealing, getting into fights, always on the verge of dropping out. An unremarkable son, through and though. Always running to your mother, afterwards. You came right between us. You're the reason we drifted apart. #Conv
    
        ***["Not because you're a cheating, gambling drunk ?"]
        Noah: Oh, so not because you're a cheating, gambling drunk ? You made everyone's life hell those last few years before mom's illness ! You know what, maybe you leaving was the best for her. At least she managed to find some peace before she passed... #Conv
        
    **["No, it's because you're a coward,"]
    Noah: No, it's because you're a coward. When you learned about the seriousness of mom's illness, you ran away. You realized she wouldn't be able to put up with your crap and sacrifice herself anymore, so there was nothing for you to gain. Right when she needed you most. #Conv
    
    -- His father lowers his head, shamefully.
    Fisherman: You're right... I had my demons. Your mother was a saint, how she tolerated me I'll never know. You had every right to push back the way you did then. I didn't deserve either one of you... #Conv
    Fisherman: I'd like to think we had a few good moments here and there too, though. Like that time we went fishing at your grandpa's village, right ? #Conv
    
    **[Just regular boring fish, not 'mulefrogs'.]
    
    
    Noah: Yeah, but regular boring fish, not 'mulefrogs' whatever those are... #Conv
    His father busts a laugh.
    Fisherman: You're right. It's never too late, you know. This is much more fun. Come on, grab this second rod and I'll show you ! #Conv
    
        ***[Fish with your father.]
        
        ~ empathetic++
        Noah spends an hour fishing mulefrogs with his dad, having pleasant conversation and some laughs, while trying to make amends.
        Fisherman: Eight mulefrogs, huh ? Beginner's luck is a thing, don't get too cocky now. #Conv
        Noah: Of course, you were going to say that ! Anyway, that was fun. I don't think I can forgive you yet, but I see that you meant to be better. #Conv
        Fisherman: I had a blast, too. If you never forgive me, I understand. I will always be sorry and I loved you both, even if I could find the right way to express it. I also wish this was real... #Conv
        Noah: Oh. Right... #Conv
            ****[...]
            -> camp
        
        ***[Decline.]
        Noah: Actually, I'd like to catch up with mom, too. #Conv
        Fisherman: Oh, I see. Maybe later then. #Conv
        Noah: Maybe... #Conv
        
            ****[...]
            -> camp
        
    **["Bye, dad."]
    
    ~ audacious++
    
    Noah: Bye, dad. #Conv
    Noah turns around and walks off.
    The cold, strict tone in his voice shows that he neither forgot, nor forgave.
        ***[...]
        -> camp
    
    
    
= mother
Noah pushes the door wide open. #background #mom
He sees his mother sitting in front of the piano, practicing the same piece that always relaxed him as a child. She is still as young as she was when he was nine years old.

Loretta: Noah ! Come here, I've missed you so much ! #Conv
Noah hugs his mother tight. 
Noah: Missed you too, mom. #Conv

-> loretta



= cynthia
#background #storm
Suddenly, a roaring thunder rumbles in the distance.
The sea and the sky turn black within seconds. #storm
Noah sees a hand emerging from the sand. The hand grabs him by the foot and starts dragging him downwards.
Noah: What is this ?! HEEELP !! #Conv
-> before_cynth

= before_cynth
#background #black
He tries his best to stay afloat, but the force is overwhelming.
Noah opens his eyes. 
*[...]
-> cynthia_

= cynthia_
#background #cynthia
He realizes that he's inside his old bedroom. The exact same pieces of furniture, only the shapes and colors seem a bit off.
He sees the back of a young blonde woman, standing in front of the window, looking off to the purple sky. Noah recognizes her figure immediately. #cynth
Noah: Cynthia ?! What are we doing here ? #Conv
Cynthia: In our old apartment ? I don't know, I guess we're savoring our last minutes living here. #Conv
Noah: This is the day you left, isn't it... Why would you want to revisit that ? #Conv
Cynthia: This is your brain we're in. It's about what YOU want. As was always the case... #Conv

-> cynthia2

= cynthia2

*["The note you left me..."]
Noah: The note you left me... I still have it on my desk. #Conv
Cynthia: Is that supposed to strike a chord with me ? Enough to make me give you another chance ?! #Conv

    **(immature)["You didn't explain anything !"]
    Noah: You didn't explain anything ! It was one paragraph, so vaguely written, I couldn't understand a thing ! I never even saw you again... #Conv
    
    Cynthia: You saying that proves my point exactly. You had become so self-centered... so crawled up in your own shell of neglect and self-pity that you couldn't see past your nose. You had become someone else. Not the man I fell in love wih... #Conv
    Cynthia: I tried so hard to keep you afloat and you'd always assure me you would try, too. At some point, it dawned on me that no matter what I did, the choice was up to you. But you had made your choice, and as it turns out, we wanted different things in life. Having finally grasped that, I felt that the most ethical thing to do was let you live your life the way you chose to and go my own way. That's what was best for both of us. #Conv
    
    **(mature)["Your leaving was a wake up call."]
    
    ~XP += 10
    Noah: Your leaving was a wake up call. The letter spelled it out, too. My downward spiral was dragging you out, as well. I was just too selfish to realize it. I know you did the best you could to help me, time and time again. I don't blame you. 
    Noah: From that day on, I've been trying to turn myself around. It's not easy, I still fall flat on my face from time to time. But I get back up and move on. Eeryday, it gets a little easier. At least, that's what I keep telling myself. #Conv
    Cynthia: I'm glad to hear that. It means that something good came out of it. #Conv
    
    -- Cynthia: Anyway, here we are now. Us being here means that this particular moment has been burdening you. So, here's your chance to say or do whatever will bring you closure. #Conv
    
    **["Is there still hope for us ?"]
    Noah: Is there still hope for us ? #Conv
    
    {
        -immature:
        Cynthia: No. It pains me to see that you didn't learn anything. The way you reacted to my letter means that you haven't done any self-reflection. I am tired of running in circles. I'm sorry, Noah. I have moved forward. You must, too. #Conv
        
        -mature:
        Cynthia: I don't think so, Noah. It's great that you got better and I'm very happy for you. You were an important chapter of my life and I have so many fond memories of you. But we can't make true progress if we run back to people who remind us of our former selves... #Conv
    }
        ***[Ask for a last kiss.]
        Noah: Understood. Can we have at least one last goodbye kiss ? #Conv
        Cynthia: I'm afraid, no. You can cherish what we've already had, like I do. This kiss will do you more harm than good. You have to get over me... #Conv
        
            ****["Alright."]
            
            ~ XP += 10
            
            Noah: Alright, then. Lesson learned. Thank you for everything. #Conv
            Cynthia. I hope you've found the life you deserve. #Conv
            
            Cynthia: I wish you the best, as well... #Conv
            -> dream
            
            ****[Lean in to kiss her.]
            Despite Cynthia's rejection, Noah is unable to control his emotions. He approaches Cynthia and leans in to kiss her.
            Cynthia: No ! Don't do it, leave me alone ! I will make you regret it ! #Conv
            Noah: Come on, I know you want this, too. You could never resist me ! #Conv
            Cynthia: I SAID NO. #Conv
            Her voice changes mid-sentence to a demonic growl. #background#beast
            Noah is stupefied. The angelic looking Cynthia transforms into a bloodthirsty biblical beast.
            Beast: I WARNED YOU. NOW YOU'RE DONE. #Conv
            The beast devours Noah outright.
                *****[...]
                -> nightmare
        
        ***["I understand."]
        
        ~ XP += 20
        Noah: I understand. Thank you for being this honest with me. That'ss what I truly needed. I wish you nothing but the best. You deserve it. #Conv
        Cynthia: You're a very gentle soul, Noah. I know you'll create the life you deserve, too. #Conv
            ****[...]
            -> dream
        
    **["I want to thank you."]
    
    ~XP += 30
    Noah: Actually, I want to thank you. You kept offering me unwavering love, even when I was at my absolute worst. When I finally became unbearably toxic, to the point that you would start rotting away with me, you took a leap away, dressed me down and shook me to my core. I will never be able to repay you, but I hope you're living your best life. #Conv
    
    Cynthia: I don't know what to say. I'm so proud of you ! You're finally ready to move forward. I wish you nothing but the best, Noah ! #Conv
        
        ***[...]
        -> dream
    
= dream 
#background #nightfont
Noah wakes up in the middle of the night from his drug infused slumber. 
That was... intense... It will be a while till the next time I buy cigarettes from a stranger. #Thought
*[...]

~ day++
~ timepass()
-> next_move

= nightmare
#background #nightfont
~ HP -= 10
Noah sprang awake in fear.
He is soaking wet. #old_city

What on earth was that !! I'm never buying shit from strangers, ever again. I might have some unresolved internal issues, too... #Thought

*[...]

~ day++
~ timepass()
-> next_move
    

= loretta

*(where)["What is this place ?"] #Conv

Noah: What is this place, mom ? #Conv
Loretta: Remember how I always used to say that I wanted to find a job as a music teacher in a small town right by the sea and have us live there ? Well, here we are, but I don't even have to work ! Also, your imagination is running wild, crafting this paradise ! Good job son, it's part of the charm ! #Conv

    **["So, you just relax and play music all day ?"]
    Noah: So, you just relax and play music all day ? #Conv
    Loretta: Mostly. But we have such a great little community here and we're really having fun ! We feast, we play sports, we have theater nights, we're doing arts and crafts, you name it.  #Conv
    
    -> loretta
    
    **["Who else is here ?"]
    Loretta: Who isn't, really. All your good pals from school, Esteban Garza from work, Cynthia, our friends from the old neighborhood, your grandma, the list goes on and on... #Conv
        
        Noah's heart skips a beat.
        Noah: Cynthia is here ? #Conv
        Loretta: Yes. I believe you two have left some unfinished business. You should get the chance to talk to her while you're here. #Conv

    -> loretta


*{mysterious_cigarette.fisher}["What is dad doing here ?"]
Noah: What is dad doing here ? #Conv
Loretta: He never admitted it, but deep down, he also wanted to live by the sea. I pressured him a little bit and he finally cracked, so we live here now. During most of the day, you'll find him fishing. He insists that mulefrogs are a spectacular and nutritious dish, but I always make sure to have a trash can in close proximity. #Conv

Noah: No... I mean, how could you be together after everything he did ? #Conv
Loretta: Well, this is your subconscious, I guess you see what you would have wanted to see. Besides, you know me, I've never been the one to hold a grudge. #Conv
-> loretta

*(sickness)["I see that you're not sick here..."]
Noah: I see that you're not sick here... #Conv
Loretta: You're right, here, I never was. I am just as you want to remember me. I know how much this cost you... As much as you tried to keep it together for me and give me courage. #Conv

    **(grateful)["Your attitude gave us courage."]
    
    ~XP += 10
    Noah: It was your uplifting attitude that kept our spirits up during the hardest of times... You were basically fighting two battles at once. #Conv
    Noah: After an extended period of grief and crying myself to bed, I realized that the sadness of your absence was caused by how special of a person you were. From that point on, I turned it around and considered myself grateful for all the great qualities you passed on to me and the wonderful memories you provided. Thank you. #Conv
    
    **(depressed)["It took a huge toll on us..."]
    Noah: It took a huge toll on us.. I think I went 3 straight months with 2 to 3 hours of sleep, at best. And the fact that we couln't do anything to save you made us feel totally useless... #Conv
    Noah: When you finally passed, everyone was telling me what a relief this is. That you're finally free from pain and that the family no longer has to bear the burden. But now we had to deal with your absence, which was the hardest thing to do. No more of your smile, your laughter, your advice, your support, your music. No more. #Conv 
    
    -- Loretta:{grateful: I'm very happy to hear you have come to terms with it. You realizing all these things means I did something right.|I'm very sorry that you still struggle. This is one of the worst feelings a mother can experience.} Always remember this: The grass is not always green. Most of the times, you'll have to water it yourself. #Conv
    Loretta: Very much like solving a case. I think, so, at least, I've never worked one. Interrogate yourself hard. Eventually, you'll get the answers you need. #Conv
    
    ->loretta
    
    *{where and sickness}["This is great !"]
    Noah: This is great ! I missed these lenghty conversations ! #Conv
    Loretta: Me too, darling. But I think it's time to go now. #Conv
    Noah: What do you mean ? #Conv
    Loretta: I'll always be here for you. But there are other people who would like to have a word with you.Some have unfinished business with. #Conv
    Noah: Who ? #Conv
    His mother slowly evaporates and eventually disappears into thin air.
    Noah: Mom ! Wait !! #Conv
    What is happening... #Thought
        **[...]
        -> camp
    




//-> next_move
    

=== get_in_car ===
#background
#first_scene

Noah gets back in the car.
    
Visibly irritated... #old_city


Dammit. I still feel some pinching in my fingers... #Thought 

    
{versed>1:he knows this feeling.}His left prosthetic arm causes him trouble from time to time, hence the bad mood he occasionally finds himself in. 

The more Trevor tries to fix my arm, the less I believe that he's a licensed doctor. #Thought 
    

*[Start the car.] -> start_car
  
= start_car
"Excuse  me, sir !"#Conv
An odd, disheveled man hurryingly approaches Noah's car. 

Stranger: I'm sorry to bother you, I'd just like a minute of your time... #Conv 
* [Brush him off.]
-> get_in_car.start_car2



=start_car2
Noah: Sorry, I don't have any change on me and it's getting late- #Conv

Stranger: No, you don't understand, it's very serious... #Conv
*   [Ignore him.]
Noah: I should really be going... #Conv
Noah starts the car abruptly and leaves the man behind.
He knows that beggars and addicts are quite common in this area, hence the spontaneous reaction.
    
    **[...]
    -> ride_home
*   [Talk to the man.]

~XP += 40
Noah: Can I help you ? #Conv
Stranger: Yes, please ! My name is Denis Sokolov, I work at the Epsilon Motors factory, three blocks from here. #Conv
D.Sokolov: Pardon my indiscretion, I noticed you coming out of Mr.Morrisey's office. He has mentioned having a friend who works in law enforcement. I saw the car and I figured it must be you. #Conv
    
    **[...]
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
D.Sokolov: I contacted every precinct in the city, I filed missing reports, but everybody shrugged me off. #Conv
D.Sokolov: All I've been told is that the case has been filed as a low priority, because Daria is an immigrant and she doesn't have papers here. #Conv
-> get_in_car.talk_to_sokolov_2

= talk_to_sokolov_2
{&The tone in Noah's voice starts to gradually soften.|Noah needs some more information...|Sokolov's jaded face has started to gain some sympathy.|What else could Noah need to know about this girl ?}
* (lasttime)[Ask him about the last time he saw her.]
Noah: Can you remember the last time you saw her ? #Conv
D.Sokolov: It was on November 16th, around 9:40 P.M., I was about to go to the factory to start my shift and Daria was eventually supposed to go to bed. #Conv
D.Sokolov: I got home around 8:30 in the morning and I figured that she had already left for school, like every other day. #Conv
D.Sokolov: However, she never got back ! I called her friends and they told me she didn't show up at school, I also went to the school to ask and they told me the same thing... #Conv
D.Sokolov: I talked to everyone I could, the neighbors had no clue either... I'm still looking everyday with the help of some friends and neighbors. #Conv
-> talk_to_sokolov_2

* (ran)[Ask him if she could have run away.]
Noah: Is there any reason that could have caused her to run away ? #Conv
D.Sokolov: God, no, I can't imagine ! She's like a daughter to me and I promised her mother that I would take care of her. #Conv
D.Sokolov: Sure, we argued from time to time and the transition after moving here hasn't been easy for her, but she's a good kid and a great student. She wouldn't have done anything like that... #Conv
-> talk_to_sokolov_2

*(picture)[Ask for a picture of the girl.]
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

* {picture or ran or lasttime} [End the conversation.]
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

    *[...]
    -> ride_home

    

=== ride_home ===
#background #jazzy
{ride_home.music: Jazz always helps him collect his thoughts at the end of the day.|Noah puts his fingertip on the scanner to start the car..}

                
*   [Turn on some music.]
-> ride_home.music
*   {get_in_car.ask_sokolov} [Look up Daria Kozlov.]
-> ride_home.look_up_daria
*   [Start driving.]
-> ride_home.homicide_call
    
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

The radio hisses momentarily. #pixel_river


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
* [...]
-> crime_scene

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

*{came_from(->situation)}[Enter the apartment.]
-> crime_scene.apartment

= situation
Officer: A woman, fatally shot, detective. Apartment D3, on the fourth floor. #Conv

* ["On Stilton Avenue ?"]
Noah: On Stilton Avenue, huh. You don't hear that everyday... #Conv
Officer: Unusual, indeed. Anyway, the medical examiner and the sergeant are upstairs on the scene. #Conv
-> crime_scene.talk_to_policemen




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

~ XP += 10
Noah: I just came back from joint maintenance ! #Conv

Sgt.Jacobs: Fine... #Conv

* [Talk back.]

Noah: Sorry, please don't withhold my overtime pay. Oh right, that's totally made up... #Conv

~ audacious++


* [Make an excuse.]

~sly++
Noah: I found traffic downtown, sarge. #Conv
Sgt.Jacobs: Next time come up with something more original. #Conv

* ["You know me, sarge..."]

Noah: You know me sarge... #Conv
Sgt.Jacobs: How'd you fit that big head of yours through the door ? #Conv

- Sgt.Jacobs: Anyway, here's the rundown. Her name is Claudia Willford, 45 years old, fatal wound to the head by a gunshot. The gun that was used was an 99K Arnold, also found within the crime scene.#Conv
Noah: These are very hard to find in public ! We don't even have these in our squad... #Conv
~ evidence += murder_weapon
Sgt.Jacobs: Indeed. We don't know whose it is or where it came from yet. You should dig into this. #Conv
Sgt.Jacobs: She was found by her former housekeeper, who came by around 22:40 to give her something. She heard a gunshot as she was arriving and Mrs.Willford wouldn't open the door. #Conv
Sgt.Jacobs: Then, she rushed to her car to grab her backup key, got back up, opened and witnessed the body. She called Mrs.Willford's husband right after she called us. #Conv
Sgt.Jacobs: Judging by the body, this happened within that same hour. #Conv
-> sergeantconv

= sergeantconv
An unpleasant odor starts surrounding the atmosphere.
* [Suspect the husband.]
Noah: Well, the husband is always an easy suspect. #Conv
Sgt.Jacobs: Hey, don't start ruffling any feathers, unless we can rule out other scenarios. It looks like he has an alibi. He was out in a bar with a colleague. We contacted the colleague and the bar staff and they confirmed the story. #Conv
Sgt.Jacobs: His name is James Willford, he is a strategy analyst at Ichor. #Conv
Noah: No wonder they could afford this place... #Conv
Sgt.Jacobs: He probably carries some clout, so don't make any brash decisions. Regardless, pay attention to what he tells you. #Conv
-> get_to_work

* ["Where was she found ?"]
Noah: Where was she found ? #Conv
Sgt.Jacobs: On her bed, lying on her left side with the gun next to her. There is no apparent sign of forced entry, but we're still evaluating all probable causes. #Conv

~ evidence += corpse_state

Sgt.Jacobs: Regardless, her husband claims that no property appears to be missing. Nothing that he knows of at least. #Conv

~ statements_ += no_missing_property

-> get_to_work
* [Suspect the housekeeper.]
Noah: Seems a little late for package deliveries by the housekeeper, right ?  #Conv
Sgt.Jacobs: She was supposed to leave the city tomorrow and she wanted to leave Mrs.Willford a gift. #Conv
Sgt.Jacobs: Not a priority suspect, she wouldn't have a clear motive to report her crime. She also knew about the street cameras, so it seems unlikely. #Conv
Noah: Right, it's quite a strech. #Conv
Sgt.Jacobs: Still, don't let your guard down. #Conv
 -> get_to_work

*[Ask about the neighbors.]
Noah: Didn't the neighbors see or hear anything ? #Conv
Sgt.Jacobs: Nothing that we know of. You'll have to take detailed statements from them in the next few days. #Conv
Sgt.Jacobs: Right now, the crew is checking to see what the street camera recorded, who entered, who exited, etc. I'll give you a rundown, first thing tomorrow. #Conv
-> get_to_work
        

= get_to_work
Noah: Alright, time to get to work. #Conv
Sgt.Jacobs: Take statements from the husband and the housekeeper and start investigating this place. #Conv
-> talk2others

= talk2others
*(hk)[Talk to the housekeeper.]
-> crime_scene.housekeeper
*(hb)[Talk to the husband.]
-> crime_scene.husband
*{hk and hb}[...]
-> inspection

= housekeeper

Noah approaches the scared housekeeper.
Noah: Sorry for your loss. I'm detective Noah Taulen, you must be the housekeeper. I need to take your statement, can I have your name ? #Conv
Housekeeper: M-My name is Rita Stamopoulos, sir... #Conv
*(calm_down)[Calm her down.]

~ XP += 20

~empathetic++
Noah: Let me clarify, just because you discovered Mrs.Willford doesn't mean you're a suspect. There is no evidence to support that at the moment, so there's no need to worry. #Conv

*[Just follow the procedure.]
Noah: I want you to recount what transpired. #Conv

- Rita: Excuse me if I get emotional, I can't help it. #Conv
{calm_down:Noah: That's alright. } #Conv

*[...]
-> housekeeper2

= housekeeper2
#background #apartment
Rita: I was near the neighborhood, so I decided to come by and leave Mr.and Mrs.Willford a gift I bought for them. #Conv
Rita: I should be in a train right now, so this was my last chance to bring them a gift. #Conv
Rita: I arrived a little after 22:30, parked the car and entered the building, nothing unusual so far. As soon as I got on the 4th floor, I heard something like a gunshot ! #Conv
Rita: I figured that the sound probably came from their apartment, but I still wasn't sure what to make of it. I rang the doorbell, but nothing. Then, I called her on the phone, again, no response. #Conv
Rita: I felt that something was off, so I tried to open the door by eye scan. To my surprise, the system didn't recognize me ! #Conv
Rita: I went back to the car and searched for a backup key they had given me for housekeeping hours. I found it, came back, got in the apartment and witnessed Mrs.Willford shot in the head, lying on her bed ! #Conv

~ statements_ += ritas_arrival
*["Does the eye scanner malfunction ?"]
Noah: Does the eye scanner malfunction ? #Conv
Rita: I don't remember it not recognizing me, ever. Only registered house inhabitants are allowed to open the apartment's door, and the Willfords had me registered too. #Conv
Rita: About a week ago, during my last day working here, the scanner granted me access, as normal. Maybe they erased my profile as soon as I was gone. Νow I'm just a former employee. after all. #Conv
Rita: I just happened to have the backup key that Mrs.Willford had given me a couple of months ago. #Conv

~XP += 20
~ statements_ += scanner_malfunction

*["How long have you had the backup key ?"]
Noah: How long have you had the backup key ? #Conv
Rita: It's been a couple of months. Mrs.Willford gave it to me one day, and it made me wonder, because I never had issues with the scanner. She just said "You never know". #Conv
Rita: Maybe they just deleted my profile, as soon as I stopped working here. It makes sense. #Conv

 - Rita takes a moment to compose herself.
*{calm_down} [Offer her some water.]

~ XP += 10
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
Noah: How come you didn't call Mr.Willford too before you entered ? #Conv
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

~ analytical++
~XP += 20

- Noah: Hmm... #Conv
*(ask_rita_couple)["What was the couple like ?"]
Noah: How was your relationship with the couple ? #Conv
Rita: Only great things to say. I'd been working for them for the last five years, or so. Most people hire androids for these jobs, as they cost less, but in this climate, the Willfords chose to help a fellow human. #Conv
Rita: Truly kind people, especially Mrs.Willford. #Conv

*["Did Mrs.Willford display self-harming tendencies ?"]
Noah: Did Mrs.Willford display self-harming tendencies ? #Conv
Rita: No, I wouldn't say that. Despite some hardships earlier in her life she used to be an optimistic person. However, she seemed insecure and leery lately, I don't know why. #Conv
Rita: I'd been working for her for the last five years, so I could tell that she wasn't her usual self. #Conv

- Rita: Unfortunately, I had to quit last week, because my mother's health has deteriorated and I have to take care of her. #Conv
Rita: She lives in a small town far from Avalon, so I have to permanently move there. I bought this nice vase for them as a token of gratitude. I waited until last minute because I was just able to afford it. #Conv
Noah: You said you had to catch a train, right ? #Conv
Rita: Yes, it has already left as we speak. I had no other choice, because I also have to return the car before I leave. Now, I must catch another train, but I'll have to wait at least for a week for cheap tickets . #Conv
{calm_down: Rita: I must be there within the next two days by any means, but I can't afford to chip away at my daughter's security deposit again... I'm sorry, you're trying to do your job and I'm just rambling about my problems.}#Conv
*(give_her_money){calm_down}[Give her ticket money.]

~XP += 20
Noah: I will give you 2000 meridians that I have on me right now. #Conv
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

- Noah: Here is my number in case you have anything else to report. #Conv
Noah gives Rita his number.
Noah:{money == 8000: Have a safe trip and take care.|Take care.} #Conv
Rita:{money == 8000: Again, I can't thank you enough. With more people like you the world would be a better place.|I'm sorry to have bothered you with my problems.} I hope you do right by Mrs.Willford... #Conv

->talk2others

= husband
Noah approaches the husband, who stands at the corner of the living room, looking overwhelmed.

Noah: Mr.Willford, I'm detective Noah Taulen. #Conv
* ["I'm sorry for your loss."]
Noah: I'm very sorry for your loss. I understand that this is hard for you, but could you walk me through the course of the events ? #Conv
Mr.Willford: S-Sure, just g-give me a second... #Conv
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

~analytical++

Noah: Excuse my boldness, I just have to be thorough. #Conv
-> husband2

* [Ask about his way back home.]
Noah: Did you happen to notice anything unusual on your way back here, like any odd faces around the building ? #Conv
Mr.Willford: Nothing comes to mind. I wasn't really paying attention, in the state that I was. God, I wish I'd been here... Now I have to live with this guilt forever...#Conv

-> husband2


= husband2

{~Claudia's husband looks out of place.|He is clearly uncomfortable in this setting.|}

* (gun) [Ask about the gun.]
Noah: I believe you're aware that a gun has been found on the scene. Was that your wife's possession ? #Conv
Mr.Willford: God, no, I... I have no idea where it came from. We never felt any need for guns, this is a safe district after all... or so I thought. She knew my distaste for guns, I don't want to think she was keeping it hidden ! #Conv
Noah: Can you think of anyone that would want to cause harm to your wife ? #Conv
Mr.Willford: Not at all, she had no enemies. She was the sweetest person. Her reputation was remarkable. #Conv

->husband2


* (apartment_state) [Ask about the apartment's state.]
Noah: Did you happen to notice anything missing or out of place ? Anything at all ? #Conv
Mr.Willford: No, nothing looks different, I checked all of our belongings... I have to be honest, Claudia had been struggling with some personal issues for quite some time... #Conv
Mr.Willford: She went to doctors, took medication, but her depression wouldn't go away. I can't believe I'm saying this, but maybe she decided to put an end... #Conv

**[Ask about her depression.]

~empathetic++
Noah: Pardon my nosiness, but what troubled your wife ? #Conv
Mr.Willford: Claudia was always somewhat melancholic, tracing back to her rough upbringing, bouncing between foster homes. #Conv
Mr.Willford: It's probably why she never felt comfortable in this lifestyle that we secured for ourselves, she never fit in these circles. #Conv
Mr.Willford: We also had a miscarriage a few years ago, and while it was really hard for both of us, I know that she never got over it... #Conv
-> husband2

**["Did you have any alarm system on ?"]

~ analytical++
Noah: Did you have any alarm system on ? #Conv
Mr.Willford: We always set it off whenever we're here, so no... #Conv
-> husband2


* {gun and apartment_state}[Proceed with the investigation.]
Noah: Thank you for your time Mr.Willford, our team will proceed with the investigation. The officers will escort you to the police station for some procedurals. #Conv
Mr.Willford: I hate saying this, but I have a feeling she did this to herself. Not long ago, her shrink confided in me that she suffered from clinical depression and that there was a high risk for self-harming tendencies. #Conv
Mr.Willford: You can talk to Dr.Manuel Castello, I know I definitely will. His office is on Vinespring Heights 88. I hope he can help us get answers... #Conv
Noah: I will contact him. Again, my condolences, may she rest in peace. #Conv

Mr.Willford: Thank you... #Conv

-> talk2others


= inspection
#background #apartment

{
    - not statements and TURNS_SINCE(->bedroom) == -1 && TURNS_SINCE(->living_room) == -1 && TURNS_SINCE(->kitchen) == -1 && TURNS_SINCE(->bathroom) == -1:
    Willford and the housekeeper are escorted outside by officers and the commotion gradually quiets down as the crowd disperses. 
    It is time for the detective to look for answers. #old_city
    - else:
    {~Any corner of the house could reveal something.|It's as if two completely different people lived here...|What else can we find...} #Thought
    
}


+ [Inspect the bedroom.]
-> bedroom
+ [Inspect the living room.]
-> living_room
+ [Inspect the kitchen.]
-> kitchen
+ [Inspect the bathroom.]
-> bathroom
* {not statements and crime_scene.bedroom and crime_scene.living_room and crime_scene.kitchen and crime_scene.bathroom} [End the inspection.]
I think I have enough for the time being. It's gonna be a long day tomorrow, better catch some sleep. #thought
Noah informs the remaining officers and heads home.
    **[...]
    -> police_station

* {statements} [Leave the house.]
-> statements.fourth_floor


= bedroom
#background #bed
The {bed:soaked sheets create a nauseating scent|bedroom looks plain and austere}. {paint:The painting looks macabre, considering what transpired before it|Across the bed hangs a large intriguing painting}. {claudi and jamess:The contrast between the two nightstands suggests the difference of characters.|By both sides of the bed are the couple's nightstands}. {platform:The view from the balcony provided a much needed chance to get some air.|There is also a slim French window, that leads to a small balcony}.
+ (bed)[Inspect the bed.]
-> bed_inspection

+ (jamess)[Inspect James' nightstand.]
-> james_stand
+ (claudi)[Inspect Claudia's nightstand.]
-> claudias_stand
+ (paint)[Take a look at the painting.]
-> painting
*(platform)[Scan the balcony.]
-> balcony

+ [Search the rest of the house.]
-> inspection

= balcony
#background #balcony
Noah opens the window by pressing the button. A stunning view of the city below. About a meter and a half below the balcony and around a meter to the right, there is a scaffold-like platform. Between te scaffold and the balcony, the detective notices a few marks on the wall. 
{analytical > 2: Since there's no sign of forced entry, the only way someone could have broken in is if they used the platform to climb here and the window was unlocked.} #Thought
    *[Take a picture.]
    Noah takes a picture of the marks next to the scaffold.
    
    ~evidence += scene_footprints
        **[Back inside the room.]
        -> bedroom
    +[Get back inside.]
    -> bedroom


= bed_inspection
#background #bed
The percale sheets are {statements:still} smeared with blood stains.{statements:At first glance, everything looks the same.}
{once:Underneath the bed, Noah discovers another bullet shell.}


{
-not statements:
~ XP += 10
~inventory += shell
}

{painting:That bullet shell could possibly explain the hole in the wall... But a second bullet rules out suicide in my book...} #Thought
+[Go back.]
-> bedroom

= painting
#background #bed
This painting seems to be a classic piece of artwork from the Early Renaissance.
It depicts a gathering of people socializing in a garden, with a matriarchal figure standing in the middle and a couple of winged human-like creatures messing around.
This looks like a {~Da Vinci|Michelangelo|Donatello} or something. {~Mom would be embarrassed that I have no clue...|I should have paid more attention in art class.| It looks like something from the Renaissance. That much I can tell...} #Thought
{once:Noah notices a small hole in the canvas.|There is a small hole in the canvas.}
{bed_inspection:Could this be linked to the shell {once:I just found }? A gun firing twice does not spell out suicide...} #Thought
+[Go back.]
-> bedroom 

= claudias_stand
#background #bed
On Claudia's nightstand there is a framed picture of her and her husband as a young couple on vacation. Next to it is {not statements:also a|,still, the} golden cross pendant.

{once:Looks like they had been happily together for decades. Still, a picture can't disprove anything.|They look happy there. Is it real, though ?} #Thought

The stand also contains two drawers.
{statements: Something looks different...|This could be interesting.} #Thought
+ [Check the top drawer.]

{
    -inventory hasnt bible:
    
    ~XP += 20
    There is a bible with a bookmark between the pages.
    Noah opens the bible to the marked page and notices a highlighted phrase : "And there is a second like it: 'You shall love your neighbour as yourself'."
    There is also a hand-written sentence next to the phrase. It says "This verse is the key". Above it, the detective reads another hand-written note: "43.013751713326705, -76.16350570108237, E. B.".
    -else:
    This is where the bible was being kept.
}
{inventory hasnt bible and (analytical >= 3 or versed >=3):These numbers look like coordinates, I should look this up. But what does E.B stand for ?} #Thought
{once:I wonder what the neighbors think of this... }#Thought

    **[Take the bible.]
    The detective decides to take the bible, in case it leads to something.
    
    ~XP += 30
    ~inventory += bible
    ->claudias_stand
    
    ++[Go back.] 
    -> claudias_stand

+ [Check the bottom drawer.]

~XP += 20
{not statements:The bottom drawer is locked.|The bottom drawer has been opened.}
{statements:
Somebody has unlocked it since last night. Whatever Willford wanted was probably in here... #Thought

~ evidence += unlocked_drawer
} #Thought

{statements:
~ opened_drawer = true 
}

    ++[Go back.] 
    -> claudias_stand

+[Go back.]
-> bedroom

= james_stand
#background #bed
Nothing is found on James' nightstand.
{claudias_stand:Not much of a sentimental guy, unlike his wife.} #Thought

+[Go back.]
-> bedroom

= living_room
#background #apartment
{not statements:There is an empty wine glass on the coffee table.|The coffee table has been cleared by the police.}
{not statements and crime_scene.bathroom: Who could have broken the other glass ?} #Thought
+ [Go back] 
-> inspection

= kitchen
#background #kitchen
{not statements:On the kitchen counter, Noah sees an opened bottle of red wine, but it's not empty.|The bottle of wine on the kitchen counter has been taken by the police.}
*(kitchen_sample){not statements}[Take a sample.]

~XP += 20
{
    -not statements:
    Noah samples a few drops from the bottle.
    ~ inventory += cristina_wine_sample
    ~ cristina_sample = true
    I'll send it to the lab to see {bath_sample:if it matches the bathroom stains|what makes chateau wine so special}. #Thought
        **[Go back.]
        ->inspection
}

+ [Go back.]
-> inspection

= bathroom
#background #bath
The couple's personal kits can be seen at the sink. Next to the one that Noah presumes is Claudia's, there is an open pack of antidepressants.
Looks like she was taking her medication... #Thought
{once: Noah takes a step and hears something cracking.|This is where the broken glass pieces were found.}
{once: This looks like broken glass, just a few tiny pieces though. This is strange...|I almost watched my step, again...} #Thought
{crime_scene.kitchen or crime_scene.living_room: She was either clumsy or she had wine company. } #Thought
* [Open the trash can.]
Inside tha can are more glass pieces and some red stained paper towels.
This doesn't look like blood. It could be wine though. #Thought
    **(bath_sample){not statements}[Take a sample.]
    
    ~XP += 20
    
    Noah takes the towels and a few stained glass pieces.
    ~ inventory += claudia_wine_sample
    ~ claudia_sample = true
    {kitchen_sample:This red liquid could be the wine. Maybe...} #Thought
        ***[Go back.]
        -> inspection
    **[Return.]
    -> inspection

+ [Go back.]
-> inspection

=== police_station ===
#background #police_station
~ day++
~ profiles += James
~ profiles += Rita
The following morning, Noah arrives at the police station later than usual.
Before he gets the chance to sit, the Sergeant runs up to him. #pressure
Sgt.Jacobs: Rise and shine, Taulen. Ugh, you look like crap, better grab some coffee and get on the case. It's been turning a lot of heads since the word got out...  #Conv
Sgt.Jacobs: We reviewed the tape from the security camera in the entrance. Our software identified everyone who got in and out yesterday and all of them appear to be residents, so we don't have leads on any outsiders. #Conv

*["One of the neighbors is responsible."]

~sly++

Noah: At this point I'm almost certain that we're looking for a suspect and it's one of the sweet neighbors. #Conv
Sgt.Jacobs: Don't jump to conclusions ! You know there's a procedure. We also have to wait and see what the final autopsy will show. In the meantime you should pay attention to your findings for any clues, talk to people close to her and if you build a strong enough case, single out the suspects and interrogate them.#Conv
*["Someone could have broken in through the balcony."]
Noah: Someone could have broken in through the balcony. {evidence has scene_footprints: I even saw footprints outside.}  #Conv
Sgt.Jacobs: Seems unlikely to me. That is what a burglar would do, but nothing has been reported missing. Besides, would a burglar really care or have the time to carefully place the gun in the victim's hand and stage this ? Don't forget, Claudia's fingerprints are on that 99K Arnold.  #Conv

-Sgt.Jacobs: I suggest you start off by finding the coroner, she might have formed some first impressions. Then you should go talk to neighbors, take more statements etc. Maybe check on the apartment again to see if you missed anything important. #Conv
Noah: I know my job, sarge. #Conv

{
- get_in_car.talk_to_sokolov:
Noah: This is off-topic, but a man came up to me in Vandergrift yesterday and told me about his missing niece, Daria Kozlov, around 13 I think. Could you see if there is a file on her in the system? #Conv
Sgt.Jacobs: We have current open cases to work on Noah, you know we can't be running errands for random people on the street! #Conv
Noah: Not an errand, allegedly there's been a report. She is an immigrant, that's probably why they overlooked it. Please? #Conv
Sgt.Jacobs: Fine, I'll look it up if I have time, but you should focus on the Willfords. #Conv
*[...]
-> examiner

-else:
Noah: Anyways, thank you for rundown. It's time to get to the real work now. #Conv
Sgt.Jacobs: Good to hear, let's get to moving. #Conv
*[...]
-> examiner
}


=== statements ===

#background #apartment_building

In the afternoon, Noah makes his way back to Stilton Avenue, 48.
A police car is parked on the street. #pixel_river
The entrance door is open and Noah sees Milton patrolling around the building.
Milton is a CM-25 android, who is assigned to the force and is specifically trained for the job, much like many other androids of that same model.
Milton: Hello detective. You can go inside, officer Johnson is guarding the apartment, ask us if you need anything. #Conv
Noah: Thanks Milton, I'll let you know. #Conv
Milton: Roger. #Conv
His robotic manner sometimes puts the detective off.
#background #stillton_corridors
He takes the elevator to the fourth floor and walks up to the officer. 
Noah: Hey Johnson, I came for some interviews and to check on the apartment. Any updates ? #Conv
Officer: A lot of tension, you can imagine. Residents are upset, asking all sorts of questions. James Willford was brough here around 1:30 p.m. because he needed some stuff. #Conv
*(talk1)["Did they say anything interesting ?"]
    Officer: Some are worried about their safety, others think it was suicide. #Conv
    Officer: The elder Asian lady said it's a shame, but the victim seemed clearly depressed. Another, younger lady, told me that the Willfords were a very happy couple and there is no way that the husband did it. #Conv
    Officer: She had to be in her mid-thirties and I think she had an Italian name. Pretty hot too, you might want to arrest her... #Conv
    
        **[...]
        -> fourth_floor
*(talk2)["What did he get ?"]
    
    ~ analytical++
    Officer: A hard drive, which he needed for work. Maybe some clothes too, I'm not sure. #Conv
    -> fourth_floor


= fourth_floor
#background #stillton_corridors
Noah {once:goes to|{~returns to|is, once again, in}} the hall of the 4th floor.

    
* [Knock on apartment D1.]
-> okamoto
+ [Knock on apartment D2.]
->richter
*(check_again) [Check on the Willford apartment.]
->crime_scene.inspection
+ [Take the elevator.]
->statements.elevator
*{okamoto and cristina and elroy and emerson}[Check the time.]
-> statements.time

= richter
Maxwell Richter. Let's see.. #Thought
Noah rings the bell.
A minute goes by and nobody answers.
I don't hear anything, maybe they're not here. should I try again ? #Thought
+ [Leave.]
-> fourth_floor

+[Ring again.]
Officer Johnson notices Noah waiting in front of the door.
Officer Johnson: {once:I doubt this one is home. Haven't seen anyone come in or out as long as I'm up here. You can ask Milton, maybe he saw them when he was up here.|He hasn't come back, yet, detective. I would have seen him.} #Conv
    ++[...]
    -> fourth_floor

= okamoto
#background #oka
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
{empathetic >=3:Doesn't strike me as the type to open up to. [Empathetic > 2]} #Thought
    
    **[...]
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

~XP += 20
~ sly++

~statements_ += okamoto_blames_rita
Noah: Are you suggesting that she's involved ? #Conv
Mrs.Okamoto: No, I'm just trying to find an explanation. You just never know with these housekeepers. Friends have told me stories of them stealing, assaulting and more. #Conv
Mrs.Okamoto: Some of these people will do anything for 100 extra meridians. That's why we lease these programmed androids. #Conv

**["Did you talk to her ?"]
Noah: Did you talk to her ? #Conv
Mrs.Okamoto: Well, Mr.Richter informed us and we all gathered across the hall, so I didn't talk to her directly. Besides, I don't know her that much. #Conv

-- I'm starting to think Ms.Stamopoulos didn't get a birthday card from her. #Thought
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

~ statements_ += hana_dislikes_isenberg

-> okamoto_neighbors

*[Move on.]
-> okamoto3

= okamoto_cristina
Noah: I understand that Ms.Artuso had ties with Claudia. Have you had the chance to talk to her since yesterday ? #Conv
Mrs.Okamoto: Yes, last night outside Claudia's apartment, everyone was there. No one could believe it, but she was especially crushed. They were relatively close in age, so they enjoyed each other's company. #Conv
~ statements_ += hana_saw_cristina

*["Did she share anything alarming ?"]
Noah: Did she share any alarming information ? #Conv
Mrs.Okamoto: We talked briefly. She worried that Claudia wasn't taking her pills lately and that could make her unpredictable. #Conv

~ statements_ += hana_pills_unpredictable
    **[...]
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
{sly > 2 or empathetic > 2: She strikes me as the type to push even harder when cornered. I should just play along... [Sly/Empathetic > 2] }
*["Are you sure you are alone ?"]
-> okamoto_rude1
*["Is everything alright ?"]

~ XP += 30
-> okamoto_home

= okamoto_rude1
{
    - not okamoto_home: 
Noah: Are you sure you are alone ? #Conv
Mrs.Okamoto: I'm not a liar, of course I am alone. My cat knocked something down again, I'll have to take care of it. I hope I helped, excuse me now, take care. #Conv
Mrs.Okamoto abruptly escorts the detective outside.
I better watch out for her... #Thought
    *[...]
    -> fourth_floor
    - else:
Noah: I just noticed this male coat over there. If your husband is here, I need to speak to him as well. #Conv
Mrs.Okamoto: I just told you nobody else is here! I think that's enough, I would like for you to leave. #Conv
Mrs.Okamoto: This behavior is very inappropriate and I shall notify your superiors, good night! #Conv
Mrs.Okamoto abruptly escorts the detective outside.
I better watch out for her... #Thought
*[...]
-> fourth_floor
}


= okamotos_painting
Noah: Excuse me, I got a glimpse of that large painting you have. I'm very interested in Renaissance art. What is that ? #Conv
Mrs.Okamoto: Oh, it's 'Virgin of the Rocks' by Da Vinci. It's an AI-generated replica, as close to the original as you will ever find. Needless to say, custom made and very expensive. #Conv
Mrs.Okamoto: I'm surprised you're not familiar with it, since you're an art enthusiast. #Conv
Noah: Well, I've only dipped my toes, but I learn as I go. Anyway, that will be all, thank you for your time and help. #Conv
He sips some water and leaves Mrs.Okamoto's place.
*[...]
-> fourth_floor


= okamoto_home
Noah: Is everything alright ? #Conv
Mrs.Okamoto: Ah, yes, it's just my cat, she must have knocked something down again. I'll have to go check, excuse me for a moment. #Conv
*[Wait by the doorstep.]
Noah waits quietly on th doorstep. A couple of minutes later, Mrs.Okamoto returns.
Mrs.Okamoto: Sorry, I had to check on the cat. Indeed, she knocked over a knitting box, as per usual... #Conv
Noah: Tell me about it, I used to have one too. Anyway, that will be all, thank you for your time and help. #Conv
He sips some water and leaves Mrs.Okamoto's place.
    
    **[...]
    -> fourth_floor

*[Take a quick look inside the living room.]

~ audacious++

~XP += 10
-> okamoto_inspection

= okamoto_inspection
#background #oka
An imposing room, decorated with carefully preserved Japanese pre-war antiques. A large painting stands out, depicting a man posing in a formal military uniform. There's also an android put on sleep mode inside its chamber at the corner of the room. Other than that, there is a  French door, leading to a large balcony.
{analytical > 3:The balcony is right under Claudia's window, maybe it can reveal a clue or two. This woman is eccentric though, I should probably hurry and check out the balcony first, before she comes back. [Analytical > 3]} #Thought
+ (portrait){mins_in_okamoto < 6}[Look at the painting.]
It's a large portrait of a severe man, posing proudly. He is in his forties, give or take.
{
-versed > 2:
This is a commander's uniform from the war, but he's no ally. He wears the red colors and the insignia of the Rising Force. The federation ostrasized them after the war for crimes against humanity, why the hell would these people openly celebrate the Force... [Versed > 2] #Thought
Above the painting, a commemorative sword is horizontally placed on display.
    ++[Look elsewhere.]
    
    ~mins_in_okamoto += 3
    -> okamoto_inspection
-else:
He looks like an important guy... Good for him. #Thought
Above the painting, a commemorative sword is horizontally placed on display.
    ++[Look elsewhere.]
    
    ~mins_in_okamoto += 1
    -> okamoto_inspection
}

* (balcony){mins_in_okamoto < 6}[Walk towards the balcony.]

#background #balcony2
Noah presses the button and the French door opens automatically. Being built on the Stilton hill, this spot provides an overlook for the entire city and offers a scenic, panoramic view.
Looking to his left, the detective notices a few marks, sort of evenly placed between Claudia's bedroom balcony and the balcony he's currently standing on. There is also {crime_scene.bedroom.platform:the scaffold the detective saw yesterday.|a multi-layered platform to the right, presumably a construction scaffold.}
    **[Take a picture.]
    
    ~XP += 20
    The detective takes a picture of the unusual marks on the wall outside.
    They look like footprints, I wonder how long they have been there. {crime_scene.bedroom.platform && analytical>3:It seems like someone has been using the scaffold as a platform to move between balconies.} #Thought
    ~inventory += okamoto_footprints
        ***[Go back inside.]
        
        ~mins_in_okamoto += 4
        ->okamoto_inspection
    **[Go back inside.]
    
    ~mins_in_okamoto += 3
    -> okamoto_inspection
+(android){mins_in_okamoto < 6} [Look at the android.]

~XP += 10
{versed > 2:This is an RP 7 Household. It's an outdated model, no longer supported. In fact, they've been banned for commercial use due to the Digital Sentience and Civil Rights Protection Act that was voted recently. Hana Okamoto doesn't strike me as the person who got the memo... [Versed > 2]|This looks old. They probably have it for cleaning.} #Thought

~mins_in_okamoto += 2
-> okamoto_inspection

*(coat){mins_in_okamoto < 6}[Keep looking around.]
Noah spots a coatrack with a male's coat on it.
{statements.kenji_here:Her husband went on a trip in the middle of December without a coat ?|That's a rad coat... Old fashioned but classy.} #Thought
-> okamoto_inspection

* {mins_in_okamoto >= 6} ->okamoto_leaving

= okamoto_leaving
Mrs.Okamoto:{once: Excuse me, are you looking for something ?|{~Anything else you want ? | I should go about by business...}} #Conv
{once:Hana returns and doesn't look pleased to find the detective wandering around the living room.}
*{okamoto_inspection.portrait}[Compliment the painting.]
-> okamotos_painting
*{okamoto_inspection.coat}[Confront her about the coat.]
-> okamoto_rude1
*{okamoto_inspection.balcony}[Mention the imprints outside.]

~XP += 20
Noah: Pardon me, but I suffer from vertigo and I needed some fresh air. As I stood on your balcony, I noticed some marks on the exterior that looked a lot like footprints. Are you aware of what I am referring to ? #Conv
Mrs.Okamoto: Ah, the footprints. I believe you saw the large scaffold as well. You see, we contacted the city planning commission in order to have some parts of the building renovated. It's an old building, after all, it is high time we did it. What you saw is clearly some constructor's footprints. We've complained before, because they sometimes do messy work, as you saw, but it is what it is.#Conv
{observant > 4:Plausible answer, she didn't flounder either. Although, it's the longest response I've gotten from her, as if she really tries to convince.|Shout out to the commission.} #Thought

    **{versed>3}["Constructors don't leave footprints on walls." (Versed > 3)]
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

~ empathetic++
~ analytical++

Noah: I happened to notice the android at the corner of the room. Is it possible to borrow its memory chip ? Maybe it saw or heard something last night. #Conv
Mrs.Okamoto: I'm afraid we had its memory removed long ago. One day it started acting erratically and we were informed that it was due to a malfunction to its memory processor. Since then, we have it operate without one. It may not be as practical, but it works fine, and my husband had taken a liking to it.#Conv

    **{versed > 2}["This is an RP 7 Household."]
    Noah: I believe this is an RP 7 Household. These have been recalled due to the Digital Sentience and Civil Rights Protection Act. You should have returned it to the agency when the law was passed. I'm giving you a warning now, but you have to to return it by the end of the month. Otherwise, you will be fined. (Versed > 2) #Conv
    Mrs.Okamoto: Yes, detective, I know, I am sorry. We are a little old and sometimes we tend to be forgetful. #Conv
    -> okamoto_leaving
    
    **["I see."]
    Noah: I see. #Conv
    -> okamoto_leaving

*[Leave.]
Noah: Anyway, I was just leaving. Thank you for your cooperation. #Conv
    
    **[...]
    -> fourth_floor





= third_floor
#background #stillton_corridors
Noah {once:goes to|{~returns to|is, once again, in}} the hall of the 3rd floor.
* [Knock on apartment C1.]
-> emerson

* [Knock on apartment C2.]
Nobody lives in this apartment currently.
-> third_floor

* [Knock on apartment C3.]
-> cristina

+[Take the elevator.]
->statements.elevator
*{okamoto and cristina and elroy and emerson}[Check the time.]
-> statements.time

= emerson
"Just a second !" #Conv
"Emerson Palmer". {cristina:Lucky man, living next to Artuso...|I hope he's here.} #Thought

The detective knocks.

Footsteps can be heard.
#background #palmers_place
A young man answers the door. A handsome, blond guy, not older than 25, very clean-cut. 
Palmer: Hello, can I help you ? #Conv
Noah: Greetings, my name is Noah Taulen, I'm a police detective from the Precinct 45 Major Crime Unit. I'm here to ask a few questions regarding last night's incident involving Mrs.Willford, if you don't mind. #Conv
Palmer: Of course. Still boggles my mind, we're all in shock. I don't even know what to say, but I'll try my best. #Conv
{observant > 2 or empathetic > 3: He looks authentic and down to earth{okamoto:, unlike some others.|, maybe he can help.}| Let's see what you got.} #Thought

-> emerson2

= emerson2

*["Where were you last night ?"]
Noah: Where were you last night, around 22:30, Mr.Palmer ? #Conv
Palmer: I was actually at a colleagues birthday party at a nightclub on Rue de Saint-Lumière. We stayed there until much later. Here is a picture we uploaded on CosmoBuzz. #Conv
Palmer shows the detective a timestamped photo from his page on the social media platform.
These young lads ain't afraid to spend it... #Thought
Palmer: You can imagine how upset I was when I returned and witnessed all that commotion. Nothing prepares you for these moments... #Conv

    **["Did you notice anything before leaving the house ?"]
    Noah: Did you notice anything before leaving the house ? #Conv
    Palmer: Don't think so. To be honest, as soon as I got back from work around 19:30, I took a shower, changed clothes and by 20:15, I was off, heading to the party. Nothing seemed out of the ordinary. #Conv
    
    **["Didn't anybody notify you ?"]
    
    ~sly++
    ~XP += 10
    Noah: Didn't anybody notify you ? It would be common courtesy among neighbors. #Conv
    Palmer: Mr.Richter gave me a call while I was out, but I didn't notice it  until I got home. I have to admit I was under the influence of alcohol. From what I heard, he took it upon himself to notify the rest of us.  #Conv
    -- Noah: I see. #Conv
    -> emerson2
    
*["How well did you know Mrs.Willford ?"]
Noah: How well did you know Mrs.Willford ? #Conv
Palmer: Not super well. To an extent, sure. I always had a great rapport with her. Always having pleasant small talk whenever we would bump into each other. #Conv
Palmer: She enjoyed giving back to people. A year ago, when I was looking for a new job, she put a good word for me to her boss and I stumbled upon a great career opportunity. I'll always owe it to her. She almost felt like a big sister, at times. #Conv
Palmer: That being said, we weren't best of friends, or anything like that. #Conv
    
    **["You think it was suicide ?"]
    Noah: You think it was suicide ? #Conv
    Palmer: Honestly, no. I just couldn't picture her taking her own life, especially this way. #Conv
    Palmer: They keep saying she was quite moody for a while now, but I could still see the joy deep inside her eyes. #Conv
    Palmer: I can also vouch for anyone in this building, her husband, too. Some outsider could have broken in from the window, probably trying to rob her. #Conv
    
    **["What about Mr.Willford ?"]
    Noah: What about Mr.Willford ? #Conv
    Palmer: Seems like a solid guy. Our relationship is mostly typical. "Good morning", "Have a nice day", that's it, pretty much. Still very polite, don't get me wrong. But they appeared to be a great couple. I could never suspect him, if that's what you mean. #Conv
    
    -- Noah: Alright, then. #Conv
    -> emerson2
    
*
-> emerson_leave

= emerson_leave
Noah: Mr.Palmer, thank you for your time, I think I'm good. Feel free to contact us if anything comes up. #Conv
Palmer: You're welcome, detective, I'll keep my eyes open. Thank you for your service. #Conv
This young lad seems clean as a whistle. Good kid. #Thought
*[...]
-> third_floor
    

= elevator
+[Go to the 4th floor.]
->fourth_floor
+[Go to the 3rd floor.]
->third_floor
+[Go to the 2nd floor.]
->second_floor
+[Go to the 1st floor.]
->first_floor

= first_floor
#background #stillton_corridors
Noah {once:goes to|{~returns to|is, once again, in}} the hall of the 1st floor.

+[Knock on apartment A1.]
->statements.not_here
+[Knock on apartment A2.]
->statements.not_here
*[Knock on apartment A3.]
->statements.elroy
+[Take the elevator.]
-> statements.elevator
*{okamoto and cristina and elroy and emerson}[See what time it is.]
-> statements.time

= not_here
The detectve knocks.
No answer.
+[Knock again.]
He knocks again. Still, nothing.
Fine. #Thought
-> first_floor
+[Leave.]
-> first_floor


= cristina

Cristina Artuso, must be the Italian... #Thought
Noah rings the bell.
An attractive young woman opens the door. She's wearing elegant leather pants and a tight grey blouse. #background #cristina_first_visit
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
    
    ~XP += 20
    Noah: What time did you come home ? #Conv
    Cristina: Umm... around 8:30-8:45 approximately. Like I said, typically long hours at work. I've been told you have access to the security camera's recordings, isn't that right ? #Conv
    Noah: Of course. I'm just following the protocol. #Conv
    
    {cristinas_interest < significant:
        ~ cristinas_interest++
    }
    -> cristina2
*["Did you talk to Mr.Willford today ?"]
Noah: Did you talk to Mr.Willford today ? #Conv
Cristina: Of course. I knew he had to evacuate his house for a few days, due to the investigation, so I called him, first thing in the morning. I should visit him, but I haven't mustered the courage yet. #Conv
Cristina: He is completely dazed. One moment, he's zoned out and two minutes later he bursts into tears. Who can blame him... #Conv
-> cristina2
* [Learn about the neighbors.]
-> cristina_neighbors

* 
-> cristina3

= cristina_neighbors
Noah:{once: Are there other neighbors that know the Willfords well ?| I'd like to know something else...} #Conv
Cristina:{once: Sure, most people have been living here for a decade at least, so we get to know each other rather well. However, we mostly tend to maintain our privacy.| Sure, what would that be ?} #Conv
{once:Cristina: You know, these highly ranked districts are usually home to older and wealthier people who can be quite uptight. That being said, me and the Willfords had a lot in common, so I probably know them a bit better.|Noah: Well...} #Conv

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
        
        ~XP += 10
        
        {
            -cristinas_interest < significant:
            ~ cristinas_interest++
        }
            ****[...]
            -> cristina_neighbors
        
       ***["Some people can be difficult."]
        Noah: Sure, some people can be difficult. #Conv
        Cristina: Indeed. #Conv
        ->cristina_neighbors
        
    **[Mention Mr.Okamoto]
    ->cristina_kenji



* {statements.elroy} [Bring up Mr.Isenberg.]
Noah: Did Mr.Isenberg know Mrs.Willford well ? #Conv
Cristina: Oh, no, I wouldn't say so. I doubt they would say anything more than a typical greet. Besides, Mr.Isenberg isn't exactly the friendliest person here. He doesn't like anyone. #Conv

~ statements_ += artuso_dislike_isenberg
->cristina_neighbors

*
-> cristina2


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
->cristina_neighbors

    
    -else:
Noah: Do Mr and Mrs.Okamoto have children ? #Conv
Cristina: Mr.Okamoto has a daughter from a previous marriage, she lives outside the city, I don't remember where exactly... Together, they don't have children though. #Conv
->cristina_neighbors

}


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
*[Give her your number.]

~ gave_cristina_number = true
~ rogue++
Noah: Normally, I shouldn't, as I'm allowed to do this only under specific protocol, but given the circumstances, you may call me on this number, only if really necessary. #Conv
Cristina: Thank you, detective, I appreciate it. I hope you can figure this out, in the memory of dear Claudia... #Conv

*[Decline formally.]
Noah: I'm sorry, but at this stage I'm not allowed to share that information. If you don't find me in my office, you will automatically be transferred to our AI assistant and I will contact you as soon as possible. #Conv
Cristina: You know better, I suppose. Anyway, thank you for your service, may Claudia rest in peace... #Conv
Taulen, you nasty heartbreaker... #Thought


 - A fine, fine lady, Johnson was right for once. She mostly made sense. I guess... #Thought
 *[...]
 -> third_floor


= second_floor
#background #stillton_corridors
Noah {once:goes to|{~returns to|is, once again, in}} the hall of the 2nd floor.

*[Knock on apartment B1.]
->statements.not_here_2
*[Knock on apartment B2.]
->statements.teenage_boy
*[Knock on apartment B3.]
->statements.not_here_2
+[Take the elevator.]
-> statements.elevator
*{okamoto and cristina and elroy and emerson}[Check the time.]
-> statements.time

= not_here_2
Noah rings.
Nothing happens.
+[Ring again.]
Noah rings again. Still, no answer.
++[Go back.]
->second_floor

+ [Go back.]
->second_floor

= teenage_boy
Noah rings.
Nothing happens.
*[Ring again.]
Noah rings again.
-> teenage_boy2

= teenage_boy2
#background #creepy_boy
A sharp dressed teenage boy opens the door. 
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
 
 -  This kid is weird... #Though
 
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
 
  -- As he moves away, he notices {maximus:Maximus|the boy} smirk.
**[...]  
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
-> elroy2

= elroy2
#background #elroy_visit
Noah sees a frowning, yet simple and ravaged man, probably around his late sixties. He also appears to have a bionic right eye. 
Mr.Isenberg: Yes... #Conv

*[Ask him about the incident.]
->elroy_interview_1



= elroy_interview_1

Noah: What can you tell me about last night's unfortunate events ? #Conv
Mr.Isenberg: Hell if I know ! I was just preparing a chamomile, when all of you arrived. Normally, I don't stuck my nose where it doesn't belong, but I knew it had to be somethin'. #Conv

Mr.Isenberg: Anyways, after ten minutes, I decided to walk up them stairs, where I found a couple officers who told me what happened. It was quite the shock, I tell you.#Conv
Mr.Isemberg: I gave 'em some kind of statement and headed straight off for a walk. Had to clear my damn mind... #Conv

-> elroy_interview

= elroy_interview

*["Did you hear a gunshot ?"]
Noah: Did you hear a gunshot ? #Conv

~ statements_ += elroy_heard

~XP += 10
Mr.Isenberg: At some point, I heard a whomp, not too close, but not that far away either. I was pretty sure it was a gunshot, I know one when I hear one, but I didn't know what to think of it. #Conv
Mr.Isenberg: Hardly a minute went by and I heard that sound again. At that moment, I started suspectin' that somethin' was goin' on. #Conv
Mr.Isenberg: See, someway or another, you learn to mind your own damn business around these places, so I decided to ignore it. I should've followed my instinct, maybe I could've done somethin'... #Conv
Mr.Isenberg: That being said, the way most rich people tend to sort things out is none of my concern and I want no part of it ... #Conv

    **["You've given it a lot of thought."]
    Noah: Sounds like you've given it a lot of thought. #Conv
    Mr.Isenberg: You don't make it through them trenches without learnin' how to think. That war cost me an eye as you see, so I guess I should've learned even sooner. #Conv

        ***[Mention your mechanical arm.]
        Noah: I happen to have a mechanical left arm, so I understand. #Conv 
        Mr.Isenberg: Yeah, I figured. If I may, how'd you get it ? I'm sure you didn't even exist during WW3. #Conv

        {elroys_trust < significant:
            ~ elroys_trust++ 
        }
            ****[Tell him.]
            
            ~empathetic++
            
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
        
        ~audacious++
        
        Noah: I don't know where your attitude comes from and I certainly won't be disrespected in such a way that while on duty. If you know something, I'm asking you to let me know. #Conv
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

*(neigh)["Didn't you talk to your neighbors ?"]
Noah: Didn't you talk to your neighbors ? We're talking about a deceased person that you all knew here... #Conv
Mr.Isenberg: Hey, everybody reacts differently ! I needed some air. Besides, I have my reasons not to like them. #Conv
Noah: What do you mean ? #Conv
Mr.Isenberg: I don't really want to get into it. The people living in the floors above have formed a clique. They look down on anybody else, forget the nice act. #Conv
Mr.Isenberg: One time, years ago, I found out about a weird gathering they had. The next day, I jokingly asked Okamoto why I hadn't been invited and she told me off. #Conv
Mr.Isenberg: She told me that I was indiscreet and how that was a private gathering etc. #Conv
Mr.Isenberg: From that point on, they were all cold to me, and a week later they tried to kick me out of here for "not standing for the standards and values of the building". We had a big argument and agreed to stay out of each other's business for good. #Conv

~ statements_ += elroy_hates_them
-> elroy_neighbors

*[Focus on Claudia.]
-> elroy_claudia

*{elroy_neighbors or elroy_claudia} [Leave.]
->elroy_leave

= elroy_neighbors
* {statements.teenage_boy} [Ask about the mysterious boy.]
Noah: Do you know the family who lives in B2 ? I had strange interaction with the teenage boy. #Conv
Mr.Isenberg: The Edisons ? Typical old money descent, unapproachable people. From what I understand they also have interesting views on race... #Conv
Mr.Isenberg: They sure messed that boy up. They've been grooming him to their standards ever since he learned how to walk. Used to be somewhat of a normal kid, but now he's finally transformed. #Conv
->elroy_neighbors

* {statements.okamoto} [Ask about the Okamotos.]
Noah: I understand that you're not very fond of Mr.and Mrs.Okamoto, right ? #Conv
Mr.Isenberg: We don't exchange birthday cards, that's for sure. Hana acts as if someone appointed her in charge of the building, she is a manipulative woman. Heard she estranged her husband from his daughter, just so you understand. #Conv
Mr.Isenberg: As for her husband, Kenji, he is an enigma. I know that he used to be a highly decorated commander. He even reached the rank of Brigadier General within the alliance of the Rising Force, during the big war. #Conv
Mr.Isenberg: I heard that during the historic post-war trials, he made a deal with the New Republic to testify against his former comrades in exchange for immunity. #Conv
Mr.Isenberg: Only the New Republic could cater to an opposing war criminal so well, but I digress... #Conv
Mr.Isenberg: Anyway, when I first moved here, he was still relatively healthy, so I would see him here and there. #Conv
Mr.Isenberg: An old, severe man of few words. Ever since his health started deteriorating, he gradually withdrew from the outside world. I haven't seen him in years. #Conv
->elroy_neighbors

* (elroy_cristina){statements.cristina} [Ask about Cristina.]
Noah: What do you think of Ms.Artuso ? #Conv
Mr.Isenberg: I don't know what it is about her, but it makes me skeptical. She moved here ten years ago, or so. She'd only been in her mid-twenties, so I was surprised that she could afford this place. #Conv
Mr.Isenberg: Back then, she acted friendly and you could tell that she was trying to fit in this environment, while still being an outsider. She wasn't into the overall snobbishness here. #Conv
Mr.Isernberg: Time went on, she got in the clique and became just like the rest of 'em. She now avoids talking to me, too. She seems like an opprtunist.#Conv
-> elroy_neighbors

* {statements.neigh}["Were the Willfords part of this ?"]
Noah: Were the Willfords part of this "clique" ? #Conv
Mr.Isenberg: Sort of. I know James is, even though he's been more diplomatic than the rest. He holds a powerful position at Ichor, of course he'd be involved in this elitist gang. #Conv
Mr.Isenberg: I guess Claudia was a part of it too, just by association. She didn't act like the others though, far more genuine. #Conv

-> elroy_neighbors

* [Ask about something else.]
-> elroy_interview

= elroy_claudia
Noah:Let's focus elsewhere. #Conv
* (sunday_mass) ["When did you last see Mrs.Willford ?"]
Noah: When did you last see Mrs.Willford ? #Conv
Mr.Isenberg's expression gets gloomier.
Mr.Isenberg: Saw her about 10 days ago at the Sunday mass. She was a regular attendee and a firm believer. I, on the other hand, had been out of touch with religion for most of my life. #Conv
Mr.Isenberg: I only recently started trying it out again. Whenever I would go, I would see her and we would sit, pray and maybe chat for a while. Her devotion inspired me, to be honest. #Conv
Mr.Isenberg: That's why I was a bit surprised to not see her this past Sunday, she rarely missed mass. Even that time when she had sprained her ankle pretty badly, she still attended on crutches. #Conv
~ statements_ += not_church
{statements.cristina: That's weird... Artuso told me she saw her coming from church this Sunday.|Something was up...} #Thought
Mr.Isenberg: The way she used to talk about life showed that she had a bright outlook. I don't believe she did this to herself. #Conv
{statements.cristina or statements.okamoto: That's interesting... The first one to openly say that.|That makes two of us...} #Thought

    **{statements.cristina}["Are you sure she wasn't at the mass ?"]
    Noah: Are you sure she wasn't at the mass ? #Conv
    Mr.Isenberg: Absolutely. Generally, only a few people come, so I can clearly see their faces. #Conv
    
    -> elroy_interview

    **["Did she tell you anything alarming ?"]
    Mr.Isenberg: Nothing really personal, we weren't all that close. Just casual conversations, mostly of spiritual nature. Although, I understood that something was stressing her out lately... #Conv

    -> elroy_interview



= elroy_leave
Noah: Alright, I think that's enough, thank you for your time. #Conv
Noah: One last thing... You seem to disown the lifestyle of your neighbors, still you live in a similarly expensive apartment. If I may, what did you do for a living ? #Conv
Mr.Isenberg: Cop, such as yourself. Made it to Lieutenant, actually. Obviously, I'd never have been able to afford this. It was my wife's family home, rest her soul... #Conv

*[Go back.]
-> first_floor

= time
Crap, I've been here for a while. It's almost bedtime for these people. Should I leave ? #Thought

+[Keep investigating.]
He looks at the time once again, but his itch is still present.
Noah: Whatever, just a little longer. #Thought

    ++[Check again the first floor.]
    -> first_floor
    
    ++[Check again the second floor.]
    -> second_floor
    
    ++[Check again the third floor.]
    -> third_floor

    ++[...]
    -> fourth_floor


*[Head off.]
->sergeant_call.claudia_update

=== dr_castello ===
#background #shrink
The two detectives arrive at Dr.Castello's office. A refined and elegant android assistant greets them in the lobby.
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

~XP += 10

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

~XP += 20
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

~XP += 20
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

*
->castello_exit

= castello_exit

{partner}: {partner == "Milton":Detective, I shall notify you about other pending appointments for today.|Boss, sorry to interrupt, but we might be running a little late.} #Conv
Noah: Right... We have to get going. Thank you for your time, doctor. You gave us a lot to think about. #Conv
Dr.Castello: It's my obligation, detective. I hope I didn't give you a hard time with my answers, but it's really difficult to speak on behalf of a client, let alone a deceased one. #Conv
Dr.Castello: I sincerely hope you get to the bottom of it. #Conv
Noah: Thank you. Please call us if you have anything else to share. #Conv

{
    -time_of_day == morning:
    *[...]
    
    ~timepass()
    -> next_move
    -else:
    *[...]
    -> side_activity
}


= dr_castello_claudia
*{observant>2}[Mention the cross on her nightstand.]
Noah: During the apartment inspection, I noticed a cross pendant and a bible on her nightstand. Was she really that faithful ? #Conv
Dr.Castello: Absolutely. A serious health scare she had years ago made her turn to religion. It seemed to me like she possesed all the virtues of a firm believer. #Conv
Dr.Castello: Most of the time, she almost had an apologetic manner of conversing. #Conv

**{analytical>2}["Doesn't her religion condemn suicide ?" (Analytical > 2)]
Noah: Doesn't her religion condemn suicide, though ? How could such a devoted person commit the "unforgivable sin" ? #Conv

~XP += 20
Dr.Castello : You've raised a very poignant question, detective. Truth is that the urges of the id can be strong enough to completely take over the ego. #Conv
Dr.Castello: In other words, when something triggers our subconscious enough, we can make the most irrational decisions. #Conv 
Dr.Castello: It is true though, that, based on her behavior never alarmed me. Makes you think... #Conv
-> dr_castello_claudia

**["What kind of health scare ?"]
Noah: What kind of health scare ? #Conv
Dr.Castello: An abrupt end to a pregnancy, which also caused her further complications. There was a slight chance that she wouldn't make it, but she did. That seemed to be a spiritual awakening for her. #Conv
-> dr_castello_claudia

*{observant>2}[Mention the absence of a suicide note. (Observant > 2)]

~XP += 20
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
    
    ~XP += 20
    Dr.Castello: In her words, she didn't feel comfortable with how much her husband's choices influenced hers. Of course, that alone couldn't possibly incriminate Mr.Willford. #Conv
    -> dr_castello_claudia_2
    
    **["Her friends ?"]
    Noah: Her friends ? #Conv
    -> dr_castello_no
    **["Her neighbors ?"]
    
    ~XP += 40
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

*-> dr_castello_questions

= dr_castello_no
Dr.Castello: As I just mentioned, she never accused anyone, specifically. If that were the case, I would have told you so from the beginning. #Conv
-> dr_castello_claudia_2

=== mr_richter ===



= meet_richter


{  
    -time_of_day == morning:
    #background #richters_home
    
    The detective decides to visit Mr.Richter at his house, as the professor preferred.
    Along with his partner, he is once again right next to the scene of the crime as they stand outside Maxwell Richter's apartment. #old_city
    * [Ring the doorbell.]
Half a minute goes by and a man opens the door. He stands out due to his rather awkward stance and his conservative outfit. 
Noah: Mr.Richter, I suppose. Good morning, sir, my name is Noah Taulen, I'm the detective assigned to the homicide investigation regarding Claudia Willford. #Conv
    
    -> meet_richter2
    
    -else:
    #background #uni
    The detective finds the time to locate Maxwell Richter's office at the university, where he teaches.
    As the sun is almost set, he and {partner} are standing right in front of the door. #pixel_river
    * [Ring the doorbell.]
    #background #office
Half a minute goes by and a man opens the door. He stands out due to his rather awkward stance and his conservative outfit. 
Noah: Mr.Richter, I suppose. Good evening, sir, my name is Noah Taulen, I'm the detective assigned to the homicide investigation regarding Claudia Willford. #Conv
-> meet_richter2
    
}


= meet_richter2
{
-time_of_day == morning:
Mr.Richter: Oh, of course, I'm sorry to have kept you waiting, gentlemen. Please, come inside. #Conv
Despite his funny appearance, he speaks in a very eloquent and polite manner.
Mr.Richter: I would offer you a beverage or a snack, but I forgot to go for groceries and I'm out of everything ! I've been a little scatterbrained over these last few days, my apologies. #Conv
{partner}: {partner == "Milton":Don't worry sir, it's fine|I should have gotten that espresso machine...} #Conv
{partner == "Johnson":The detective gives a strict judgemental look at Johnson.}
{partner == "Johnson":Johnson: Just kidding... } #Conv

-> richter_questions

-else:
The professor's tone seems aggressive.
Mr.Richter: I'm sorry detective, I was under the assumption that you would visit me at my house, I thought I made that preference clear to your supervisor. #Conv

    **[Apologize.]
    
    ~XP += 20
    
    Noah: My apologies, professor. Upon arriving, we asked the front desk about your schedule and they told us that you'd be currently available during your office hours. #Conv
    Mr.Richter: I just find it inappropriate to draw such negative attention to my workplace ! Besides, knowing why you are here is going to make the students and the rest of the faculty members uncomfortable. Did you tell them the reason you wanted to see me ? #Conv

        ***["Yes."]
        
        ~ audacious++
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

    **[Don't apologize. (Audacious + dice roll > 6)]
    -> richter_dont_apologize

}

= richter_dont_apologize

{ -try(audacious,7) == true:
    ~ audacious++
    
    ~ XP += 30
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
Mr.Richter: One day you're there, chatting with a familiar face and the next day they're gone ! It's frightening. So surreal... #Conv  

    **["What did you talk about ?"]
    Noah: What did you talk about ? #Conv
    Mr.Richter: Nothing of substance, really. Common courtesy stuff, a bit about the weather, joking about the upcoming elections for a minute, that's it. #Conv

    ** (time_back_from_work) ["What time was that ?"]
    
    ~XP += 30
    Noah: And what time would that be ? #Conv
    Mr.Richter: Somewhere around 8 to 8:30 p.m. Pretty typical for the both of us, we've ran into each other plenty of times around the same hour. #Conv

-- Mr.Richter: Goes to show you, she was still following her routine up until it happened. Who could have imagined... #Conv

{dr_castello.claudia_ill and observant > 3: Castello said she cancelled her appointment because she was sick. Had she gotten better by Monday ? [observant > 3]} #Thought

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
Mr.Richter: I was right here at home, unfortunately. I was peacefully working on a research until late at night, when the girl who worked for the Willfords rang my doorbell and told me what she had just seen. #Conv
Mr.Richter: From there on, we were anxiously waiting for the police to arrive... #Conv

    **{analytical >= 3}["How come you didn't hear the gunshot ? (Analytical > 2)"]
    
    ~ analytical++
    ~XP += 20
    
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
    
    ~XP += 20
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
    
        ***{rhetor>1}["He's deceptively smart for his age." (Rhetor > 1)]
        
        ~XP += 20
        Noah: He is deceptively smart for his age. How do you expain that ? #Conv
        
        Mr.Richter: He's been under the right guidance, studying the right material. His parents are truly remarkable, well-educated people, with their hearts and minds in the right place. #Conv
        Mr.Richter: They have been nurturing their boy to become a strong, intelligent and virtuous man, a true "Götzenbild". Having a great relationship with the family, I've also encouraged him to read works of some of the great classic Western philosophers. #Conv
        
        {rhetor >= 4:"Götzenbild"... That's a term used by the underground circles of the "Sunlight", the radical reformist party that's been gaining a lot of momentum as of late.} #Thought
        -> richter_questions
        
        *** 
        -> richter_questions


    **(richter_upset)["I think you mean creepy."]
    
    ~rogue++
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

* {time_of_day == night}
-> door_buzz

* {time_of_day == morning}
-> richter_leave

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
{partner}: {partner == "Johnson": You smelled bullcrap too, right ?|But we don't have the right to do so.} #Conv
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
    Noah: In fact, I think we have everything we need for the time being. Thank you for your time, professor, and sorry for our unexpected visit here. #Conv
    Mr.Richter: It's okay, I was just caught off guard. I hope I helped. #Conv
     The two men leave Richter's office and finally call it a day.
}

{
    -time_of_day == day:
    *[...]
    
    ~timepass()
    -> next_move
    
    -else:
    *[...]
    -> side_activity
}

= inspect_office
#background #office

{
    - mins_in_richters_office < 20 and !(inventory has red_pill and evidence has richters_comp):
    The detective is left alone inside the office as his partner is on the lookout for the professor, right by the doorstep.
    -else:
    Suddenly, {partner} nods, as footsteps signal someone approaching the office. They both get everything back in position as quickly as possible, leaving no trace behind. A few moments later, the professor returns in the office.
    Mr.Richter: I'm sorry to have kept you waiting for so long, gentlemen. My team is carrying out a crucial project and I had to supervise them to make sure we avoid any errors. #Conv
    
    ->richter_leave
}



+[Check the computer.]
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

+[Look inside the box.]
Batteries, paperclips, toner cartridges and digital pens, all thoroughly organized.
    
    **[Take a paperclip.]
    The detectives snatches a paperclip.
    ~ found_pick = true
    ~inventory += clip
{(observant >1 or handyman >2) and richter_drawers.tried_to_open :I could shape one of these paperclips into a makeshift lockpick. [observant >1 or handyman > 2]|What could I do with this ?} #Thought


        
        +++[Go back.]
        -> richter_desk
        
    ++[Go back.]
    -> richter_desk

~mins_in_richters_office += 5
-> inspect_office

+[Look elsewhere.]
-> inspect_office


= richter_computer
Noah sits in front of the computer and tries to log in. However, it requires a password.

{inventory has tracker:Could I use the gadget that Troy gave me ?} #Thought
* {inventory has tracker} [Try Troy's device.]
The detective connects the gadget to the computer's port. After a few seconds it logs him in.
{
    - handyman > 3:
    Noah's computer knowledge comes in handy and allows him to execute the right commands and back up every file from the computer [handyman > 2].
    Noah: Done. I'll dive into that whenever I get the chance. #Conv
    
    ~XP += 40
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

+[Look elsewhere.]

~mins_in_richters_office += 1
-> inspect_office

= richter_drawers
{&Under the professor's desk there are three drawers.|The detective senses something intriguing about the drawers.|No sign of the professor just yet.}

+[Open the first drawer.]
Inside the first drawer, Noah finds a laser pointer, a couple sets of hyperactive contact lenses and a box of Abmenthal pills.
{versed >= 3: Abmenthal... well-known stimulus for augmented concentration and lucidity. Banned by the Administration a few years ago due to proven severe risk of psychotic episodes. We could literally be dealing with a mad scientist. [versed > 2] } #Thought

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
    ->richter_drawers
    - jammed == true:
    The detective jammed this lock earlier.
    -> richter_drawers
    -third_drawer:
    -> third_drawer
}

{found_pick == false and (handyman>=3 or stealthy >= 4):If I could only find a very thin piece of metal or something similar, maybe I could pick the lock.} #Thought
{found_pick == false and partner == "Johnson": I think Johnson is quite handy with these things.} #Thought

**{found_pick == true}[Try lock-picking. (Handyman + dice roll > 6 or Stealthy + dice roll > 8)]

{
    -try(handyman,7) == true or try(stealthy,9) == true:
        Through precise and delicate hand movements, the detective manages to unlock the drawer.
        ~ XP += 40
        ~mins_in_richters_office += 5
        
        -> third_drawer
        
    -else:
    A sudden, awkward move causes the object to get stuck inside the lock.
    Crap ! I jammed the lock. I thought I had this... I don't have time to fix it. #Thought
    ~ jammed = true
    -> richter_drawers
}


**{partner == "Johnson"}[Tell Johnson to take a look.]

~XP += 20
Noah silently beckons to Johnson.
Noah: I have an itch to unlock this drawer. I've heard you're good at this stuff. #Conv
Johnson: You've heard right, my grandpa was an old-fashioned locksmith, back when people mostly had solely mechanical doors in their houses. I picked up a thing or two. #Conv
Johnson plucks a hairpin from his jacket pocket and starts messing with the lock, while the detective discreetly stands guard in his place. 
Johnson: Done. This handsome devil never misses ! #Conv
~ found_pick = true
Noah goes over the drawer to take a look.
~mins_in_richters_office += 7

-> third_drawer

++[Leave the drawer.]

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

++[Keep flicking backwards.]
The same pattern keeps on going page after page.
Instinctively, {once:the detective stops at December 8th, the day of Claudia's death|the page referring to the date of the incident stuck out to him}..
"J.P. -- Blue -- 5", "C.A. -- Red -- 2", "T.R. -- Green -- 8"
{sly >= 1 or observant >= 1:Seems like the professor has been dealing drugs right under the university's nose...} #Thought
{observant >3: C.A... Cristina Artuso ? Maybe I'm just getting paranoid. [observant > 3]} #Thought
The red one {inventory hasnt red_pill:stands out to me for some reason|might lead me to something}... #Thought
    
    ***{rogue>=5}[Steal one pill of each.]
    Noah quickly stashes one pill from every label.
     ~inventory+= red_pill
      ~inventory+= green_pill
       ~inventory+= blue_pill
    Let's see what this guy is cooking... #Thought
    
    ~mins_in_richters_office += 5
    ->richter_drawers
    
    ***[Steal one "Red" pill.]
    
    ~rogue++
    
    ~inventory+= red_pill
    
    ~XP += 20
    
    Noah wraps one red-labelled pill and puts it in his pocket.
    This seems far-fetched, but I have to know... I'll drop these off to Mia tomorrow. #Thought
    
    
    ~mins_in_richters_office += 4
    
    -> richter_drawers
    
    +++ [Return to the drawers.] 
    
    ~ mins_in_richters_office += 2
    ->richter_drawers
    

=== examiner_pill_update ===
~day_gave_pills = Next_Wednesday
Minutes before Noah takes his clothes off, he receives a call from the coroner.
Mia: I have news about the red pill you brough. {claudia_sample:It's rather creepy, considering what you brought me the other day.} #Conv

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
    
    * ["I see."]
    Noah: I see. #Conv
    Mia: I don't know what that professor is using them for, but there are tons of other options on the market that are far more accessible and safer. I'm sure he knows that. #Conv
    
    - Noah: Alright, thank you, Mia. I'll see where this leads me. #Conv
    { evidence ? (pill_is_astrecamine) and claudia_sample:Was Claudia buying this stuff from Richter ? Or could he have been in Claudia's apartment that night ? } #Thought

    *[...]
    -> side_activity

=== examiner ===
#background #examiners_office

{once:Soon enough, Noah walks into the coroner's laboratory.|Once again at the coroner.}


*(talk)[Talk to the medical examiner.]
Noah: Good morning, Mia. Any interesting findings regarding the Willford case ? #Conv
The examiner looks like she didn't get much sleep. #pixel_river
Examiner Peng: Good morning, Noah. Quite a few, actually... #Conv
Examiner Peng: First of all, the blood tests indicated a regular dosage of Citalopram, Escitalopram and Fluoxetine, which points out that Claudia was still taking her medication. #Conv

    **["That should rule out suicide."]
    Noah: That should rule out suicide. #Conv
    Examiner Peng: Wait, there is more. #Conv

    **{crime_scene.bathroom}["I thought so."]
    
    ~ analytical++
    Noah: I thought so, too. I saw a pack of her medication on the bathroom stall, it was half-empty. #Conv
    Examiner Peng: Yes, by the levels we found in her blood, we figured that she had to be taking the medication normally, until the last couple fo days, at least. #Conv

    -- Examiner Peng: We also noticed a few bruises that started to form during the night that we found her. As you can see here, it's not just one spot. I don't know that happened, but I can tell you from experience that these are no accident... #Conv

    Noah: Yet no apparent signs of forced entry. But someone had to be there... #Conv
    Examiner Peng: I am no detective, but either someone knew how to slither their way in, or you might want to have another talk with the husband. #Conv
    Examiner Peng: In any case, you can see here that Claudia was shot right above the left eyebrow, near the temple. Not only is it very uncommon for someone to shoot themselves this way, but also, if that were the case, the proximity of the gun would have inflicted a much different wound. #Conv
        Noah: Makes perfect sense. #Conv
        
        **[...]
        ->examiner


*(show){talk} {inventory has shell or inventory has claudia_wine_sample or inventory has cristina_wine_sample} [Show the examiner your findings.]
-> examiner_clues

*{show and talk}[Leave the lab.]
->statements

*
-> end_examination

= end_examination
Noah: I see. Alright, thanks Mia.Keep me posted. #Conv
Examiner Peng: Will do.
-> statements



= examiner_clues
Noah: {Anyway, I found some stuff you might want to take a look at.|Actually, I have something more to show you.} #Conv
*{inventory has shell}[Show the second bullet shell.]
Noah: I noticed this empty shell right by the bed, a second bullet was fired and ricocheted off the bedroom wall. It's becoming clear to me that we're dealing with attempted murder. #Conv
Examiner Peng: Let me see... #Conv
The medical examiner takes a closer look at the shell.
Examiner Peng: Yes, this is the same type of bullet that we extracted from the victim's skull. The perpetrator probably missed the first time. #Conv
Noah: That could explain the bruises. Claudia had to struggle to get away... #Conv
~inventory -= shell
~ evidence += second_shell
-> examiner_clues

*{inventory has claudia_wine_sample or inventory has cristina_wine_sample}[Show the wine {inventory ? (claudia_wine_sample,cristina_wine_sample):samples|sample}.]

{
    - inventory ? (claudia_wine_sample,cristina_wine_sample):
    Noah: I collected two samples, one is from the opened bottle of wine we found in the kitchen. The other one is from these stained paper towels and glass pieces I found in the bathroom. #Conv
    Noah: It appears to be wine as well, but I'll leave it up to you. #Conv
    ~ inventory -= claudia_wine_sample
    ~ inventory -= cristina_wine_sample
    
    ~XP += 50
    
    - inventory has claudia_wine_sample:
    Noah: I sampled these red-stained glass pieces and paper towels I found in the bathroom. It doesn't look like blood, maybe wine or something. #Conv
    
    ~XP += 30
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

--Sgt.Jacobs: He's just our insider, you don't have to like him. #Conv
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

-- Sgt.Jacobs: Don't get it twisted though, the Willford case is still your priority. #Conv
    
    ***[...]
    -> side_activity

= claudia_update
//~ day = Wednesday
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

~XP += 10
Noah: Easy for you to say, but I've been a one-man-band for a while now. I could really use some backup. #Conv
Sgt.Jacobs: Right... #Conv

*[Say nothing.]
Sgt.Jacobs: Look, I know you've taken too much responsibility these days and you shouldn't be all by yourself. #Conv

- Sgt.Jacobs: We've been seriously understaffed for a while, but I'll let you choose either Milton or Johnson as your temporary partner. #Conv
Sgt.Jacobs: Milton is less experienced in real world scenarios and may sometimes misinterpret people, but his analytical thinking model is somewhat remarkable. #Conv
Sgt.Jacobs: On the other hand, Johnson may be brash or rough around the edges, but the kid's got great instincts. It's up to you. #Conv

* [Choose Milton.]

~partner = "Milton"
Noah: I think Milton is a safe choice. He keeps track of everything. #Conv

* [Choose Johnson.]
Noah: I choose Johnson. It will be an opportunity for him to test his potential and mature. #Conv

~partner = "Johnson"

-Sgt.Jacobs: Good, I'll let him know. Oh, and one more thing. Commander Reynolds and other higher-ups on the division have been pressuring our captain to have the case closed within the next 10 days. #Conv

*["Are you serious ?"]
Noah: Are you serious ? What is this, a school project ? #Conv

~ audacious++
Sgt.Jacobs: Don't play dumb, you know what's happening here. The folks on Stilton Avenue are part of a powerful community and the authorities don't want them upset and losing their faith in them. You know the priorities. #Conv
Sgt.Jacobs: The sooner this case is closed, the better we preserve the relationship between the police and the white collars. #Conv

*["I see."]
Noah: I see. I'll do my best. #Conv
Sgt.Jacobs: Great. You know how influential these people are, we need to keep them content, more so than others. Sadly, it's part of the game. #Conv

-Sgt.Jacobs: If we're unable to come to a solid conclussion within this timeline, we'll close the case as a suicide. #Conv

*["You know this can't be right."]

~XP += 20
Noah: You know this can't be right. You saw it and I saw even more. #Conv
Sgt.Jacobs: Yes. But you'll need concrete proof and an alibi. #Conv

*[Say nothing.]
A momentary uneasy silence between the two.

-Sgt.Jacobs: You're welcome to prove otherwise, you just have until Monday to do so. If not for the captain putting his foot down, we wouldn't even be having half of that. #Conv
Sgt.Jacobs: I know you take pride in your work, that's why I'm encouraging you. But remember, the cards aren't on our side. At the end of the day, we're playing their game. #Conv
Sgt.Jacobs: What I'm trying to say is, don't lose your mind in the process. #Conv
Another short pause enters the conversation.

Noah: Got it. Good night, Sarge. #Conv
Sgt.Jacobs: Take care, Taulen. {partner} will be joining you tomorrow. #Conv
Sgt: Jacobs: I almost forgot, the examiner called, you should drop by, first thing in the morning. She'll have the initial reports ready by then. Her input will give you the right direction. #Conv

*[...]
-> examiner_update

=== rosey_sqr ===

#background #roseysqr
{once: Late that night, Noah and {partner} find themselves downtown, in Rosey Square.}
It looks as busy as usual. #rosey

{once: Often referred to as the "Devil's Square", Rosey Square has the reputation for being one of the city's most notorious vice hubs, also offering a hangout for sketchy business behind doors, more often than not.}

{~The square's kitsch, bizzarely dim neon lighting reveals hordes of degenerates, some waiting in line outside of some adventurous clubs, others just being on the lookout for cheap substances and/or companionship.| The contrasting odors of cologne and vomit make for a thrilling experience...|}

{once:{partner == "Milton":Milton: According to previous encounters, this individual can be found in the "Red Hole" from 23:00 to 03:00, although hours may vary.|Johnson: This dirtbag likes to play boss in the "Red Hole" around these hours. I remember Garza having a drink or two at times. We'll head over to Carsen Street, at about fifty feet, there's a heavy black door on the left. We'll know it once we get there.   } } #Conv

{partner == "Milton" && !red_hole:Ain't no party like a Rosey Square party...} #Conv

{sly > 3: Cops aren't exactly rockstars around this area, if we yell it out loud, we might have issues. We should lay low, if possible... [Sly > 3]} #Thought 

+[Walk through Carsen Street.]
-> carsen_1


= carsen_1
#background #carsen
{~The pavement feels moistened by the amount of spilled booze, among other sorts of liquids|The smell of weed seems to be a common theme in this area.}

On the left side of the street, there is a small liquor store, and right next to it appears to be a movie theater. On the right side is a big club, loud, heavy music coming from inside.
Right outside the club's entrance door, the bouncer is trying to separate two young guys fighting.


+[Keep walking.]
-> carsen_2


= carsen_2
#background #carsentwo


{
    -!blunt:
Further down the street, there is a group of stoned folks, rhytmically singing along to some ethnic music, coming from a bohemian bar, right behind them.
    -else:
Noah knows better than walking towards the bar again,
}

{
    -!motel:
    Right across the street, a slightly neglected, underlit motel, mostly odd couples eagerly coming in and out.
    -else:The motel keeps welcoming degenerates.
}
    
Next to the motel stands an unidentifiable building.

*[Walk towards the bar.]
#background #cig

~blunt = true
An intoxicating atmosphere surrounds the bar. The large body of smoke makes it difficult to distinguish signs or faces. 
A tall man with long dreadlocks approaches the detective.
Man: Hey mon, wah gwaan ? You look like you need a good partay ! Dis de staff for it. #Conv
The tall man offers Noah some kind of cigarette.

    **[Take it.]
    
    ~rogue++
    
    Noah: What the hell, I haven't had this stuff in a while. #Conv
    Noah takes the cigarette.
    
    ~inventory += cigarette
    Man: Okay mon, das 2000. #Conv
    Crap, I got scammed. Of course it wouldn't be free. #Thought
    
        ***["I don't have any money !"]
        Noah: Look man, I have no money with me, I though you just handed it to me. #Conv
        Man: No mon, you take you keep. Imma get ma money now. #Conv
        The man gets serious and menacing in front of Noah's face, as two other men come to back him up.
        
            ****{money >= 2000}[Give him 2000.]
            Noah: Ok, I don't want any trouble. Here you go. #Conv
            
            ~ money -= 2000
            
            The detective pays the dreadlock man, who now walks away.
            
            {partner == "Milton":Milton: With all due respect, detective, that was a poor choice.|Johnson: Boss, although I enjoy a good blunt here and there, you won't find it here. Plus, the ripped you off. We should've scared them by telling them we're cops.} #Conv
            
            Noah: I know... #Conv
            -> carsen_2
            
            ****[Tell him you're a cop.]
            Noah shows his badge and his gun.
            Noah: You can walk away right now, or you can spend a couple nights in jail. What's your pick ? #Conv
            
            Man: No mon, sorry ! All good, you keep it ! #Conv
            The man and his friends get scared away and leave Noah and {partner} alone.
            
            {partner}: Maybe we should have avoided that. #Conv
            Noah: I know, I just get stupid sometimes. #Conv
            
            -> carsen_2
        
        ***{money >= 2000}[Give him 2000.]
        Noah: Alright, I get it. Here you go. #Conv
            
            ~ money -= 2000
            
            The detective pays the dreadlock man, who now walks away.
            
             -> carsen_2
             
        ***[Tell him you're a cop.]
        
        ~XP += 20
        Noah shows the man his badge.
        Noah: Unauthorized selling of substances can get you a few years worth of prison time, unless you walk away right now. #Conv
        Man: No mon, sorry ! You can keep it, imma be gone ! #Conv
        The man gets scared and runs off.
        
        {partner == "Milton":Milton does not say anything, but he gives the impression that he did not condone what just happened.|Johnson: Boss, that was quite badass !} #Conv
        -> carsen_2
        
    
    **[Decline.]
    
    ~XP += 40
    Noah declines the offer.
    Man: You don know whatcha missin, mon ! Come on now ! #Conv
    The man won't get out of the detective's face.
        
        ***[Walk away.]
        Noah and {partner} keep walking further away, completely neglecting him.
        -> carsen_2
        
        ***[Tell him you're a cop.]
        
        ~audacious++
        Noah shows the man his badge.
        Noah: Unauthorized selling of substances can get you a few years worth of prison time, unless you walk away right now. #Conv
        The dreadlocked man gets scared and instantly disappears.
        -> carsen_2
    

*[Get inside the motel.]
#background #motel

~ motel = true
Noah and {partner} walk up to the motel's reception. An expressionless woman with a weathered face sits behind the counter.

Woman: You two lovebirds looking for a cozy room ? If you're more playful, the Bondage Pod just became available, if that's your thing. #Conv

Noah: What ?! No, we're not here for that. #Conv

    **[Ask about the 'Red Hole'.]
    Noah: I've been told the 'Red Hole' is somewhere near. Do you know where it is ? #Conv
    Woman: The building right next. Just know, it ain't open to everyone. #Conv
    Noah: Yeah, we know. Thanks. #Conv
    
    -> carsen_2
    
    **[Leave.]
    Noah and {partner} get out of the motel.
    -> carsen_2

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
    - !ask_door and !confront_bouncer:
    Automated Voice Message: Greetings, gentlemen. #Conv
    - else:
    The speakers remain silent.
}
* (ask_door) {partner == "Milton"} ["Is this the Red Hole ?"]
Noah: Is this the "Red Hole" ? #Conv
The intercom gets shut down.
{
    - sly > 3:
    Yeah, that's probably it. If you don't know the place, you're only going to find it by chance, and they won't be waiting for you. That's intentional. [Sly > 3]
    - else:
    What the hell... Rude.
} #Conv

-> redhole_entrance

*[Show your badge. (Audacious)]
Noah shows his police badge to the security camera.
Noah: Detective Noah Taulen, Stillfork P.D. #Conv
Automated Voice Message: Please wait. #Conv
{partner} looks more {partner == "Milton":alert|tense} than a few seconds ago.
Suddenly, a tall, bulky man with a large scar on his face opens the door.
Bouncer: What do you want ? #Conv

** (confront_bouncer) [Confront him. (Audacious + dice roll > 6)]

    {
        - try(audacious,7) == true:
        
        ~XP += 30
        Noah: I thought I made it pretty clear, I'm a police detective. My partner and I have an important job to do here. Can you let us in to do our thing and go home or do we need to make a big deal out of this ? #Conv
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

~XP += 10
Noah: ..."Santa". #Conv
After a few seconds, the door opens automatically.
Well, that happened. #Thought
-> red_hole

*["We're here to see Skid."]
Noah: We're here to see "Skid". #Conv

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
They find themselves in a tangle of loud trance music, smoke, degenerate faces and suggestive lighting. #hole 

{
    - partner == "Milton":
    Milton: People, like the man we're looking for, tend to sit at corner tables on the periphery of the room. It offers them privacy to discuss their matters, but also a sense of power, as they face the entire area and have clear vision of everything happening around. #Conv
    - else:
    Johnson: I think I see him way over there, in the right corner, with those girls. His usual spot...
} #Conv

Noah: Yes, I can see him. His sleaziness almost puts a spotlight on him. That bastard doesn't age though... #Conv

*[Walk up to "Skid".]
-> skid

= skid
#background #skid_women
Noah and {partner} go over to Skid's table. In an apparent state of substance-induced euphoria, he is sitting with two lightly dressed women.
Skid: Well, well, well, if it ain't the "Stillfork 45" boys. Taulen and his new boytoy, to be more specific. #Conv

*["Never a pleasure, Skid..."]
Noah: Never a pleasure, Skid... #Conv
Skid: Oh come on, I'm just messing with you, you know that you and your friends in the P.D. are my favorite associates ! #Conv
Of course, he was going to play that card... #Thought
Skid: Just to prove that you have my undivided attention, no-one's gonna be bothering us. Beat it, chicas ! #Conv

*["Well, if it ain't the world's cheesiest pimp..."]
Noah: Well, if it ain't the world's cheesiest pimp... #Conv

~ audacious++
Skid: Come on buddy, don't be like that, I know you don't mean it ! Besides, it doesn't suit your style, that was more like Garza's temperament, you bring your boy scout energy into the equation. #Conv

*["Let's get this over with."]

~XP += 10
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
After figuring out the details alongside 'Skid', the two policemen leave.
    
    **[...]
    -> side_activity

*(declined_job)[Decline the job.]
Noah: Wow, you got some nerve. Do you really see us as your lapdogs ? #Conv
Skid: No need to get hot, brother. You don't want to do business, it's fine. Go find yourselves a table and enjoy your time. First drink on me. #Conv

    ** (threaten) [Threaten him on the spot. (Audacious + dice roll> 9)]
Noah: I don't know who you think you are, but we got enough evidence to lock you up until your teeth fall off. The only reason we're letting you off the hook is because you provide dirt on fish much bigger than yourself. #Conv


{
    - try(audacious,10) == true:
    
    ~XP += 50
    -> skid_talk
    
    - else:
    -> threaten_fail
}
    
    **[Leave.]
    -> skid_leave
    

    ** (lure) [Lure him to the back. (Rogue + dice roll > 8)]
Noah: Wait, there's something I want to discuss with you in private, if we could find a quiet spot. Just me and you, {partner} will stay here. #Conv
Skid: See, I knew you were up to something ! I'll give you two minutes, come this way. #Conv
Skid shows Noah the stairs that lead to a basement. 

{
    - try(rogue,9) == true :
    
    ~XP += 40
    -> skid_talk
    
    - else:
    -> threaten_fail
}

*{threaten_fail or declined_job}
-> skid_leave

    

= skid_talk 

{
    - skid_choice.threaten:
    Noah: That being said, you haven't really been much use to the precinct lately. I'd say that you've served your purpose outside bars, so maybe it's time you stood behind them. Unless you give me what I came in this shithole for. #Conv
    Skid: Alright, robocop, don't make a scene, the last thing I want is people finding out we have cops in here, jerking around. #Conv
    - skid_choice.lure:
    
    Noah: Actually, I got something in my car that I wanted to show you. Top of the line product they've told me, maybe we could get something going. I've parked on the other side of the building, come check it out. #Conv
    Skid: Shit, I didn't know you had it in you, kiddo ! #Conv
    I wanna punch him so bad... #Thought
    They get up.
    The detective follows Skid as he unlocks the backdoor. #background #backalley
    Right after Skid unlocks the backdoor, Noah sucker punches him. #smack
    He then drags him over to the narrow alley, behind a dumpster.
    To top it all of, he points his gun at him. #alley
    
    Noah: I guess we'll do it the hard way. Now, talk. About the girl. #Conv
    Skid: Agh !!! Fine, fine, don't do anything stupid ! Listen... #Conv
    
}

Skid: There's this secret organization... they have this cryptic vibe to them, quite the weirdos. Anyway, they abduct vulnerable kids, usually from lower classes or immigrants. #Conv
Skid: Allegedly, they recruit them, change their appearance and brainwash them through a "program", kinda like a military school. #Conv
What the hell... #Thought

-> skid_reveal

= skid_reveal
{
    -choice_one and choice_two:
    -> skid_leave
    -skid_choice.lure:
    {~Skid finds this conversation very unpleasant|A couple drunks walk by across the street, minding their business|Noah lowers his gun, ever so slightly, for the sake of conversation}.
    -skid_choice.threaten:
    {~This is hardly the place for such a conversation|A few people try to get to Skid or send him a drink here and there, but the bodyguards prevent them. }
    
}

*{inventory has photo}[Show Daria's photo.]

~choice_two = true
Noah: This might be a long shot, but there's this girl I've been looking for. Daria Kozlov, 13, lives in Vandergrift, disappeared in mid-November. #Conv
Skid rushingly glances at the photo.
Skid: Never seen the kid, but she totally fits the description of who they're going for. #Conv
-> skid_reveal


*[Ask about the organization.]

~ choice_one = true
Noah: What do you know about this organization ? #Conv
Skid: Not much, really, I don't know any of them. It's an elitist group with lots of money behind them. All of them also bear a symbol on their skin, a shape or something. That much I know. #Conv

    ** ["How do you know all that ?"]
    Noah: How do you know all that ? #Conv
    Skid: There's this guy I knew. Had made quite a name for himself in the tech world, mad genius type of guy. He had developed a process of arificially generating paintings in the style of famous old painters. #Conv
    Skid: They looked so authentic in relation to the painters' original work to the point that he could convince art experts that he owned a private collection of classic, never-released artwork. #Conv
    Skid: He went all the way, imitating the proper usage of color, brushes, etc, even providing counterfeit seals of authenticity, supposedly from way back in the day. Quite a nerd for art, he knew all that stuff. #Conv
    Skid: Long story short, he used to date a chick from that organization. She introduced him and he hooked them up with paintings. Only problem, they realized what was going on and tried to get rid of him. #Conv
    
    
    ***["Where is he now ?"]
    Noah: Where is he now ? #Conv
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
    
    **** (shovegun){skid_choice.lure && (audacious > 5 or rogue > 5)} [Shove the gun on his head. (Audacious/Rogue > 5)]
    Once again, Noah neutralizes him and pushes the gun on Skid's temple.
    Skid: ALRIGHT, ALRIGHT, DEAR GOD ! He resides in the eastern suburbs, in the Vietnamese neighborhood of Vo Ngang. #Conv
    Skid: As you take Exit 34 from here and then turn right for Chinzou, at some point you'll see the main square of Vo Ngang. There's quite a few ramen shops, I believe he lives somewhere across one of them. #Conv
    Skid: He changed his name to Troy Berkins, so you can start with that. #Conv
    Skid: Now, if you'd be kind enough to hide that gun, take your friend and fuck off, I'd be grateful. I got nothing else to share, even if wanted to. #Conv
    -> skid_reveal
    
*
->skid_leave

= skid_leave
{skid_choice.lure && threaten_fail:With their heads down, }Noah and {partner} head back to the car and go home.
    
*[...]    
-> side_activity

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
    Right after he blindsides Skid, he blacks out. #smack
    
    ~HP -= 20
    Two minutes later, he wakes up on the side of the pavement, a few meters outside of the "Red Hole".
    He sees {partner} nervously checking on him. #alley
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
    
    -> skid_leave
}



//->END

=== examiner_update ===
#background #lab
~ day++
~ time_of_day = morning

Early in the morning, the detecive meets the coroner in her office. 
There must be something that she has figured out. #pixel_river
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
    
*[...]
-> meet_partner

=== rita_died ===
#background #rita_dead

~day = Sunday
~time_of_day = morning

Sunday morning, it's Noah's day off. Although not in the mood for going out, he forces himself to go for a stroll and then stop for breakfast at that cozy diner near his house.
Noah feels like he can't keep on living like this. #old_city
I owe it to myself to try and get back out there. One step at a time... #Thought

During his meal, he receives a message.
It's from {partner}, it contains a link.

*[Open the link.]
"35 Year Old Woman Found Dead in River" 
He has a bad feeling... #caught
"An upsetting incident was uncovered very early this morning, as a boat of fishermen discovered the lifeless body of a young female lying on the surface of the Hagslow River, around half a mile from the Oceana Bridge. According to the police, the unfortunate woman probably fell in the river from a great height at some point over the last couple of days and the current carried her away to the spot where she was found."
**[Keep reading.]
"The circumstances under which the woman fell to her death remain unknown, althought the local authorities claim that there is no evidence to support foul play, deeming the woman's tragic passing a suicide."
Below the article, Noah sees the picture. It's Rita.
The sounds fade into the background, the people, the objects in the diner become trembling shapes. A chill runs down the detective's spine.

-What. The. Hell. #Thought
*[Call {partner}.]
{partner} arrives at the diner shortly after. He sits with the detective, who still looks as pale as paper.
{partner}: I remembered the housekeeping lady from the night of the incident, when the whole unit arrived at the scene. {partner == "Milton":This is an alarming development, detective|I'm lost for words too, boss.} What do you think happened ? #Conv
    **["What she saw traumatized her."]
    Noah: I think that what she saw deeply traumatized her. The image of a person you've known well for many years shot in the head is a heavy burden. Especially, if you consider the fact that she was the first person to discover the body. #Conv
    Noah: Not to mention the unfair guilt she must have carried, thinking that she could have prevented it, had she gone sooner. All these factors together could drive a person mad. #Conv

    **(they_killed_rita)["Someone wanted her gone."]
    
    ~ XP+= 30
    
    Noah: This was neither suicide, nor an accident, trust me. Someone wanted her out of the picture for good. She probably knew more than she what she led me to believe and that scared them. #Conv
    
    *["She struggled financially."]
    Noah: During our conversation, she mentioned that she was in dire straits and that she couldn't afford another ticket to go to her mother. The state is in a great depression and so many fellow citizens are left with no other choice. Shame on the New Republic for driving people to such ends ! #Conv

- Noah: We have to get to the bottom of this, no matter what. In memory of Rita, too.{they_killed_rita: Whoever killed Claudia is responsible for this, too}. #Conv
{empathetic > 2:If only I had given her the damn money for the train... Maybe I could have saved her...} #Thought

{
    - empathetic > 2 and partner == "Milton":
    
    Milton: Are you alright, detective ? I can see you are tearing up. #Conv
    Noah: She seemed nice, she didn't deserve this. She also leaves a young daughter behind... #Conv
    - empathetic > 2 and partner == "Johnson":
    Johnson: Don't let it get to you, boss. This world will drive you nuts, we're doing everything that's in our power. #Conv
    Noah: I know. It doesn't make it much easier. #Conv
}

*[...]

~ timepass()
-> next_move

=== rita_reveal ===
#background #rita_dead

~day = Sunday
~time_of_day = morning
After his morning walk, Noah stops by the charming diner near his house for some breakfast and a fresh cup of coffee.
As he's reading the news while sipping some coffee, his phone rings. However, the caller is anonymous. #pixel_river

*[Answer.]

- Noah: Who is this ? #Conv
Rita: Mr.Taulen, this is Rita. Rita Stamopoulos, Mrs.Willford's housekeeper.
Noah: Oh, how are you ? #Conv
Rita: Good, thank you. It's great here and I'm much safer, again, thank you sou much. I will repay you soon. #Conv
Rita: I'm calling because I believe that there's something more you need to know. #Conv
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
    
    *[...]
    
    ~timepass()
    -> next_move


=== cristinas_ex ===

= outside
#background #troys
{once:Noah and {partner} find themselves standing outside Troy Berkins' supposed house.}
It's a noticeably small house, minimal on the outside, while showcasing some traditional Asian architecture, much like the rest of the neighborhood. #pixel_river
{once:Noah: He must be really secluded, very few people knew anything about him. Or so he wants us to think...} #Conv


+ [Look around the house.]
Adjacent to the house seems to be a storeroom with a tiny window.

    ++ [Peek through the window.]
    Several typical toolkits and cleaning equipment appear to be stored inside.
    {analytical >= 2: Noah {once:also notices a |already noticed the }handbarrow filled with brushes, tins of paint and a set of carefully preserved canvases. [Analytical > 1] }
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

~XP += 20

{
    - recruiter_fail:
    -> irritated_troy
    
    - else:
    
    ~XP += 30
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

* [Lie to her.]

{
    -XP>=20:
    ~XP -= 20
}
Noah: Good afternoon, Miss. #Conv

~sly++
    
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
    
    
    {
        -isolate:
        Noah: Mr.Berkins we're with the Stillfork P.D. We're investigating a series of reported disturbances around your neighborhood and we'd like to take your statement, if that's ok. #Conv
        Troy: Uh, sure... But I don't know what to tell you, I havent- #Conv
        {partner}: Excuse me, Miss, would you happen to have an aspirin, by any chance ? A headache has been bothering me all day. #Conv
        Young Woman: Sure, I believe I have some left, give me a minute. #Conv
        Nice. #Thought
        -> dropped_gun
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
    -> dropped_gun
}




= irritated_troy
#background #troyinterior

Noah: I'm sorry, this is not why we're here. #Conv
Noah: We're police officers from the Stillfork P.D. and we've been told that your husband could have some important information regarding a case. #Conv
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
* [Grab your gun and throw him off. (Stealthy + dice roll > 6)]

{
    - try(stealthy,7) == true:
    
~ XP += 30
Through a blazing-fast motion, Noah grabs his gun.
-> aim
    
    - else:
    Noah attempts to quickly grab his gun, but it slips through his hand.
    In a rushing act of fear, Troy pulls the trigger.
    {
        - HP <= 0:
        -> noah_shot
        
        - else:
        ~ HP -= 20
        Noah screams in pain as the bullet pierces his {~right shoulder|left leg|right arm|left ear}.
        This gives {partner} enough time to get a hold of his gun and aim at Troy.
        -> handle_troy
        
    }
}

* (leaveweapon)[Leave your weapon down. (Empathetic + dice roll > 4)]
Noah: We came here with no intention to hurt you. To prove it, my partner and I will put our weapons down, right here. #Conv

{
    -try(empathetic,5) == true:
    
    ~XP += 30
    Noah and {partner} calmly place their handguns on the wooden floor, while Troy nervously watches, his arms tense and his gun aimed at them.
    -> dropped_gun
    - else:
    Noah's words sound disingenuous to Troy, who strengthens his grip.
    Troy: I just told you to not make a move ! Don't test me, this is your last warning ! #Conv
    -> handle_troy
    
}

*[Talk to him.]
Noah: We should all try to use reason here. #Conv
Troy: Is that a threat ?! #Conv

**["I need your help."]

~XP += 10
~ troys_trust++
Noah: I need your help. I'm working on a case involving a missing kid. The circumstances indicate that it could be linked to a kidnapping ring. I was told you could have some information on that. #Conv

Troy: What are you accusing me of ? #Conv
Noah: Nothing. I also know that you're no longer associated with them and that you had to escape. The only thing I want from you is information, then we'll never bother you again. #Conv

**(arrest_threat)["This is up to you."]
Noah: This is up to you, Mr.Berkins. We could do this another time if you choose to, but if so, I have to warn you, we'll be back with an arrest warrant. #Conv

-- Troy's expression suggests that he knows what Noah is talking about. He puts his gun in his pocket. 
->dropped_gun


= aim
*(shot_troy) [Shoot the gun off Troy's hand. (Stealthy + dice roll > 9)]

{
    - try(stealthy, 10) == true:
    
    ~XP +=  30
    ~stealthy++
    
    With a steady, swift motion, Noah fires, grazing Troy’s forearm and forcing him to drop the gun.
    Troy: AAAGH ! THAT HURT ! #Conv
    -> dropped_gun
    - else:
    
    -> troy_shot
    
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
The woman doesn't answer, althrough she's clearly nervous.
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
Troy: I don't know how to put this. I understand that they recruit young people systematically. From this point forward, these people become their soldiers, or "seekers" as they call them. They're given new identities, while being force-fed the "Arbor" propaganda. Given time, they are presented with the opportunity to rise through the ranks, if they have the potential. #Conv
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
        {partner == "Johnson":Noah: I got this, partner.} #Conv

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
    
    ~XP += 20
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
*["We're off the record." (Sly)]

~sly++
~ troys_trust++


Noah: I assume you're afraid that this information will reach the wrong ears. Believe me, the only people in my precinct who acknowledge your existence are me and my partner. #Conv
Noah: This investigation was initially just about a kid who disappeared, but the only reason I took the case is because nobody else cares. #Conv
{partner}: Besides, {partner=="Milton":if I may,} if we {partner=="Milton":regarded you as a potential threat to our nefarious interests, we would have taken other measures|wanted to shut you up for good, we would've been done here }by now. #Conv
Troy: Fine. #Conv
-> talkaboutex_proceed

*[Threaten to turn him in.]

~XP += 30
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

** (bluff) [Bluff to learn more details. (Rhetor + dice roll > 9)]

{
    - try(rhetor,10) == true:
    
    ~ troys_trust++
    ~ XP += 50
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



*{!shot_troy} [Make him feel safe. (Empathetic + dice roll > 6)]

{
    - try(empathetic,7) == true:
    
    ~XP +=10
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
    Troy: You seem to be decent cops, not a common thing these days. I'd like to give you something that I've kept in my storeroom. Hopefully, it will come in handy. #Conv
    -> troys_gift
    -else:
    {
    -time_of_day == morning:
    
    ~timepass()
    -> next_move
    -else:
    *[...]
    -> side_activity
    }
}

= troys_gift
#background #workshop
Noah and {partner} watch curiously as Troy rummages through his impressive gadget kit.
The man presents to them some sort of a small computer. #pressure
Troy: It can read and copy hidden files from any drive, regardless of encryption. Once you connect it, it can also break through any security wall. I dedicated years of my life and quite a bit of my sanity to develop this, but it's truly remarkable. #Conv
Troy: However, it requires some basic knowledge of operating systems in order to be able to use it properly. #Conv
Troy: Once I realized that my days in Cristina's world, or the world in general might be numbered, I secretly started to retrieve files from her devices. #Conv
Troy: I couldn't go through her devices that often, because she was very wary about them. However, a couple of times, she accidentally let her "work" phone exposed and I managed to extract some data. #Conv
Troy: From what I gathered, she also had other, more private methods of communication, whatever they may have been. Still, you can take this for what it's worth. #Conv
Troy hands a small, sleek computer over to Noah, his eyes betraying a hint of reluctance.
~ inventory += tracker
Troy: I never bothered inspecting what's in there. This whole process lasted about two weeks or so, then I disappeared overnight for my own good. #Conv 
Troy: I hope this gives you some leverage. I'm not in a position to tell you more, I'm sorry. Good luck. #Conv

The two detectives thank the man and take off.


    {
    -time_of_day == morning:
    
    ~timepass()
    -> next_move
    -else:
    *[...]
    -> side_activity
    }
