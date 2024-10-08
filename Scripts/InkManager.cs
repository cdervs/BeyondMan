using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;
using TMPro;
using System.Threading.Tasks;
//using System.Threading;
using System;
using System.IO;
using UnityEngine.EventSystems;

// The InkManager class handles most of the essential methods and operations that manage the flow of the game.
public class InkManager : MonoBehaviour 
{

  public GameStateManager autosave;
  
  [SerializeField]
  public SoundController _soundcontroller;

  public TMP_InputField input_field;
  public Button leave_input, endButton;
  private string input;

  public SpriteRenderer spriteRenderer;
  //string writer;
  public static AudioSource backingtrack, b_track ; //static in order to be preserved through changes between scenes.
  
  int num;
  string text;
  public string savedtext2, _savedfont, _savedfont2;
  static string keepfont, keepfont2;

  //public Canvas canvas;

  public string loadtrack;

  public static string background_tag, textholder1, textholder2;

   public static TMP_Text textprefab1, textprefab2;
  public string saved_background;
  public static string loadtrack2; //will store loadtrack and loadtrack2 will appear in InventoryManager
  public static string textbackup; //will be used to load the last text when we return from the inventory

  public bool wasplaying;
  public static bool choicesdisplayed = false;

  

  List<string> dialogue_styles = new List<string>{"Thought", "Conv"};
  

  public static List<string> tags;
  public static List<string> tags2;

  int timesvisiteddisplay = 0;

  int xp_points, health_value;

  char previous;
  [SerializeField] float delayBeforeStart = 0.5f;
	[SerializeField] float timeBtwChars = 0.015f;
	[SerializeField] string leadingChar = "";
	[SerializeField] bool leadingCharBeforeDelay = true;

  Vector3 p = new Vector3(-50,200,0);

  public static Button _nextButton;

  public Button[] buttons;

   [SerializeField]
  public Sprite[] ImagesArray;



  [SerializeField]
  private TextAsset _inkJsonAsset;
  public Story _story; 

  public TMP_Text startNotification;
  public static Story  storybackup; //stores the story state in order to resume after the inventory has been opened.
  public bool typingdone;

  
  public string _savetag;

  private static string _loadedState, decoyState, loadedtrack;
  private static string loadedtext, loadedtext2, loadedfont, loadedfont2;

  static string _sprite;







  [SerializeField]
  public TMP_Text _textField, _textField2;

  [SerializeField]
  public TMP_Text saveNotification;

  [SerializeField]
  public TMP_Text xPnotification;

  [SerializeField]

  public TMP_Text healthNotification;

  [SerializeField]
  public TMP_Text noahPrefab;

  [SerializeField]
  public TMP_Text narratorPrefab;

  [SerializeField]
  public TMP_Text convPrefab;

  [SerializeField]
  public GridLayoutGroup _choiceButtonContainer;

  public VerticalLayoutGroup _textContainer;

  [SerializeField]
  public Button _choiceButtonPrefab;
  [SerializeField]
  private Button _nextButtonPrefab;


    // Start is called before the first frame update


  
  public static void LoadState(string state, string _loadedfont,string _loadedfont2,
  string textload, string textload2, string trackload, string _renderer)

  //LoadState contains the saved data, packaged in the GameStateManager class.

  {
    _loadedState = state;
    loadedfont = _loadedfont;
    loadedfont2 = _loadedfont2;
    loadedtext = textload;
    loadedtext2 = textload2;
    loadedtrack = trackload;
    _sprite = _renderer;
    
   
  }

  
//task generates time intervals between which UI elements appear.
  Task task = Task.Run(async () =>
    {
        await Task.Delay(400);  // Simulate work for 2 seconds
    });

  void Adjust()
  //Selects the appropriate background image by tag name.
  {
    spriteRenderer = GetComponent<SpriteRenderer>();
    if(tags.Contains("first_scene"))
    {
      spriteRenderer.sprite = ImagesArray[0];
      background_tag = "first_scene";
    }
    else if(tags.Contains("ontheroad"))
    {
      spriteRenderer.sprite = ImagesArray[1];
      background_tag = "ontheroad";
    }
    else if(tags.Contains("apartment_building"))
    {
      spriteRenderer.sprite = ImagesArray[2];
      background_tag = "apartment_building";
    }
    else if(tags.Contains("apartment"))
    {
      spriteRenderer.sprite = ImagesArray[3];
      background_tag = "apartment";
    }
    else if(tags.Contains("police_station"))
    {
      spriteRenderer.sprite = ImagesArray[4];
      background_tag = "police_station";
    }
    else if(tags.Contains("hall"))
    {
      spriteRenderer.sprite = ImagesArray[5];
      background_tag = "hall";
    }
    else if(tags.Contains("shrink"))
    {
      spriteRenderer.sprite = ImagesArray[6];
      background_tag = "shrink";
    }
    else if(tags.Contains("terrells"))
    {
      spriteRenderer.sprite = ImagesArray[7];
      background_tag = "terrells";
    }
    else if(tags.Contains("elaine_street"))
    {
      spriteRenderer.sprite = ImagesArray[8];
      background_tag = "elaine_street";
    }
    else if(tags.Contains("richters_home"))
    {
      spriteRenderer.sprite = ImagesArray[9];
      background_tag = "richters_home";
    }
    else if(tags.Contains("uni"))
    {
      spriteRenderer.sprite = ImagesArray[10];
      background_tag = "uni";
    }
    else if(tags.Contains("office"))
    {
      spriteRenderer.sprite = ImagesArray[11];
      background_tag = "office";
    }
     else if(tags.Contains("troys"))
    {
      spriteRenderer.sprite = ImagesArray[12];
      background_tag = "troys";
    }
     else if(tags.Contains("rita_dead"))
    {
      spriteRenderer.sprite = ImagesArray[13];
      background_tag = "rita_dead";
    }
    else if(tags.Contains("lab"))
    {
      spriteRenderer.sprite = ImagesArray[14];
      background_tag = "lab";
    }
    else if(tags.Contains("dayfont"))
    {
      spriteRenderer.sprite = ImagesArray[15];
      background_tag = "dayfont";
    }
    else if(tags.Contains("nightfont"))
    {
      spriteRenderer.sprite = ImagesArray[16];
      background_tag = "nightfont";
    }
    else if(tags.Contains("roseysqr"))
    {
      spriteRenderer.sprite = ImagesArray[17];
      background_tag = "roseysqr";
    }
    else if(tags.Contains("carsen"))
    {
      spriteRenderer.sprite = ImagesArray[18];
      background_tag = "carsen";
    }
    else if(tags.Contains("carsentwo"))
    {
      spriteRenderer.sprite = ImagesArray[19];
      background_tag = "carsentwo";
    }
    else if(tags.Contains("redholeentr"))
    {
      spriteRenderer.sprite = ImagesArray[20];
      background_tag = "redholeentr";
    }
    else if(tags.Contains("backalley"))
    {
      spriteRenderer.sprite = ImagesArray[21];
      background_tag = "backalley";
    }
    else if(tags.Contains("troyinterior"))
    {
      spriteRenderer.sprite = ImagesArray[22];
      background_tag = "troyinterior";
    }
    else if(tags.Contains("park"))
    {
      spriteRenderer.sprite = ImagesArray[23];
      background_tag = "park";
    }
     else if(tags.Contains("workshop"))
    {
      spriteRenderer.sprite = ImagesArray[24];
      background_tag = "workshop";
    }
    else if(tags.Contains("cristinas"))
    {
      spriteRenderer.sprite = ImagesArray[25];
      background_tag = "cristinas";
    }
    else if(tags.Contains("crypt"))
    {
      spriteRenderer.sprite = ImagesArray[26];
      background_tag = "crypt";
    }
    else if(tags.Contains("skid_women"))
    {
      spriteRenderer.sprite = ImagesArray[27];
      background_tag = "skid_women";
    }
    else if(tags.Contains("examiners_office"))
    {
      spriteRenderer.sprite = ImagesArray[28];
      background_tag = "examiners_office";
    }
    else if(tags.Contains("elroy_visit"))
    {
      spriteRenderer.sprite = ImagesArray[29];
      background_tag = "elroy_visit";
    }
    else if(tags.Contains("creepy_boy"))
    {
      spriteRenderer.sprite = ImagesArray[30];
      background_tag = "creepy_boy";
    }
    else if(tags.Contains("stillton_corridors"))
    {
      spriteRenderer.sprite = ImagesArray[31];
      background_tag = "stillton_corridors";
    }
    else if(tags.Contains("cristina_first_visit"))
    {
      spriteRenderer.sprite = ImagesArray[32];
      background_tag = "cristina_first_visit";
    }
    else if(tags.Contains("captain"))
    {
      spriteRenderer.sprite = ImagesArray[33];
      background_tag = "captain";
    }
    else if(tags.Contains("court"))
    {
      spriteRenderer.sprite = ImagesArray[34];
      background_tag = "court";
    }
    else if(tags.Contains("statement"))
    {
      spriteRenderer.sprite = ImagesArray[35];
      background_tag = "statement";
    }
    else if(tags.Contains("lobby"))
    {
      spriteRenderer.sprite = ImagesArray[36];
      background_tag = "lobby";
    }
    else if(tags.Contains("hotel_corridor"))
    {
      spriteRenderer.sprite = ImagesArray[37];
      background_tag = "hotel_corridor";
    }
    else if(tags.Contains("hotel_room"))
    {
      spriteRenderer.sprite = ImagesArray[38];
      background_tag = "hotel_room";
    }
    else if(tags.Contains("cafe"))
    {
      spriteRenderer.sprite = ImagesArray[39];
      background_tag = "cafe";
    }
    else if(tags.Contains("portrait"))
    {
      spriteRenderer.sprite = ImagesArray[40];
      background_tag = "portrait";
    }
    else if(tags.Contains("tied"))
    {
      spriteRenderer.sprite = ImagesArray[41];
      background_tag = "tied";
    }
    else if(tags.Contains("henchman"))
    {
      spriteRenderer.sprite = ImagesArray[42];
      background_tag = "henchman";
    }
    else if(tags.Contains("richter_vault"))
    {
      spriteRenderer.sprite = ImagesArray[43];
      background_tag = "richter_vault";
    }
    else if(tags.Contains("black"))
    {
      spriteRenderer.sprite = ImagesArray[44];
      background_tag = "black";
    }
    else if(tags.Contains("mentor"))
    {
      spriteRenderer.sprite = ImagesArray[45];
      background_tag = "mentor";
    }
    else if(tags.Contains("raid"))
    {
      spriteRenderer.sprite = ImagesArray[46];
      background_tag = "raid";
    }
    else if(tags.Contains("aftermath"))
    {
      spriteRenderer.sprite = ImagesArray[47];
      background_tag = "aftermath";
    }
    else if(tags.Contains("newslady"))
    {
      spriteRenderer.sprite = ImagesArray[48];
      background_tag = "newslady";
    }
    else if(tags.Contains("routine"))
    {
      spriteRenderer.sprite = ImagesArray[49];
      background_tag = "routine";
    }
    else if(tags.Contains("master"))
    {
      spriteRenderer.sprite = ImagesArray[50];
      background_tag = "master";
    }
    else if(tags.Contains("masks"))
    {
      spriteRenderer.sprite = ImagesArray[51];
      background_tag = "masks";
    }
    else if(tags.Contains("warehouse"))
    {
      spriteRenderer.sprite = ImagesArray[52];
      background_tag = "warehouse";
    }
    else if(tags.Contains("cave"))
    {
      spriteRenderer.sprite = ImagesArray[53];
      background_tag = "cave";
    }
    else if(tags.Contains("lift"))
    {
      spriteRenderer.sprite = ImagesArray[54];
      background_tag = "lift";
    }
    else if(tags.Contains("ledge"))
    {
      spriteRenderer.sprite = ImagesArray[55];
      background_tag = "ledge";
    }
    else if(tags.Contains("exit"))
    {
      spriteRenderer.sprite = ImagesArray[56];
      background_tag = "exit";
    }
    else if(tags.Contains("men_running"))
    {
      spriteRenderer.sprite = ImagesArray[57];
      background_tag = "men_running";
    }
    else if(tags.Contains("main_exit"))
    {
      spriteRenderer.sprite = ImagesArray[58];
      background_tag = "main_exit";
    }
    else if(tags.Contains("interrogation"))
    {
      spriteRenderer.sprite = ImagesArray[59];
      background_tag = "interrogation";
    }
    else if(tags.Contains("barend"))
    {
      spriteRenderer.sprite = ImagesArray[60];
      background_tag = "barend";
    }
    else if(tags.Contains("t_m"))
    {
      spriteRenderer.sprite = ImagesArray[61];
      background_tag = "t_m";
    }
    else if(tags.Contains("custodian"))
    {
      spriteRenderer.sprite = ImagesArray[62];
      background_tag = "custodian";
    }
    else if(tags.Contains("t_n"))
    {
      spriteRenderer.sprite = ImagesArray[63];
      background_tag = "t_n";
    }
    else if(tags.Contains("trevor"))
    {
      spriteRenderer.sprite = ImagesArray[64];
      background_tag = "trevor";
    }
    else if(tags.Contains("comp"))
    {
      spriteRenderer.sprite = ImagesArray[65];
      background_tag = "comp";
    }
    else if(tags.Contains("elaine"))
    {
      spriteRenderer.sprite = ImagesArray[66];
      background_tag = "elaine";
    }
    else if(tags.Contains("beach"))
    {
      spriteRenderer.sprite = ImagesArray[67];
      background_tag = "beach";
    }
    else if(tags.Contains("cabins"))
    {
      spriteRenderer.sprite = ImagesArray[68];
      background_tag = "cabins";
    }
    else if(tags.Contains("dad"))
    {
      spriteRenderer.sprite = ImagesArray[69];
      background_tag = "dad";
    }
    else if(tags.Contains("mom"))
    {
      spriteRenderer.sprite = ImagesArray[70];
      background_tag = "mom";
    }
    else if(tags.Contains("storm"))
    {
      spriteRenderer.sprite = ImagesArray[71];
      background_tag = "storm";
    }
    else if(tags.Contains("cynthia"))
    {
      spriteRenderer.sprite = ImagesArray[72];
      background_tag = "cynthia";
    }
    else if(tags.Contains("beast"))
    {
      spriteRenderer.sprite = ImagesArray[73];
      background_tag = "beast";
    }
    else if(tags.Contains("bed"))
    {
      spriteRenderer.sprite = ImagesArray[74];
      background_tag = "bed";
    }
    else if(tags.Contains("balcony"))
    {
      spriteRenderer.sprite = ImagesArray[75];
      background_tag = "balcony";
    }
    else if(tags.Contains("bath"))
    {
      spriteRenderer.sprite = ImagesArray[76];
      background_tag = "bath";
    }
    else if(tags.Contains("kitchen"))
    {
      spriteRenderer.sprite = ImagesArray[77];
      background_tag = "kitchen";
    }
    else if(tags.Contains("motel"))
    {
      spriteRenderer.sprite = ImagesArray[78];
      background_tag = "motel";
    }
    else if(tags.Contains("cig"))
    {
      spriteRenderer.sprite = ImagesArray[79];
      background_tag = "cig";
    }
    else if(tags.Contains("oka"))
    {
      spriteRenderer.sprite = ImagesArray[80];
      background_tag = "oka";
    }
    else if(tags.Contains("balcony2"))
    {
      spriteRenderer.sprite = ImagesArray[81];
      background_tag = "balcony2";
    }
    else if(tags.Contains("jazzy"))
    {
      spriteRenderer.sprite = ImagesArray[82];
      background_tag = "jazzy";
    }
    else if(tags.Contains("hologram"))
    {
      spriteRenderer.sprite = ImagesArray[83];
      background_tag = "hologram";
    }
    else if(tags.Contains("palmers_place"))
    {
      spriteRenderer.sprite = ImagesArray[84];
      background_tag = "palmers_place";
    }
    else
    {
      background_tag = "";
    }


    if(saved_background!="" && background_tag!=saved_background)
    {//saves the game each time the background changes.
      autosave.SaveGame();
      saveNotification.gameObject.SetActive(true);
      Invoke("WaittoDisappear",3);
    }
    if(background_tag!=""){saved_background = background_tag;}
    
    spriteRenderer.color = new Color(255f, 255f, 255f, 0.3f);

  }

  void ReloadBackground(string tag_)
  {
    //Reloads the background image when the game starts, after being saved.
    switch(tag_)
    {
      case "first_scene":
        spriteRenderer.sprite = ImagesArray[0];
        break;
      case "ontheroad":
        spriteRenderer.sprite = ImagesArray[1];
        break;
      case "apartment_building":
        spriteRenderer.sprite = ImagesArray[2];
        break;
      case "apartment":
        spriteRenderer.sprite = ImagesArray[3];
        break;
      case "police_station":
        spriteRenderer.sprite = ImagesArray[4];
        break;
      case "hall":
        spriteRenderer.sprite = ImagesArray[5];
        break;
      case "shrink":
        spriteRenderer.sprite = ImagesArray[6];
        break;
      case "terrells":
        spriteRenderer.sprite = ImagesArray[7];
        break;
      case "elaine_street":
        spriteRenderer.sprite = ImagesArray[8];
        break;
      case "richters_home":
        spriteRenderer.sprite = ImagesArray[9];
        break;
      case "uni":
        spriteRenderer.sprite = ImagesArray[10];
        break;
      case "office": 
        spriteRenderer.sprite = ImagesArray[11];
        break;
      case "troys":
        spriteRenderer.sprite = ImagesArray[12];
        break;
      case "rita_dead":
        spriteRenderer.sprite = ImagesArray[13];
        break;
      case "lab":
        spriteRenderer.sprite = ImagesArray[14];
        break;
      case "dayfont":
        spriteRenderer.sprite = ImagesArray[15];
        break;
      case "nightfont":
        spriteRenderer.sprite = ImagesArray[16];
        break;
      case "roseysqr":
        spriteRenderer.sprite = ImagesArray[17];
        break;
      case "carsen":
        spriteRenderer.sprite = ImagesArray[18];
        break;
      case "carsen2":
        spriteRenderer.sprite = ImagesArray[19];
        break;
      case "redholeentr":
        spriteRenderer.sprite = ImagesArray[20];
        break;
      case "backalley":
        spriteRenderer.sprite = ImagesArray[21];
        break;
      case "troyinterior":
        spriteRenderer.sprite = ImagesArray[22];
        break;
      case "park":
        spriteRenderer.sprite = ImagesArray[23];
        break;
      case "workshop":
        spriteRenderer.sprite = ImagesArray[24];
        break;
      case "cristinas":
        spriteRenderer.sprite = ImagesArray[25];
        break;
      case "crypt":
        spriteRenderer.sprite = ImagesArray[26];
        break;
      case "skid_women": 
        spriteRenderer.sprite = ImagesArray[27];
        break;
      case "examiners_office":
        spriteRenderer.sprite = ImagesArray[28];
        break;
      case "elroy_visit":
        spriteRenderer.sprite = ImagesArray[29];
        break;
      case "creepy_boy":
        spriteRenderer.sprite = ImagesArray[30];
        break;
      case "stillton_corridors":
        spriteRenderer.sprite = ImagesArray[31];
        break;
      case "cristina_first_visit":
        spriteRenderer.sprite = ImagesArray[32];
        break;
      case "captain":
        spriteRenderer.sprite = ImagesArray[33];
        break;
      case "court":
        spriteRenderer.sprite = ImagesArray[34];
        break;
      case "statement":
        spriteRenderer.sprite = ImagesArray[35];
        break;
      case "lobby":
        spriteRenderer.sprite = ImagesArray[36];
        break;
      case "hotel_corridor":
        spriteRenderer.sprite = ImagesArray[37];
        break;
      case "hotel_room":
        spriteRenderer.sprite = ImagesArray[38];
        break;
      case "cafe":
        spriteRenderer.sprite = ImagesArray[39];
        break;
      case "portrait":
        spriteRenderer.sprite = ImagesArray[40];
        break;
      case "tied":
        spriteRenderer.sprite = ImagesArray[41];
        break;
      case "henchman":
        spriteRenderer.sprite = ImagesArray[42];
        break;
      case "richter_vault":
        spriteRenderer.sprite = ImagesArray[43];
        break;
      case "black":
        spriteRenderer.sprite = ImagesArray[44];
        break;
      case "mentor":
        spriteRenderer.sprite = ImagesArray[45];
        break;
      case "raid":
        spriteRenderer.sprite = ImagesArray[46];
        break;
      case "aftermath":
        spriteRenderer.sprite = ImagesArray[47];
        break;
      case "newslady":
        spriteRenderer.sprite = ImagesArray[48];
        break;
      case "routine":
        spriteRenderer.sprite = ImagesArray[49];
        break;
      case "master":
        spriteRenderer.sprite = ImagesArray[50];
        break;
      case "masks":
        spriteRenderer.sprite = ImagesArray[51];
        break;
      case "warehouse":
        spriteRenderer.sprite = ImagesArray[52];
        break;
      case "cave":
        spriteRenderer.sprite = ImagesArray[53];
        break;
      case "lift":
        spriteRenderer.sprite = ImagesArray[54];
        break;
      case "ledge":
        spriteRenderer.sprite = ImagesArray[55];
        break;
      case "exit":
        spriteRenderer.sprite = ImagesArray[56];
        break;
      case "men_running":
        spriteRenderer.sprite = ImagesArray[57];
        break;
      case "main_exit":
        spriteRenderer.sprite = ImagesArray[58];
        break;
      case "interrogation":
        spriteRenderer.sprite = ImagesArray[59];
        break;
      case "barend":
        spriteRenderer.sprite = ImagesArray[60];
        break;
      case "t_m":
        spriteRenderer.sprite = ImagesArray[61];
        break;
      case "custodian":
        spriteRenderer.sprite = ImagesArray[62];
        break;
      case "t_n":
        spriteRenderer.sprite = ImagesArray[63];
        break;
      case "trevor":
        spriteRenderer.sprite = ImagesArray[64];
        break;
      case "comp":
        spriteRenderer.sprite = ImagesArray[65];
        break;
      case "elaine":
        spriteRenderer.sprite = ImagesArray[66];
        break;
      case "beach":
        spriteRenderer.sprite = ImagesArray[67];
        break;
      case "cabins":
        spriteRenderer.sprite = ImagesArray[68];
        break;
      case "dad":
        spriteRenderer.sprite = ImagesArray[69];
        break;
      case "mom":
        spriteRenderer.sprite = ImagesArray[70];
        break;
      case "storm":
        spriteRenderer.sprite = ImagesArray[71];
        break;
      case "cynthia":
        spriteRenderer.sprite = ImagesArray[72];
        break;
      case "beast":
        spriteRenderer.sprite = ImagesArray[73];
        break;
      case "bed":
        spriteRenderer.sprite = ImagesArray[74];
        break;
      case "balcony":
        spriteRenderer.sprite = ImagesArray[75];
        break;
      case "bath":
        spriteRenderer.sprite = ImagesArray[76];
        break;
      case "kitchen":
        spriteRenderer.sprite = ImagesArray[77];
        break;
      case "motel":
        spriteRenderer.sprite = ImagesArray[78];
        break;
      case "cig":
        spriteRenderer.sprite = ImagesArray[79];
        break;
      case "oka":
        spriteRenderer.sprite = ImagesArray[80];
        break;
      case "balcony2":
        spriteRenderer.sprite = ImagesArray[81];
        break;
      case "jazzy":
        spriteRenderer.sprite = ImagesArray[82];
        break;
      case "hologram":
        spriteRenderer.sprite = ImagesArray[83];
        break;
      case "palmers_place":
        spriteRenderer.sprite = ImagesArray[84];
        break;

    }


    spriteRenderer.color = new Color(255f, 255f, 255f, 0.3f);
  }

  void CheckForInput(List<string> _tags)
  {
    /*Searches the current story text for instances, where the player 
    needs to insert an input from the keyboard. */
    if(_tags.Contains("Input"))
    {
      input_field.gameObject.SetActive(true);
      leave_input.gameObject.SetActive(true);
      Inventory_Manager.player_writing = true;
      
    }
  } 

   public void CheckSound(List<string> _tags)
  {
    //Searches for tags indicating for changes in the audio source.
    if(_tags.Count>0)
    {
      if(_soundcontroller.themes.Contains(_tags[0]))
      {
        
        
        foreach (var source in _soundcontroller.GetComponentsInChildren<AudioSource>())
        {
            if(source.isPlaying)
            {
              //source.Stop();
              wasplaying = true;
              StartCoroutine(SoundController.AudioHelper.FadeOut(source, 2f));
            }
        }
        
        
        SelectTrack(_tags[0]);
        loadtrack = _tags[0];
        
      }
    }
    
  }

void WaittoDisappear()
{
  //Deactivates certain UI elements when they're not needed.
  saveNotification.gameObject.SetActive(false);
  startNotification.gameObject.SetActive(false);
  xPnotification.gameObject.SetActive(false);
  healthNotification.gameObject.SetActive(false);
}
  void DelayorNot(AudioSource _audio)
  {

    //Manages the smooth transition between changes in the audio.
    backingtrack = _audio;
    if (_audio == _soundcontroller.shot || _audio == _soundcontroller.smack || _audio == _soundcontroller.storm) {backingtrack.loop = false;}
    else {backingtrack.loop = true;}
    if (wasplaying == true)
    {
      backingtrack.PlayDelayed(3f);
      wasplaying = false;
    }
    else {backingtrack.Play();}

  }

  void SelectTrack(string _track)
  {
    //Selects the appropriate audio tag.
     switch(_track)
          {
              case "old_city":
                DelayorNot(_soundcontroller.main_theme);
                break;
            
              case "pixel_river":
                DelayorNot(_soundcontroller.second_theme);
                break;

              case "jazz_1":
                DelayorNot(_soundcontroller.jazz_1);
                break;

              case "worried_crowd":
                DelayorNot(_soundcontroller.worried_crowd);
                break;

              case "dream":
                DelayorNot(_soundcontroller.dream);
                break;

              case "shot":
                DelayorNot(_soundcontroller.shot);
                break;
              case "news":
                DelayorNot(_soundcontroller.news);
                break;
              case "fight":
                DelayorNot(_soundcontroller.fight);
                break;
              case "caught":
                DelayorNot(_soundcontroller.caught);
                break;
              case "bar":
                DelayorNot(_soundcontroller.bar);
                break;
              case "crypt":
                DelayorNot(_soundcontroller.crypt);
                break;
              case "smack":
                DelayorNot(_soundcontroller.smack);
                break;
              case "tiedup":
                DelayorNot(_soundcontroller.tiedup);
                break;
              case "boss":
                DelayorNot(_soundcontroller.boss);
                break;
              case "cynth":
                DelayorNot(_soundcontroller.cynth);
                break;
              case "storm":
                DelayorNot(_soundcontroller.storm);
                break;
              case "pressure":
                DelayorNot(_soundcontroller.pressure);
                break;
              case "hotel":
                DelayorNot(_soundcontroller.hotel);
                break;
              case "flirty":
                DelayorNot(_soundcontroller.flirty);
                break;
              case "heroic":
                DelayorNot(_soundcontroller.heroic);
                break;
              case "justice":
                DelayorNot(_soundcontroller.justice);
                break;
              case "terrell":
                DelayorNot(_soundcontroller.terrell);
                break;
              case "rosey":
                DelayorNot(_soundcontroller.rosey);
                break;
              case "hole":
                DelayorNot(_soundcontroller.hole);
                break;
              case "alley":
                DelayorNot(_soundcontroller.alley);
                break;

              default:
                break;
          }

  }

  public void ClearInputField()
  {
    Destroy(_textField.gameObject);
    if(_textField2) {Destroy(_textField2.gameObject);}
    DisplayNextLines();
    input_field.text = "";
    input_field.gameObject.SetActive(false);
    leave_input.gameObject.SetActive(false);
  }

  void XpPopUp()
  {
    //Notifies the player, whenever they earn XP points.
    if ((int) _story.variablesState["XP"] > xp_points)
    {
      xPnotification.gameObject.SetActive(true);
      Invoke("WaittoDisappear",5);
      xp_points = (int) _story.variablesState["XP"];
    }

  }

  void HealthPopUp()
  {
    //Notifies the player, whenever the health status changes.
    if ((int) _story.variablesState["HP"] > health_value)
    {
      Color newColor;
      healthNotification.gameObject.SetActive(true);
      if (ColorUtility.TryParseHtmlString("#00FF9A", out newColor))
        {
            healthNotification.color = newColor; // Set the text color
        }
      healthNotification.text = "Health restored.";
    }
    else if((int) _story.variablesState["HP"] < health_value)
    {
      healthNotification.gameObject.SetActive(true);
      healthNotification.color = Color.red;
      healthNotification.text = "Health decreased.";
    }
    Invoke("WaittoDisappear",6);
    health_value = (int) _story.variablesState["HP"];
  }

  public void ReturnFromInput()
  {
    /*Redirects the player between .ink story stitches
    whenever the player input comes outside of the scope of the .ink story flow*/
    string currentPath =  _story.state.currentPathString;
    
    string[] pathParts = currentPath.Split('.');
    string stitchName = pathParts[0];

    switch(stitchName)
    {
      case "try_open_box":
        _story.ChoosePathString("side_activity");
        break;

      default:
        _story.ChoosePathString("tryout");
        break;

    }

    ClearInputField();
    
  }


  
  void Start()
  {
    //Sets certain elements accordingly for the start of the story.
    leave_input.onClick.AddListener(() => ReturnFromInput());
    input_field.gameObject.SetActive(false);
    leave_input.gameObject.SetActive(false);
    saveNotification.gameObject.SetActive(false);
    
    StartStory();
  }

  private void StartStory()
  {
    //Obtain the story file in the JSON format.
     _story = new Story(_inkJsonAsset.text);

     _story.onError += (msg, type) => {
    if( type == Ink.ErrorType.Warning )
        Debug.LogWarning(msg);
    else
        Debug.LogError(msg);
    };
    
      if (!string.IsNullOrEmpty(_loadedState))
      {
        /*In case of loading a pre-existing saved game,
        sets the objects in the state they were in, right before the save. */
        spriteRenderer = GetComponent<SpriteRenderer>();
        ReloadBackground(_sprite);
        background_tag = _sprite;
        
        _story?.state?.LoadJson(_loadedState); //Loads the saved story state.

        decoyState = _loadedState; //stores the loaded state of the story into a new variable, for quick calculations.
        xp_points = (int) _story.variablesState["XP"];
        health_value = (int) _story.variablesState["HP"];
      
      }
      
      else
      {
        startNotification.gameObject.SetActive(true);
        Invoke("WaittoDisappear",8);
        xp_points = (int) _story.variablesState["XP"];
        health_value = (int) _story.variablesState["HP"];
      }
      DisplayNextLines(); //Starts the game flow.
     
  }



  TMP_Text SetTextFont(string textfont, TMP_Text _field)
  {
    /*Reads the text tag and sets the text font, according
    to the current style of speech in the story*/
    switch(textfont)
    {
      case "Thought":
        _field = Instantiate(noahPrefab) as TMP_Text;
        break;

      case "Conv":
        _field = Instantiate(convPrefab) as TMP_Text;
        break;

      default:
        _field = Instantiate(narratorPrefab) as TMP_Text;
        //tags[0] = "Narration";
        break;
    }
    return _field;
  }
  

  public void DisplayNextLines()
  {
    /*Reads the story file and displays
    the next chunk of the story in the upper side of the UI*/ 

    timesvisiteddisplay++;

    Canvas canvas = (Canvas)GameObject.FindObjectOfType(typeof(Canvas));
    
    
    if (!string.IsNullOrEmpty(_loadedState))
    {
      text = loadedtext;
      text = text?.Trim();
      _loadedState = null;
      if(!string.IsNullOrEmpty(loadedtrack)) {loadtrack = loadedtrack;}
      SelectTrack(loadedtrack);
      tags = _story.currentTags;
      
    
    }

   

    else if (_story.canContinue)
    {
      
      text = _story.Continue();



       // gets next line
      text = text?.Trim(); // removes white space from text
      tags = _story.currentTags;
      if(tags.Contains("background"))
      {
        Adjust();
      }
      CheckSound(tags);
      CheckForInput(tags);
      XpPopUp();
      HealthPopUp();

      
    }
      

   if(tags.Count<=0 || !dialogue_styles.Contains(tags[0])) {tags.Insert(0,"Narration");}

   if (decoyState != null && timesvisiteddisplay < 2)
   {
    tags[0] = loadedfont;
   }

   

   
    switch(tags[0])
    {
      case "Thought":
        _textField = Instantiate(noahPrefab) as TMP_Text;
        break;

      case "Conv":
        _textField = Instantiate(convPrefab) as TMP_Text;
        break;
        
      default:
        _textField = Instantiate(narratorPrefab) as TMP_Text;
        break;
    }


    _savedfont = keepfont = tags[0];
    
  
   /*If more text can be displayed, WriteMoreLines is called to display
   the next chunk of text in the lower side of the UI.
   If choices need to be displayed or the story meets an end,
   DisplayButtons is called to generate the according buttons. */

    if (!(_story.canContinue) && string.IsNullOrEmpty(loadedtext2)) {StartCoroutine(TypeWriterText(DisplayButtons));}
    else {StartCoroutine(TypeWriterText(WriteMoreLines));}
    
    /*A coroutine that manages creating a typewriter visual effect
    and when this action is completed, calls the next method that's needed next*/
    IEnumerator TypeWriterText(Action action)
    {
      _textField.text = leadingCharBeforeDelay ? leadingChar : "";
      yield return new WaitForSeconds(delayBeforeStart);
      foreach (char c in text)
		  {
			  if (_textField.text.Length > 0)
			  {
				  _textField.text = _textField.text.Substring(0, _textField.text.Length - leadingChar.Length);
			  }
			  _textField.text += c;
			  _textField.text += leadingChar;
        if (c == ' ' && ( previous == '!'|| previous == '.' || previous == '?')) {timeBtwChars = 0.8f;}
			  yield return new WaitForSeconds(timeBtwChars);
        previous = c;
        timeBtwChars = 0.03f;
		  }
      if(leadingChar != "")
      {
			  _textField.text = _textField.text.Substring(0, _textField.text.Length - leadingChar.Length);
		  }
      
      action();


   
    }
    
    
    _textField.transform.position = p;
    _textField.transform.SetParent(_textContainer.transform, false);
    

    void WriteMoreLines()
    {
      

      if(timesvisiteddisplay == 1 && decoyState != null)
      {
        text = loadedtext2;
        
        text = loadedtext2;
        loadedtext2 = null;
        text = text?.Trim();
        timesvisiteddisplay = 0;
        
        
        
      }
      
      else
      {
        
        text = _story.Continue(); // gets next line


        text = text?.Trim(); // removes white space from text
      }
      
      
      
      tags2 = _story.currentTags;
      if(tags2.Contains("background"))
      {
        Adjust();
      }
      CheckSound(tags2);
      CheckForInput(tags2);
      XpPopUp();
      HealthPopUp();
      

      if(tags2.Count<=0 || !dialogue_styles.Contains(tags2[0])) {tags2.Insert(0,"Narration");}

      if (decoyState != null && timesvisiteddisplay < 2)
      {
        tags2[0] = loadedfont2;
        decoyState = null;
      }

      switch(tags2[0])
      {
        case "Thought":
          _textField2 = Instantiate(noahPrefab) as TMP_Text;
          break;

        case "Conv":
          _textField2 = Instantiate(convPrefab) as TMP_Text;
          break;
          
        default:
          _textField2 = Instantiate(narratorPrefab) as TMP_Text;
          //tags[0] = "Narration";
          break;
      }
     

      _savedfont2 = keepfont2 = tags2[0];
      
      
      task.Wait();
     
      StartCoroutine(TypeWriterText(DisplayButtons));
      IEnumerator TypeWriterText(Action action)
      {
        _textField2.text = leadingCharBeforeDelay ? leadingChar : "";
        yield return new WaitForSeconds(delayBeforeStart);
        foreach (char c in text)
        {
          if (_textField2.text.Length > 0)
          {
            _textField2.text = _textField2.text.Substring(0, _textField2.text.Length - leadingChar.Length);
          }
          _textField2.text += c;
          _textField2.text += leadingChar;
          if (c == ' ' && ( previous == '!'|| previous == '.' || previous == '?')) {timeBtwChars = 0.8f;}
          yield return new WaitForSeconds(timeBtwChars);
          previous = c;
          timeBtwChars = 0.03f;
        }
        if(leadingChar != "")
        {
          _textField2.text = _textField2.text.Substring(0, _textField2.text.Length - leadingChar.Length);
        }
        
        action();


    
      }
      
      
       
      if(_textField2)
      { 
       
       
        Vector2 q = _textField.GetComponent<RectTransform>().sizeDelta;
        Vector3 vec3 = new Vector3(_textField.transform.position.x,_textField.transform.position.y-q[1]/2,_textField.transform.position.z);
      
      
        _textField2.transform.SetParent(_textContainer.transform, false);
        _textField2.transform.position = vec3 + new Vector3(0,-50,0) ;
        
        
      }
      
      
    }
    

    void DisplayButtons()
    {
      /*After all current text has been displayed,
      DisplayButtons checks whether story choices need to be implemented (it also creates a single choice
      when the story ends), or an keyboard input field is needed. */
      storybackup = _story;
      task.Wait();
      //Thread.Sleep(400);
      if(_story.canContinue)
      {
        if(!tags.Contains("Input") && !tags2.Contains("Input"))
        {
          _nextButton = CreateNextButton(canvas);
          _nextButton.onClick.AddListener(() => NextClick(_nextButton,canvas));
        }
      }
       
        
      
      else
      {
        DisplayChoices();
      }
      //if(_textField3) {Destroy(_textField3.gameObject);}

    }
  
  
    
    
  }

  
  

  public void DisplayChoices()
  {
    
    // checks if choices are already being displayed
    if (_choiceButtonContainer.GetComponentsInChildren<Button>().Length > 0) return;

    if(_story.currentChoices.Count == 0)
    {
      task.Wait();
      endButton.gameObject.SetActive(true);
      endButton.onClick.AddListener(() => UnityEngine.SceneManagement.SceneManager.LoadScene("MainMenu"));
    }
    for (int i = 0; i < _story.currentChoices.Count; ++i) // iterates through all choices
    {

      var choice = _story.currentChoices[i];
      var button = CreateChoiceButton(choice.text); // creates a choice button

      button.onClick.AddListener(() => OnClickChoiceButton(choice));
      
    }
    buttons = _choiceButtonContainer.GetComponentsInChildren<Button>();
    choicesdisplayed = true;


  }

  Button CreateNextButton(Canvas _canvas)
  {
    /*Creates a button, which leads to the next one or two chunks
    being presented (before the story meets set of choices). */
    var nextButton = Instantiate(_nextButtonPrefab);
    nextButton.transform.SetParent(_canvas.transform, false);
    return nextButton;
  }

  void NextClick(Button _button, Canvas _canvas)
  {
    //Resets the UI elements, when the player clicks on the 'Next' button.
	  _soundcontroller.click_sound.Play();
    Destroy(_textField.gameObject);
    if(_textField2) {Destroy(_textField2.gameObject);}
    Destroy(_button.gameObject);
    DisplayNextLines();
  }

  Button CreateChoiceButton(string text)
  {
      // creates the button from a prefab
    var choiceButton = Instantiate(_choiceButtonPrefab);
    choiceButton.transform.SetParent(_choiceButtonContainer.transform, false);
  
      // sets text on the button
    var buttonText = choiceButton.GetComponentInChildren<TMP_Text>();
    buttonText.text = text;

    return choiceButton;

    
    
  }

  void OnClickChoiceButton(Choice choice)
  {
    _story.ChooseChoiceIndex(choice.index);// tells ink which choice was selected
    
    _soundcontroller.click_sound.Play();
    RefreshChoiceView2(); // removes choices from the screen
  
    DisplayNextLines();

    
    

  }

  void RefreshChoiceView()
  {
    //clears the UI after the click of a choice button.
    if (_choiceButtonContainer != null)
    {
      num = 0;
      foreach (var button in _choiceButtonContainer.GetComponentsInChildren<Button>())
      {
        num++;
        Destroy(button.gameObject);
      }
      if(num>1)
      {
        Destroy(_textField.gameObject);
        

      }
      
    }
    Destroy(_textField.gameObject);
    
    
  }

  public void RefreshChoiceView2()
  {
    if (_choiceButtonContainer != null)
    {
      foreach (var button in _choiceButtonContainer.GetComponentsInChildren<Button>())
      {
        Destroy(button.gameObject);
      }
      
    }
    Destroy(_textField.gameObject);
    if(_textField2) {Destroy(_textField2.gameObject);}
    
    choicesdisplayed = false;
  }

  public string GetStoryState()
  {

    return _story.state.ToJson();
  }

  public void ReadString()
  {
    /*Checks whether the player's keyboard input was correct
    and redirects them to the appropriate story path. */
      input = input_field.text;
      Debug.Log(input);
      
      if(Input.GetKeyDown(KeyCode.Return))
      {
          if(input == "2239" && (int) _story.variablesState["state"] == 2)
          {
              _story.ChoosePathString("try_open_box.unlocked_box");
              ClearInputField();
              
          }
          
        
          Inventory_Manager.player_writing = false;
      }
  } 

    // Update is called once per frame
  void Update()
  {
  
    


   
  }



  void Awake()

  {
    if (_inkJsonAsset == null)
      {
          Debug.LogError("Ink file not assigned!");
          return;
      }
    try
          {
              // Compile the Ink story from the text asset
              var compiler = new Ink.Compiler(_inkJsonAsset.text);

              _story = compiler.Compile();
              // Optionally log the first line or some other part of the story
              Debug.Log(_story.Continue());
          }
          catch (System.Exception e)
          {
              Debug.LogError("Error compiling Ink story: " + e.Message);
          }

    //Sets the background images.
    float cameraHeight = Camera.main.orthographicSize * 2;
    Vector2 cameraSize = new Vector2(Camera.main.aspect * cameraHeight, cameraHeight);
    Vector2 spriteSize = ImagesArray[1].bounds.size;
    Vector2 scale = transform.localScale;
    if (cameraSize.x >= cameraSize.y) { // Landscape (or equal)
        scale *= cameraSize.x / spriteSize.x;
    } else { // Portrait
        scale *= cameraSize.y / spriteSize.y;
    }
    transform.position = Vector2.zero; // Optional
    transform.localScale = scale;


    
    
  }
  
}
