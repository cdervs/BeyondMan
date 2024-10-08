using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Character Profile", menuName = "Character")]
//makes a template for creatable assets deriving from this class
public class CharacterProfile : ScriptableObject
{
    //the data container we want
    
    public string char_name;
    public string description;

    public Sprite char_avatar;
    
    
}
