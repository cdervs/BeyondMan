using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SaveGameButtonScript : MonoBehaviour
{
  GameStateManager _gameStateManager;

  InkManager _inkManager;

  
  void Start()
  {
    _gameStateManager = FindObjectOfType<GameStateManager>();
    _inkManager = FindObjectOfType<InkManager>();
    
    if (_gameStateManager == null)
    {
      Debug.LogError("Game State Manager was not found!");
    }
  }
  
  public void OnClick()
  {
    _gameStateManager?.SaveGame();
    _inkManager.saveNotification.gameObject.SetActive(true);
    Invoke("WaittoDisappear",3);

  }

  void WaittoDisappear()
  {
    _inkManager.saveNotification.gameObject.SetActive(false);
  }
}
