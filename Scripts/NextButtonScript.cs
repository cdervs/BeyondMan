using UnityEngine;

public class NextButtonScript : MonoBehaviour
{
  private InkManager _inkManager;

  void Start()
  {
    _inkManager = FindObjectOfType<InkManager>();

    if (_inkManager == null)
    {
      Debug.LogError("Ink Manager was not found!");
    }
  }

  public void OnClick()
  {
    if (_inkManager.typingdone == true)
    {
      if(_inkManager._story.canContinue)
      {
        Destroy(_inkManager._textField.gameObject);
        if(_inkManager._textField2) {Destroy(_inkManager._textField2.gameObject);}
        
        
        _inkManager?.DisplayNextLines();
      }
      
      else if(_inkManager._story.currentChoices.Count > 0)
      {
        _inkManager.DisplayChoices();
      }
    }
    
  }
}