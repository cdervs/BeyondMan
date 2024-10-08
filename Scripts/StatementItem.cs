using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Statement", menuName = "Statement")]
public class StatementItem : ScriptableObject
{
    //makes a template for creatable assets deriving from this class  
    public string statementText;
}
