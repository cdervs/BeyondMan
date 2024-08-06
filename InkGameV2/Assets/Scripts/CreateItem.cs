using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CreateItem : MonoBehaviour
{
    public ItemProfile itemProf;

    public Image itemArt;
    //public TMP_Text itemDescr;
    // Start is called before the first frame update
    void Start()
    {
        itemArt.sprite = itemProf.itemAvatar;
        //itemDescr.text = itemProf.itemDescription;
        
    }

}
