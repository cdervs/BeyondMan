using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HoverOver : MonoBehaviour
{
    public Button _button;
    public Color wantedColor;
    private Color originalColor;
    private Color cb;

    void Start()
    {
        cb = _button.GetComponent<Image>().color;
        originalColor = cb;
    }

    void Update()
    {

    }

//Change the color of certain buttons temporarily whenever the mouse cursor passes over them.
    public void changeWhenHover()
    {
        cb = wantedColor;
        _button.GetComponent<Image>().color = cb;
    }

    public void changeWhenLeaves()
    {
        cb = originalColor;
        _button.GetComponent<Image>().color = cb;
    }
}
