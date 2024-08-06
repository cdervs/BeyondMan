using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CreateStatement : MonoBehaviour
{
    public StatementItem statementItem;

    public TMP_Text statementDescription;
    // Start is called before the first frame update
    void Start()
    {
        statementDescription.text = statementItem.statementText;
        
    }

    // Update is called once per frame
}
