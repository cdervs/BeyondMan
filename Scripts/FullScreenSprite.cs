using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FullScreenSprite : MonoBehaviour
{
    InkManager manageArray;
    public string _background;

    void Start()
    {
        
        
        
    }

    // Update is called once per frame
    void Update()
    {
        
           
        
        
    }

    void Awake() {
        
        SpriteRenderer spriteRenderer = GetComponent<SpriteRenderer>();
        spriteRenderer.sprite = manageArray.ImagesArray[11];
        float cameraHeight = Camera.main.orthographicSize * 2;
        Vector2 cameraSize = new Vector2(Camera.main.aspect * cameraHeight, cameraHeight);
        Vector2 spriteSize = spriteRenderer.sprite.bounds.size;
        Vector2 scale = transform.localScale;
        if (cameraSize.x >= cameraSize.y) { 
            scale *= cameraSize.x / spriteSize.x;
        } else { 
            scale *= cameraSize.y / spriteSize.y;
        }
        transform.position = Vector2.zero; 
        transform.localScale = scale;
       
        
    }
}
