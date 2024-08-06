using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;
using UnityEngine.UI;
using TMPro;

public class PauseManager : MonoBehaviour
{
    // Start is called before the first frame update
    public Image img;

    bool Activate = false;

    public GameObject pausePanel;
    

    void Start()
    {
        if(img!=null) {img.gameObject.SetActive(false);}
        pausePanel.SetActive(false);


    }

    public void Resume_()
    {
        //UnityEngine.SceneManagement.SceneManager.LoadScene("MainScene");
        //GameObject panel_ = GameObject.Find("PausePanel1");
        Debug.Log("to kanei");
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
