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
    //Handles UI game objects referring to the contents of Ink lists.
    private InkManager _inkManager;

    

    int handy_, versed_, stealthy, rhetor, observant_;
    public static bool isActive = false;

    public static bool player_writing = false;

    public GameObject inventoryPanel;

    public GameObject descriptionPanel;

    public GameObject statementPanel;

    public GameObject profilePanel;

    public GameObject attributePanel, moreXPpanel;

    public TMP_Text skillset, moreXPtext, xpDisplay, healthDisplay, dateDisplay;

    public GridLayoutGroup avatarContainer;

    public VerticalLayoutGroup statementContainer;

    public VerticalLayoutGroup evidenceContainer;

    public string money;


    [SerializeField] private GridLayoutGroup _inventoryContainer;

    [SerializeField]
    void Start()
    {

        
        inventoryPanel.SetActive(false);
        

        descriptionPanel.SetActive(false);
        profilePanel.SetActive(false);
        attributePanel.SetActive(false);
        statementPanel.SetActive(false);        
        

        foreach (Transform child in _inventoryContainer.transform)
        {
            //Display only the "money" item in the inventory list, upon initialization.
            if((child.gameObject.name!="money")) {child.gameObject.SetActive(false);}
        }
        
    }

     public void OpenDescription(string name)
        {
            /*Activates a panel containing the description of each inventory item
            when the player clicks on the item. */
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
                case "magnet":
                    _text.text = "The neodymium magnet Noah snatched from Palmer. Maybe it can open some door.";
                    break;
                case "cigarette":
                    _text.text = "A mysterious cigarette Noah purchased from Carsen Street.";
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
        attributePanel.SetActive(true); //Show the Attributes panel.
        moreXPpanel.SetActive(false);
        isActive = true;

        var xp = (int) InkManager.storybackup.variablesState["XP"];
        //Retrieve the character's XP points.
        xpDisplay.text = "XP: " + xp;

        var hp = (int) InkManager.storybackup.variablesState["HP"];
        //Retrieve the character's health status.
        healthDisplay.text = "Health: " + hp + "/50";

        InkList dateList = (InkList)InkManager.storybackup.variablesState["day"];
        ////Retrieve the current date of the story's world.
        string todayItemName = null;
        if (dateList.Count > 0)
        {
            // Access the first item in the InkList
            foreach (var listItem in dateList)
            {
                todayItemName = listItem.Key.itemName;  // The day (e.g., "Monday")
                
                break; // We only need the first item
            }
        }
        else
        {
            Debug.Log("No items found in the 'today' list.");
        }

        switch(todayItemName)
        {
            case "Tuesday":
                dateDisplay.text = "Tuesday, December 8th.";
                break;
            case "Wednesday":
                dateDisplay.text = "Wednesday, December 9th.";
                break;
            case "Thursday":
                dateDisplay.text = "Thursday, December 10th.";
                break;
            case "Friday":
                dateDisplay.text = "Friday, December 11th.";
                break;
            case "Saturday":
                dateDisplay.text = "Saturday, December 12th.";
                break;
            case "Sunday":
                dateDisplay.text = "Sunday, December 13th.";
                break;
            case "Monday":
                dateDisplay.text = "Monday, December 14th.";
                break;
        }

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
    //This function gets called by pressing the 'Upgrade buttons in the scene.
    {
        var xp = (int) InkManager.storybackup.variablesState["XP"];
        if(xp >= 100)
        {
            //increases the chosen skill by 1.
            var newval = (int) InkManager.storybackup.variablesState[skill_] + 1;
            InkManager.storybackup.variablesState[skill_] = newval;
            _inkManager = FindObjectOfType<InkManager>();
            _inkManager._story.variablesState[skill_] = newval;

            
            handy_ = (int) InkManager.storybackup.variablesState["handyman"];
            versed_ = (int) InkManager.storybackup.variablesState["versed"];
            stealthy = (int) InkManager.storybackup.variablesState["stealthy"];
            rhetor = (int) InkManager.storybackup.variablesState["rhetor"];
            observant_ = (int) InkManager.storybackup.variablesState["observant"];

            // Refreshes the panel shocwcasing the skills
            skillset.text = "Handyman: " + handy_ + "\n" + "Versed: "
            + versed_ + "\n" + "Stealthy: " + stealthy + "\n" + "Rhetor: " + rhetor + "\n" + "Observant: " + observant_;
            xp -= 100;
            
            //Shows the decreased XP value.
            InkManager.storybackup.variablesState["XP"] = xp;
            xpDisplay.text = "XP: " + xp;
        }
        else
        {
            //A message gets shown to the player if there are not enough points to spend.
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

        
        
        
        
        var inventory_List = InkManager.storybackup.variablesState["inventory"] as Ink.Runtime.InkList;

        foreach (Transform child in _inventoryContainer.transform)
        {
            if(inventory_List.ContainsItemNamed(child.gameObject.name)) 
            {
                
                child.gameObject.SetActive(true);
            }
            else if(child.gameObject.name != "money")
            {
                child.gameObject.SetActive(false);
            }
        }
         
        
    }

    void DisplayStatements()
    {
        // assign the contents of an Ink list into a variable of InkList type.
        var statement_List = InkManager.storybackup.variablesState["statements_"] as Ink.Runtime.InkList;
        var evidence_List = InkManager.storybackup.variablesState["evidence"] as Ink.Runtime.InkList;

        statementPanel.SetActive(true);
        isActive = true;

        /*iterate through the game object containing the objects
        that refer to the contents of the list
        */
        foreach (Transform child in statementContainer.transform)
        {
            if(statement_List.ContainsItemNamed(child.gameObject.name))
            {
                /*if the element of the list is activated through the .ink script
                activate the corresponding game object*/
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
        /*Lets the player display other gameplay panels through certain keys in the keyboard,
        only after the text chunks and the appropriate buttons have been displayed.
        */
        if(Input.GetKeyDown(KeyCode.I) && !player_writing && (InkManager._nextButton||InkManager.choicesdisplayed))
        {
            if(isActive)
            {
                
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
