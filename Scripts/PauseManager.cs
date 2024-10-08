using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;
using UnityEngine.UI;
using TMPro;

public class PauseManager : MonoBehaviour
{
    /* Controls the display of a panel containing instructions for the player
    whenever the player clicks on the 'Help' button. */
    public Image img;

    bool soundState = true;

    public Button ControlSound;

    bool Activate = false;

    public GameObject pausePanel;
    

    void Start()
    {
        if(img!=null) {img.gameObject.SetActive(false);}
        pausePanel.SetActive(false);


    }

    public void Resume_()
    {
        
        pausePanel.SetActive(false);
        Activate = false;
    }
    
    

    public void ShowHelp()
    {
        
        img.gameObject.SetActive(true);

    }

    public void Close()
    {
        //GameObject img_ = GameObject.Find("Help");
        img.gameObject.SetActive(false);
    }
    public void ExitStory()
    {
        Destroy(InkManager.backingtrack);
        //InkManager.storybackup = null;
        UnityEngine.SceneManagement.SceneManager.LoadScene("MainMenu");
    }

    public void SoundSwitch()
    {
        var soundbuttonText = ControlSound.GetComponentInChildren<TMP_Text>();

        soundState = !soundState; // Toggle the boolean flag
        if (soundState)
        {
            AudioListener.volume = 1f; // Turn sound on
        }
        else
        {
            AudioListener.volume = 0f; // Turn sound off
        }

        if (soundState)
        {
            soundbuttonText.text = "Sound: On";
        }
        else
        {
            soundbuttonText.text = "Sound: Off";
        }

    } 

     void DisplayPauseMenu()
    {
       
        pausePanel.SetActive(true);
        //GameObject img_ = GameObject.Find("Help");
        img.gameObject.SetActive(false);
        Activate = true;
    }

    // Update is called once per frame
    void Update()
    {
        /*if(Input.GetKeyDown(KeyCode.M))
        {
            Resume_();
        }
        */
        
        if(Input.GetKeyDown(KeyCode.M))
        {
            if(Activate)
            {
                Resume_();
            }
            else
            {
                DisplayPauseMenu();
            }
        }
    }
}
