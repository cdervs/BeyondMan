using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;
using System.Threading;
using System;

public class InventoryManager : MonoBehaviour
{
    public static string tracktorepeat, lastusedtext;


    private TMP_Text message;
    [SerializeField]
    private TMP_Text message_pfb;
    public GameObject descriptionPanel;

    //public static bool inventory_loaded;
    

    //[SerializeField] SoundController sound_controller;
    [SerializeField] private GridLayoutGroup _inventoryContainer;

    [SerializeField]

    //Button new_button;

    public Button _dariabutton, _shellbutton, _crossbutton, moneybutton, _winebutton;
    // Start is called before the first frame update
    void Start()
    {
        descriptionPanel.SetActive(false);
        //Canvas canvas = (Canvas)GameObject.FindObjectOfType(typeof(Canvas));
        //message = Instantiate(message_pfb) as TMP_Text;
        //message.transform.SetParent(canvas.transform, false);
        //Vector3 p = new Vector3(1300,600,0);
        //message.transform.position = p;
        //_inventoryContainer.transform.SetParent(canvas.transform, false);
        //anager = FindObjectOfType<InkManager>();
        DisplayInventory();
        //ink_manager = FindObjectOfType<InkManager>();
        //if(ink_manager) {Debug.Log("good");}
        //if (ink_manager) {Debug.Log("good");}
        
    }

    void GoBack()
    {
        //tracktorepeat = InkManager.loadtrack2;
        UnityEngine.SceneManagement.SceneManager.LoadScene("MainScene");
    }

    public void CloseDescription()
    {
        descriptionPanel.SetActive(false);
    }

    // Update is called once per frame

    void DisplayInventory()
    {
        var _money = (int) InkManager.storybackup.variablesState["money"];
        string money = _money.ToString();
        //Canvas canvas = (Canvas)GameObject.FindObjectOfType(typeof(Canvas));
        var inventory_List = InkManager.storybackup.variablesState["inventory"] as Ink.Runtime.InkList;

        var money_button = Instantiate(moneybutton) as Button;
        money_button.transform.SetParent(_inventoryContainer.transform, false);
        var money_text = descriptionPanel.GetComponentInChildren<TMP_Text>();
        money_text.text = "Your current balance is " + money + " meridians.";
        money_button.onClick.AddListener(() => descriptionPanel.SetActive(true));

        if(inventory_List.Count != 0)
        {
            //Destroy(message.gameObject);

            if(inventory_List.ContainsItemNamed("photo"))
            {
                var new_button = Instantiate(_dariabutton) as Button;
                new_button.transform.SetParent(_inventoryContainer.transform, false);
                var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                _text.text = "A picture of Daria Kozlov.";
                new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
            }
            if(inventory_List.ContainsItemNamed("shell")) 
            {
                var new_button = Instantiate(_shellbutton) as Button;
                new_button.transform.SetParent(_inventoryContainer.transform, false);
                var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                _text.text = "The second bullet shell that was found beside the bed.";
                new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));

            }
            if(inventory_List.ContainsItemNamed("cross")) 
            {
                var new_button = Instantiate(_crossbutton) as Button;
                new_button.transform.SetParent(_inventoryContainer.transform, false);
                var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                _text.text = "Claudia's cross pendant.";
                new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));

            }
            if(inventory_List.ContainsItemNamed("cristina_wine_sample")) 
            {
                var new_button = Instantiate(_winebutton) as Button;
                new_button.transform.SetParent(_inventoryContainer.transform, false);
                var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                _text.text = "The wine sample taken from the bottle in the kitchen.";
                new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
            }
            if(inventory_List.ContainsItemNamed("bath_sample")) 
            {
                var new_button = Instantiate(_winebutton) as Button;
                new_button.transform.SetParent(_inventoryContainer.transform, false);
                var _text = descriptionPanel.GetComponentInChildren<TMP_Text>();
                _text.text = "The wine sample taken from the broken glass in the bathroom.";
                new_button.onClick.AddListener(() => descriptionPanel.SetActive(true));
            }

        }
    }
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.I))
            {
                //lastusedtext = InkManager.textbackup;
                GoBack();
            }
    }
}
