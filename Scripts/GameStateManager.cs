using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Runtime.Serialization;
using TMPro;

public class GameStateManager : MonoBehaviour
{
  [SerializeField]
  private Button _filesButtonPrefab;

  private Button fileButton;

  TMP_Text fileButtonText;

  private VerticalLayoutGroup _loadButtonContainer;

  int savedfiles = 0 ;
  private InkManager _inkManager;
  private SoundController _soundcontroller;
  //private CharacterManager _characterManager;
  [System.Serializable]
  public class SaveData
  {
    public string InkStoryState;
    public string TextState, TextState2, SavedFont, SavedFont2;

    public string Load_track;

    public string _SpriteRenderer;

    
  
  }

  private void Start()
  {
    _inkManager = FindObjectOfType<InkManager>();
    //_characterManager = FindObjectOfType<CharacterManager>();
  }

  public void StartGame()
  {
    UnityEngine.SceneManagement.SceneManager.LoadScene("MainScene");
  }

  public void SaveGame()
  {
    
    // Here we will collect all the data from other managers and save it to a file
    SaveData save = CreateSaveGameObject();
    var bf = new BinaryFormatter();
  
    var savePath = Application.persistentDataPath + "/savedata.save";

    FileStream file = File.Create(savePath); // creates a file at the specified location
  
    bf.Serialize(file, save); // writes the content of SaveData object into the file

    file.Close();

    Debug.Log("Game saved");
  }

  private SaveData CreateSaveGameObject()
  {
    /*Creates a data container for certain game objects
    when the player saves the game. */
    return new SaveData
    {
      InkStoryState = _inkManager.GetStoryState(),
      SavedFont = _inkManager._savedfont,
      SavedFont2 = _inkManager._savedfont2,
      TextState = _inkManager._textField.text,
      TextState2 = _inkManager._textField2.text,
      Load_track = _inkManager.loadtrack,
      _SpriteRenderer = _inkManager.saved_background
      
    };
  }

  public void LoadGame()
  {
    // Here we will load data from a file and make it available to other managers
    var savePath = Application.persistentDataPath + "/savedata.save";

    if (File.Exists(savePath))
    {
      BinaryFormatter bf = new BinaryFormatter();
    
      FileStream file = File.Open(savePath, FileMode.Open);
      file.Position = 0;
    
      SaveData save = (SaveData)bf.Deserialize(file);
    
      file.Close();

      InkManager.LoadState(save.InkStoryState,save.SavedFont,
      save.SavedFont2,save.TextState,save.TextState2,save.Load_track,save._SpriteRenderer);

      StartGame();
    }
    else
    {
      Debug.Log("No game saved!");
    }
  }

  public void ExitGame()
  {
    //Exit the game.
    Application.Quit();
  }

}