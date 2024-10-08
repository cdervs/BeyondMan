using System;
using System.Collections.Generic;
using Ink.Runtime;
using UnityEngine;

public class RandomInkTraverser: MonoBehaviour
{
    

    // Keep track of visited knots/stitches
    private Dictionary<string, int> visitedNodes = new Dictionary<string, int>();
    private int maxVisitsPerNode = 76; // Limit number of visits to the same node
    private System.Random random;
    // Reference to the Ink JSON file
    public TextAsset inkJsonFile;

    // Private Ink Story object
    private Story story;

    // Track the number of steps traversed
    private int steps = 0;

    // Start is called before the first frame update
    void Start()
    {
        // Ensure the JSON file is assigned
        random = new System.Random((int)DateTime.Now.Ticks);
        if (inkJsonFile != null)
        {
            // Load the Ink story from the JSON text
            story = new Story(inkJsonFile.text);
            Debug.Log("Ink story loaded successfully.");

            // Begin traversing the story
            TraverseStory();
        }
        else
        {
            Debug.LogError("No Ink JSON file assigned! Please assign the Ink JSON file in the Inspector.");
        }
    }

    // Function to randomly traverse the story
    void TraverseStory()
    {
        try
        {
            // Loop through the story while it can continue
            while (story.canContinue)
            {
                // Continue the story and capture the next segment of text
                string text = story.Continue();
                Debug.Log("Step " + (++steps) + ": " + text);
                if (IsLoopDetected())
                {
                    Debug.Log("Loop detected. Breaking out...");
                    return;
                }

                // Log any warnings or errors
                if (story.hasError)
                {
                    Debug.LogError("Ink Story Error: " + string.Join(", ", story.currentErrors));
                    return;  // Exit if errors occurred
                }

                if (story.hasWarning)
                {
                    Debug.LogWarning("Ink Story Warning: " + string.Join(", ", story.currentWarnings));
                }

                // Check if there are choices available
                List<Choice> choices = story.currentChoices;
                if (choices.Count > 0)
                {
                    // Log available choices
                    for (int i = 0; i < choices.Count; i++)
                    {
                        Debug.Log("Choice " + i + ": " + choices[i].text);
                    }

                    // Randomly select a choice
                    int randomChoiceIndex = random.Next(0, choices.Count);
                    Debug.Log("Making choice: " + randomChoiceIndex + " - " + choices[randomChoiceIndex].text);
                    story.ChooseChoiceIndex(randomChoiceIndex);
                }
                else
                {
                    Debug.Log("No choices available at this point.");
                }
            }

            // Log the final stitch or knot
            string lastPath = story.state.currentPathString;
            Debug.Log("Final visited stitch: " + lastPath);

            // If the story ends without further options
            if (!story.canContinue && story.currentChoices.Count == 0)
            {
                Debug.Log("Reached the end of the story.");
            }
        }
        catch (Exception ex)
        {
            Debug.LogError("An error occurred while traversing the story: " + ex.Message);
        }
    }

    private bool IsLoopDetected()
    {
        string currentPath = story.state.currentPathString;
        if (string.IsNullOrEmpty(currentPath)) return false;

        // Check how many times the current path has been visited
        if (visitedNodes.ContainsKey(currentPath))
        {
            visitedNodes[currentPath]++;
            if (visitedNodes[currentPath] > maxVisitsPerNode)
            {
                return true; // Detected a loop (visited too many times)
            }
        }
        else
        {
            visitedNodes[currentPath] = 1; // First time visiting this node
        }

        return false;
    }
}
