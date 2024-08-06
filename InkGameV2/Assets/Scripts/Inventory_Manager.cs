using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using System.Threading;
using System;

public class Inventory_Manager : MonoBehaviour
{

    //bool dariaphoto, shell, cross, bathwine, wine = false;

    int handy_, versed_, stealthy, rhetor, observant_;
    public static bool isActive = false;

    public static bool player_writing = false;

    public GameObject inventoryPanel;

    public GameObject descriptionPanel;

    public GameObject statementPanel;

    public GameObject profilePanel;

    public GameObject attributePanel, moreXPpanel;

    public TMP_Text skillset, moreXPtext, xpDisplay;

    public GridLayoutGroup avatarContainer;

    public VerticalLayoutGroup statementContainer;

    public VerticalLayoutGroup evidenceContainer;

    public string money;

    //public static bool inventory_loaded;
    

    //[SerializeField] SoundController sound_controller;
    [SerializeField] private GridLayoutGroup _inventoryContainer;

    [SerializeField]

    //Button new_button;

    public Button _dariabutton, _shellbutton, _crossbutton, moneybutton, _winebutton;
    // Start is called before the first frame update
    void Start()
    {
        //inventoryPanel = GameObject.Find("ManageInventory");
        inventoryPanel.SetActive(false);
        //var money_button = Instantiate(moneybutton) as Button;
        //money_button.transform.SetParent(_inventoryContainer.transform, false);
        
        //money_button.onClick.AddListener(() => descriptionPanel.SetActive(true));

        descriptionPanel.SetActive(false);
        profilePanel.SetActive(false);
        attributePanel.SetActive(false);
        statementPanel.SetActive(false);
        //Canvas canvas = (Canvas)GameObject.FindObjectOfType(typeof(Canvas));
        //message = Instantiate(message_pfb) as TMP_Text;
        //message.transform.SetParent(canvas.transform, false);
        //Vector3 p = new Vector3(1300,600,0);
        //message.transform.position = p;
        //_inventoryContainer.transform.SetParent(canvas.transform, false);
        //anager = FindObjectOfType<InkManager>();
        
       
        //ink_manager = FindObjectOfType<InkManager>();
        //if(ink_manager) {Debug.Log("good");}
        //if (ink_manager) {Debug.Log("good");}
        

        foreach (Transform child in _inventoryContainer.transform)
        {
            if((child.gameObject.name!="money")) {child.gameObject.SetActive(false);}
        }
        
    }

     public void OpenDescription(string name)
        {
            var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
            switch(name)
            {
                case "money":
                    _text.text = "Your current balance is " + money + " meridians.";
                    break;
                case "photo":
                    _text.text = "A picture of Daria Kozlov.";
                    break;
                case "shell":
                    _text.text = "The second bullet shell that was found beside the bed.";
                    break;
                case "cross":
                    _text.text = "Claudia's cross pendant.";
                    break;
                case "claudia_wine_sample":
                    _text.text = "The wine sample taken from the broken glass in the bathroom.";
                    break;
                case "cristina_wine_sample":
                    _text.text = "The wine sample taken from the bottle in the kitchen.";
                    break;
                case "bible":
                    _text.text = "The bible that was found on Claudia's nightstand. There is a marked page with a highlighted phrase : 'You shall love your neighbour as yourself'. ";
                    break;
                case "elaines_box":
                    _text.text = "The mystery box that Elaine Bronson allegedly got from Claudia. Opening it requires a password.";
                    break;
                case "tracker":
                     _text.text = "Troy Berkins' device. It can be used to extract sensitive data.";
                     break;
                case "red_pill":
                    _text.text = "One of the red pills from Maxwell Richter's office.";
                    break;
                case "clip":
                     _text.text = "A paperclip found in professor Richter's office. Seems trivial, but could be useful in unexpected ways.";
                     break;
                
                
                default:
                    break;
            }
            descriptionPanel.SetActive(true);
        }

    public void GoBack()
    {
        //tracktorepeat = InkManager.loadtrack2;
        inventoryPanel.SetActive(false);
        profilePanel.SetActive(false);
        attributePanel.SetActive(false);
        statementPanel.SetActive(false);
        
        isActive = false;
    }

    public void CloseDescription()
    {
        descriptionPanel.SetActive(false);
    }

    // Update is called once per frame

    void DisplayAttributes()
    {
        attributePanel.SetActive(true);
        moreXPpanel.SetActive(false);
        isActive = true;

        var xp = (int) InkManager.storybackup.variablesState["XP"];
        xpDisplay.text = "XP: " + xp;


        var attributes = GameObject.Find("AttributeText").GetComponent<TMP_Text>();

        var audacity = (int) InkManager.storybackup.variablesState["audacious"]; 
        var analytical = InkManager.storybackup.variablesState["analytical"];
        var sly = InkManager.storybackup.variablesState["sly"];
        var empathy = InkManager.storybackup.variablesState["empathetic"];
        var rogue = InkManager.storybackup.variablesState["rogue"];

        attributes.text = "Audacious: " + audacity + "\n" + "Analytical: "
        + analytical + "\n" + "Sly: " + sly + "\n" + "Empathetic: " + empathy
        + "\n" + "Rogue: " + rogue;

        skillset = GameObject.Find("SkillsetText").GetComponent<TMP_Text>();

        handy_ = (int) InkManager.storybackup.variablesState["handyman"];
        versed_ = (int) InkManager.storybackup.variablesState["versed"];
        stealthy = (int) InkManager.storybackup.variablesState["stealthy"];
        rhetor = (int) InkManager.storybackup.variablesState["rhetor"];
        observant_ = (int) InkManager.storybackup.variablesState["observant"];

        skillset.text = "Handyman: " + handy_ + "\n" + "Versed: "
        + versed_ + "\n" + "Stealthy: " + stealthy + "\n" + "Rhetor: " + rhetor + "\n" + "Observant: " + observant_; 
        



    }

    public void SpendXP(string skill_)
    {
        var xp = (int) InkManager.storybackup.variablesState["XP"];
        if(xp >= 100)
        {
            var newval = (int) InkManager.storybackup.variablesState[skill_] + 1;
            InkManager.storybackup.variablesState[skill_] = newval;

            handy_ = (int) InkManager.storybackup.variablesState["handyman"];
            versed_ = (int) InkManager.storybackup.variablesState["versed"];
            stealthy = (int) InkManager.storybackup.variablesState["stealthy"];
            rhetor = (int) InkManager.storybackup.variablesState["rhetor"];
            observant_ = (int) InkManager.storybackup.variablesState["observant"];

            skillset.text = "Handyman: " + handy_ + "\n" + "Versed: "
            + versed_ + "\n" + "Stealthy: " + stealthy + "\n" + "Rhetor: " + rhetor + "\n" + "Observant: " + observant_;
            xp -= 100;
            InkManager.storybackup.variablesState["XP"] = xp;
            xpDisplay.text = "XP: " + xp;
        }
        else
        {
            moreXPpanel.SetActive(true);
            moreXPtext = GameObject.Find("MoreXPtext").GetComponent<TMP_Text>();
            var remaining_xp = 100 - xp;
            moreXPtext.text = "You need " + remaining_xp + " more XP units to upgrade a skill !";
            //await Task.Delay(2000);
            Invoke("WaitToDisappear",3);
            

        }
        
    }

    void WaitToDisappear()
    {
        moreXPpanel.SetActive(false);
    }

    void DisplayInventory()
    {
        inventoryPanel.SetActive(true);
        isActive = true;
        
        var _money = (int) InkManager.storybackup.variablesState["money"];
    
        money = _money.ToString();
        //var money_text = descriptionPanel.GetComponentInChildren<TMP_Text>();
       // money_text.text = "Your current balance is " + money + " meridians.";

        
        
        
        //Canvas canvas = (Canvas)GameObject.FindObjectOfType(typeof(Canvas));
        var inventory_List = InkManager.storybackup.variablesState["inventory"] as Ink.Runtime.InkList;

        foreach (Transform child in _inventoryContainer.transform)
        {
            if(inventory_List.ContainsItemNamed(child.gameObject.name)) 
            {
                //Debug.Log(child.gameObject.name);
                child.gameObject.SetActive(true);
            }
            else if(child.gameObject.name != "money")
            {
                child.gameObject.SetActive(false);
            }
        }
        
        

        /*if(inventory_List.Count != 0)
        {
            //Destroy(message.gameObject);

            if(inventory_List.ContainsItemNamed("photo"))
                if(!dariaphoto)
                {
                    var new_button = Instantiate(_dariabutton) as Button;
                    new_button.transform.SetParent(_inventoryContainer.transform, false);
                    var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                    _text.text = "A picture of Daria Kozlov.";
                    new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
                    dariaphoto = true;
                }
            
            if(inventory_List.ContainsItemNamed("shell"))
                if(!shell)
                {
                    var new_button = Instantiate(_shellbutton) as Button;
                    new_button.transform.SetParent(_inventoryContainer.transform, false);
                    var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                    _text.text = "The second bullet shell that was found beside the bed.";
                    new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
                    shell = true;

                }

            if(inventory_List.ContainsItemNamed("cross"))
                if(!cross)
                {
                    var new_button = Instantiate(_crossbutton) as Button;
                    new_button.transform.SetParent(_inventoryContainer.transform, false);
                    var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                    _text.text = "Claudia's cross pendant.";
                    new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
                    cross = true;

                }

            if(inventory_List.ContainsItemNamed("cristina_wine_sample")) 
                if(!wine)
                {
                    var new_button = Instantiate(_winebutton) as Button;
                    new_button.transform.SetParent(_inventoryContainer.transform, false);
                    var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                    _text.text = "The wine sample taken from the bottle in the kitchen.";
                    new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
                    wine = true;
                }

            if(inventory_List.ContainsItemNamed("bath_sample"))
                if(!bathwine)
                {
                    var new_button = Instantiate(_winebutton) as Button;
                    new_button.transform.SetParent(_inventoryContainer.transform, false);
                    var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                    _text.text = "The wine sample taken from the broken glass in the bathroom.";
                    new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
                    bathwine = true;
                }

        }
        */
        
        
    }

    void DisplayStatements()
    {
        var statement_List = InkManager.storybackup.variablesState["statements_"] as Ink.Runtime.InkList;
        var evidence_List = InkManager.storybackup.variablesState["evidence"] as Ink.Runtime.InkList;

        statementPanel.SetActive(true);
        isActive = true;

        foreach (Transform child in statementContainer.transform)
        {
            if(statement_List.ContainsItemNamed(child.gameObject.name))
            {
                child.gameObject.SetActive(true);

            }
            else
            {
                child.gameObject.SetActive(false);
            }
        }

        foreach (Transform child in evidenceContainer.transform)
        {
            if(evidence_List.ContainsItemNamed(child.gameObject.name))
            {
                child.gameObject.SetActive(true);
            }
            else
            {
                child.gameObject.SetActive(false);
            }
        }



    }
    void DisplayProfiles()
    {
        var prof_List = InkManager.storybackup.variablesState["profiles"] as Ink.Runtime.InkList;

        profilePanel.SetActive(true);
        isActive = true;

        foreach (Transform child in avatarContainer.transform)
        {
            if(prof_List.ContainsItemNamed(child.gameObject.name))
            {
                child.gameObject.SetActive(true);
                
            }
            else
            {
                child.gameObject.SetActive(false);
            }
        }
    }




    void Update()
    {
        if(Input.GetKeyDown(KeyCode.I) && !player_writing && (InkManager._nextButton||InkManager.choicesdisplayed))
        {
            if(isActive)
            {
                //lastusedtext = InkManager.textbackup;
                GoBack();
            }
            else
            {
                 DisplayInventory();
            }
        }

        else if(Input.GetKeyDown(KeyCode.S) && !player_writing && (InkManager._nextButton||InkManager.choicesdisplayed))
        {
            if(isActive)
            {
                //lastusedtext = InkManager.textbackup;
                GoBack();
            }
            else
            {
                 DisplayStatements();
            }

        }

        else if(Input.GetKeyDown(KeyCode.P) && !player_writing && (InkManager._nextButton||InkManager.choicesdisplayed))
        {
            if(isActive)
            {
                GoBack();
            }
            else
            {
                DisplayProfiles();
            }
            
        }

        else if(Input.GetKeyDown(KeyCode.A) && !player_writing && (InkManager._nextButton||InkManager.choicesdisplayed))
        {
            if(isActive)
            {
                GoBack();
            }
            else
            {
                DisplayAttributes();
            }

        }



    }
}
