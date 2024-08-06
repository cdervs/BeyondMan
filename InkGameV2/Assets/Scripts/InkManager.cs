using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using UnityEngine.SceneManagement;
using TMPro;
using System.Threading;
using System;
using System.IO;
using UnityEngine.EventSystems;

public class InkManager : MonoBehaviour 
{
  
  [SerializeField]
  public SoundController _soundcontroller;

  public TMP_InputField input_field;
  public Button leave_input;
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
  {
    _loadedState = state;
    loadedfont = _loadedfont;
    loadedfont2 = _loadedfont2;
    loadedtext = textload;
    loadedtext2 = textload2;
    loadedtrack = trackload;
    _sprite = _renderer;
    
   
  }

  void Adjust()
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
    else if(tags.Contains("carsen"))
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
    
    
    
    saved_background = background_tag;
    spriteRenderer.color = new Color(255f, 255f, 255f, 0.3f);

  }

  void ReloadBackground(string tag_)
  {
    if(tag_ == "first_scene") {spriteRenderer.sprite = ImagesArray[0];}
    else if(tag_ == "ontheroad") {spriteRenderer.sprite = ImagesArray[1];}
    else if(tag_ == "apartment_building") {spriteRenderer.sprite = ImagesArray[2];}
    else if(tag_ == "apartment") {spriteRenderer.sprite = ImagesArray[3];}
    else if(tag_ == "police_station") {spriteRenderer.sprite = ImagesArray[4];}
    else if(tag_ == "hall") {spriteRenderer.sprite = ImagesArray[5];}
    else if(tag_ == "hall") {spriteRenderer.sprite = ImagesArray[5];}
    else if(tag_ == "hall") {spriteRenderer.sprite = ImagesArray[5];}
    else if(tag_ == "hall") {spriteRenderer.sprite = ImagesArray[5];}
    else if(tag_ == "hall") {spriteRenderer.sprite = ImagesArray[5];}
    else if(tag_ == "hall") {spriteRenderer.sprite = ImagesArray[5];}
    else if(tag_ == "hall") {spriteRenderer.sprite = ImagesArray[5];}
    else if(tag_ == "troys") {spriteRenderer.sprite = ImagesArray[12];}
    else if(tag_ == "rita_dead") {spriteRenderer.sprite = ImagesArray[13];}
    else if(tag_ == "lab") {spriteRenderer.sprite = ImagesArray[14];}
    else if(tag_ == "dayfont") {spriteRenderer.sprite = ImagesArray[15];}
    else if(tag_ == "nightfont") {spriteRenderer.sprite = ImagesArray[16];}
    
    


    spriteRenderer.color = new Color(255f, 255f, 255f, 0.3f);
  }

  void CheckForInput(List<string> _tags)
  {
    if(_tags.Contains("Input"))
    {
      input_field.gameObject.SetActive(true);
      leave_input.gameObject.SetActive(true);
      Inventory_Manager.player_writing = true;
      
    }
  } 

   public void CheckSound(List<string> _tags)
  {
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


  void DelayorNot(AudioSource _audio)
  {
    backingtrack = _audio;
    backingtrack.loop = true;
    if (wasplaying == true)
    {
      backingtrack.PlayDelayed(3f);
      wasplaying = false;
    }
    else {backingtrack.Play();}

  }

  void SelectTrack(string _track)
  {
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

  public void ReturnFromInput()
  {
    string currentPath =  _story.state.currentPathString;
    //if(_story.canContinue) {Debug.Log("It can");}
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
  

  /*AudioSource SetTrack(string _track)
  {
    switch(_track)
          {
              case "old_city":
                b_track = _soundcontroller.main_theme;
                break;
            
              case "pixel_river":
                b_track = _soundcontroller.second_theme;
                break;
                              
              default:
                break;
          }
      return b_track;
  }
  */


  
  void Start()
  {
    //if(scene.name == "MainScene") {StartStory();}
    leave_input.onClick.AddListener(() => ReturnFromInput());
    input_field.gameObject.SetActive(false);
    leave_input.gameObject.SetActive(false);
    saveNotification.gameObject.SetActive(false);
    
    StartStory();
  }

  private void StartStory()
  {
    
     _story = new Story(_inkJsonAsset.text);
    
      if (!string.IsNullOrEmpty(_loadedState))
      {
        //SelectTrack(loadedtrack);
        spriteRenderer = GetComponent<SpriteRenderer>();
        ReloadBackground(_sprite);
        background_tag = _sprite;
        
        _story?.state?.LoadJson(_loadedState);

        decoyState = _loadedState; //stores the loaded state of the story into a new variable
      
        //_loadedState = null;
      }
      //_textField = Instantiate(narratorPrefab) as TMP_Text;
      
      DisplayNextLines();
     

  }

  

  /*public void DisplayAfterInventory()
  {

    Canvas canvas = (Canvas)GameObject.FindObjectOfType(typeof(Canvas));
    loadtrack = loadtrack2;
    SelectTrack(loadtrack);
    spriteRenderer = GetComponent<SpriteRenderer>();
    ReloadBackground(background_tag);
    saved_background = background_tag;
    spriteRenderer.color = new Color(255f, 255f, 255f, 0.3f);
    text = textholder1;
    text = text?.Trim();
    //_textField = InventoryManager.textprefab1;
    _textField = Instantiate(noahPrefab) as TMP_Text;
    tags[0] = _savedfont = keepfont;
    _textField = SetTextFont(tags[0],_textField);
    _textField.text = text;
    _textField.transform.position = p;
    _textField.transform.SetParent(canvas.transform, false);
    if(textholder2 != "")
    {
      text = textholder2;
      text = text?.Trim();
       _textField2 = Instantiate(noahPrefab) as TMP_Text;
       tags2[0] = _savedfont2 = keepfont2;
       if(tags.Contains("Input") || tags2.Contains("Input")) {input_field.gameObject.SetActive(true);}
      _textField2 = SetTextFont(tags2[0],_textField2);
      //_textField2 = InventoryManager.textprefab2;
      _textField2.text = text;
      textholder2 = "";
      Vector2 q = _textField.GetComponent<RectTransform>().sizeDelta;
      Vector3 vec3 = new Vector3(_textField.transform.position.x,_textField.transform.position.y-q[1]/2,_textField.transform.position.z);
      _textField2.transform.SetParent(canvas.transform, false);
      _textField2.transform.position = vec3 + new Vector3(0,-50,0) ;
    }
    
    //_textField2.text = text;
    DisplayButtons2(canvas);


  }
  */

  TMP_Text SetTextFont(string textfont, TMP_Text _field)
  {
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
      
    }

   

   

   if(tags.Count<=0 || !dialogue_styles.Contains(tags[0])) {tags.Insert(0,"Narration");}

   if (decoyState != null && timesvisiteddisplay < 2)
   {
    tags[0] = loadedfont;
   }

   

    //SetTextFont(tags[0],_textField);
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
    
  
    //_textField2 = Instantiate(noahPrefab) as TMP_Text;
    //_textField2.text = "";
    
    if (!_story.canContinue && string.IsNullOrEmpty(loadedtext2)) {StartCoroutine(TypeWriterText(DisplayButtons));}
    else {StartCoroutine(TypeWriterText(WriteMoreLines));}
    
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
        timeBtwChars = 0.02f;
		  }
      if(leadingChar != "")
      {
			  _textField.text = _textField.text.Substring(0, _textField.text.Length - leadingChar.Length);
		  }
      
      action();


   
    }
    
    
      //_textField.text = text; // displays new text
    _textField.transform.position = p;
    _textField.transform.SetParent(_textContainer.transform, false);
    //WriteLines(_textField2, canvas, false);

    void WriteMoreLines()
    {
      

      if(timesvisiteddisplay == 1 && decoyState != null)
      {
        
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
      CheckSound(tags2);
      CheckForInput(tags2);
      

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
      //SetTextFont(tags2[0],_textField2);
     

      _savedfont2 = keepfont2 = tags2[0];
      
      

      Thread.Sleep(400);
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
          timeBtwChars = 0.02f;
        }
        if(leadingChar != "")
        {
          _textField2.text = _textField2.text.Substring(0, _textField2.text.Length - leadingChar.Length);
        }
        
        action();


    
      }
      
      
        //_textField.text = text; // displays new text
      if(_textField2)
      { 
        //p = GameObject.Find("_textField").transform.position;
        //_textField.GetComponent<RectTransform>().offsetMin
        Vector2 q = _textField.GetComponent<RectTransform>().sizeDelta;
        Vector3 vec3 = new Vector3(_textField.transform.position.x,_textField.transform.position.y-q[1]/2,_textField.transform.position.z);
        //Vector3 q = _textField.transform.position;
        //Vector2 vec2 = _textField.GetComponent<RectTransform>().anchoredPosition;
        //Vector3 vec3 = vec2;
        //_textField.GetComponent<RectTransform>().GetLocalCorners(z);
        _textField2.transform.SetParent(_textContainer.transform, false);
        _textField2.transform.position = vec3 + new Vector3(0,-50,0) ;
        
        
        //_textField2.transform.position = _textField.transform.position + new Vector3(0,-200,0) ;
        
      }
      //WriteLines(_textField2, canvas, false);
      
    }

    void DisplayButtons()
    {
      
      storybackup = _story;
      Thread.Sleep(400);
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

  /*void DisplayButtons2(Canvas _canvas)
    {
      
      
      
      if(_story.canContinue)
      {
        _nextButton = CreateNextButton(_canvas);
        _nextButton.onClick.AddListener(() => NextClick(_nextButton,_canvas));
         
      }
       
        
      
      else
      {
        DisplayChoices();
      }

    }
    */
    
  

  public void DisplayChoices()
  {
    //Vector2 og_size = _choiceButtonPrefab.GetComponent<RectTransform>().sizeDelta;
    // checks if choices are already being displaye
    if (_choiceButtonContainer.GetComponentsInChildren<Button>().Length > 0) return;
    

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
    var nextButton = Instantiate(_nextButtonPrefab);
    nextButton.transform.SetParent(_canvas.transform, false);
    return nextButton;
  }

  void NextClick(Button _button, Canvas _canvas)
  {
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
    //_soundcontroller.click_sound.volume = 0.2f;
    _soundcontroller.click_sound.Play();
    RefreshChoiceView2(); // removes choices from the screen
  
    DisplayNextLines();

    
    

  }

  void RefreshChoiceView()
  {
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
        //if(_textField2) {Destroy(_textField2.gameObject);}

      }
      
    }
    Destroy(_textField.gameObject);
    //if(_textField2) {Destroy(_textField2.gameObject);}
    
    
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
      input = input_field.text;
      Debug.Log(input);

      

      //Debug.Log(input);
      if(Input.GetKeyDown(KeyCode.Return))
      {
          if(input == "2239" && (int) _story.variablesState["state"] == 2)
          {
              _story.ChoosePathString("try_open_box.unlocked_box");
              ClearInputField();
              /*
              Destroy(_textField.gameObject);
              if(_textField2) {Destroy(_textField2.gameObject);}
              DisplayNextLines();
              input_field.text = "";
              input_field.gameObject.SetActive(false);
              leave_input.GameObject.SetActive(false);
              */
              
          }
          
          /*else
          {
            _story.variablesState["string_example"] = input;
            _story.ChoosePathString("tryout3");
            Destroy(_textField.gameObject);
            if(_textField2) {Destroy(_textField2.gameObject);}
            DisplayNextLines();
            input_field.text = "";
            input_field.gameObject.SetActive(false);

          }
          */
          
          Inventory_Manager.player_writing = false;
      }
  } 

    // Update is called once per frame
  void Update()
  {
    
    //CheckSound(tags);
    /*if(_nextButton && !Inventory_Manager.isActive) 
    {
      //Canvas canvas = (Canvas)GameObject.FindObjectOfType(typeof(Canvas));
      //NextClick(_nextButton,canvas);
      _nextButton.onClick.Invoke();
    }
    */
    


    /*if((Input.GetKeyDown(KeyCode.I)||Input.GetKeyDown(KeyCode.M)||Input.GetKeyDown(KeyCode.P)) && (_nextButton||choicesdisplayed))
    {
      storybackup = _story;
      textholder1 = _textField.text;
      textprefab1 = _textField;
      if(_textField2)
      {
        textholder2 = _textField2.text;
        textprefab2 = _textField2;
      }
      loadtrack2 = loadtrack;
      //DontDestroyOnLoad(backingtrack.transform.root);
      
      if(Input.GetKeyDown(KeyCode.I)) {UnityEngine.SceneManagement.SceneManager.LoadScene("InventoryScene");}
      else if(Input.GetKeyDown(KeyCode.M))
      {
        UnityEngine.SceneManagement.SceneManager.LoadScene("PauseMenu");
      }
      else if(Input.GetKeyDown(KeyCode.P))
      {
        UnityEngine.SceneManagement.SceneManager.LoadScene("Profiles");
      }

      

    }
    */
    


   
  }



  void Awake()
  {
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
