using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class SoundController : MonoBehaviour
{
    //private InkManager _inkManager;

    //public GameObject _controller;

    public AudioSource main_theme, second_theme, jazz_1, worried_crowd;
    

    public AudioSource click_sound;

    

    public List<string> themes = new List<string> {"old_city", "pixel_river", "jazz_1", "worried_crowd"};
    List<string> effects = new List<string> {""};
 

  public static class AudioHelper {

	  public static IEnumerator FadeOut(AudioSource audioSource, float FadeTime) {
      float startVolume = audioSource.volume;
      while (audioSource.volume > 0) {
        audioSource.volume -= startVolume * Time.deltaTime / FadeTime;
        yield return null;
      }
      audioSource.Stop();
	  }

    public static IEnumerator FadeIn(AudioSource audioSource, float FadeTime) {
        audioSource.Play();
        audioSource.volume = 0f;
        while (audioSource.volume < 1) {
          audioSource.volume += Time.deltaTime / FadeTime;
          yield return null;
      }
    }
	
  }
        
    // Start is called before the first frame update
    void Start()
    {
        //main_theme.transform.SetParent(_controller.transform, false);
        //click_sound.transform.SetParent(_controller.transform, false);
        
        
    }


    // Update is called once per frame
    void Update()
    {
       
        
    }

    void Awake()
    {
      click_sound.volume = 0.2f;
      //if(foundsources.Length > 1) {InkManager.duplicate = foundsources[1];}
    }
        
    
}
