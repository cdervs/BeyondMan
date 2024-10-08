using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CreateItem : MonoBehaviour
{
    //Assigns the "inventory item" scriptable objects' fields to the according game objects.
    public ItemProfile itemProf;

    public Image itemArt;
    
    // Start is called before the first frame update
    void Start()
    {
        itemArt.sprite = itemProf.itemAvatar;
        
        
    }

}
