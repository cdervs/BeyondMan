using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class ButtonTransitions : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    
    private InkManager _inkManager;
    
    public void OnPointerEnter(PointerEventData eventData)
     {
        Vector2 original = _inkManager._choiceButtonPrefab.GetComponent<RectTransform>().sizeDelta;
        _inkManager._choiceButtonPrefab.GetComponent<RectTransform>().sizeDelta = original + new Vector2(50,50);
         
     }

      public void OnPointerExit(PointerEventData eventData)
      {
        _inkManager._choiceButtonPrefab.GetComponent<RectTransform>().sizeDelta -= new Vector2(50,50);

      }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
