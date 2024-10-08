using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CreateProfile : MonoBehaviour
{
    //Assigns the "Character profile" scriptable objects' fields to the according game objects.
    public CharacterProfile newprof;

    public Image characterArt;
    public TMP_Text charname;
    public TMP_Text description_;

    // Start is called before the first frame update
    void Start()
    {
        characterArt.sprite = newprof.char_avatar;
        charname.text = newprof.char_name;
        description_.text = newprof.description;
    }

    
}
