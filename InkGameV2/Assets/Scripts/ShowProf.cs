using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class ShowProf : MonoBehaviour
{
    //GameObject avatar_;
    public GridLayoutGroup avatarContainer;
    
    // Start is called before the first frame update
    void Start()
    {
        var prof_List = InkManager.storybackup.variablesState["profiles"] as Ink.Runtime.InkList;

        foreach (Transform child in avatarContainer.transform)
        {
            if(!prof_List.ContainsItemNamed(child.gameObject.name)) {child.gameObject.SetActive(false);}
        }

        /*if(prof_List.Count != 0)
        {
            foreach(var avatar_name in prof_List)
            {
                avatar_ = GameObject.Find(avatar_name.ToString());
                avatar_.SetActive(true);
            }
            
        }*/
        
    }

    void GetBack()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene("MainScene");
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.P))
        {
            GetBack();
        }
    }
}
