using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using System.Collections.Generic;

public class InkGraphGenerator : MonoBehaviour
{
    [Header("Ink Settings")]
    [SerializeField] private TextAsset inkJSON; // Your Ink story file (as .json)
    
    [Header("Graph Settings")]
    [SerializeField] private RectTransform graphContainer; // Parent object for the graph UI
    [SerializeField] private GameObject nodePrefab;        // Prefab for graph nodes (e.g., button or image)
    [SerializeField] private GameObject connectionPrefab;  // Prefab for connections (lines between nodes)

    private Story story;
    private Dictionary<string, GameObject> nodes = new Dictionary<string, GameObject>();
    private Dictionary<string, List<string>> storyStructure = new Dictionary<string, List<string>>();

    void Start()
    {
        if (inkJSON == null || nodePrefab == null || connectionPrefab == null || graphContainer == null)
        {
            Debug.LogError("Please assign all required references in the Inspector.");
            return;
        }

        // Initialize the Ink story using the JSON file
        story = new Story(inkJSON.text);

        // Extract the story structure (knot names and stitch names)
        storyStructure = ExtractStoryStructure();

        // Generate the graph representation of the story
        GenerateGraph();
    }

    void GenerateGraph()
    {
        int level = 0;
        foreach (var knot in storyStructure)
        {
            // Create the node for the knot
            CreateNode(knot.Key, new Vector2(level * 300, 0));

            // For each stitch, create a node and a connection
            foreach (var stitch in knot.Value)
            {
                CreateNode(stitch, new Vector2(level * 300 + 150, -150));
                CreateConnection(knot.Key, stitch);
            }

            level++;
        }
    }

    Dictionary<string, List<string>> ExtractStoryStructure()
    {
        var structure = new Dictionary<string, List<string>>();

        // Iterate through the story's content and extract knots and stitches
        foreach (var content in story.mainContentContainer.content)
        {
            if (content is Ink.Runtime.Container knotContainer)
            {
                // Skip unnamed knots
                if (string.IsNullOrEmpty(knotContainer.name))
                {
                    Debug.LogWarning("Found a container without a name. Skipping...");
                    continue;
                }

                string knotName = knotContainer.name;
                List<string> stitches = new List<string>();

                // Check for stitches inside the knot
                foreach (var innerContent in knotContainer.content)
                {
                    if (innerContent is Ink.Runtime.Container stitchContainer && !string.IsNullOrEmpty(stitchContainer.name))
                    {
                        stitches.Add($"{knotName}.{stitchContainer.name}");
                    }
                }

                structure[knotName] = stitches;
            }
        }

        return structure;
    }

    void CreateNode(string nodeName, Vector2 position)
    {
        if (nodes.ContainsKey(nodeName)) return;

        // Instantiate the node prefab (UI element like a button or image)
        GameObject newNode = Instantiate(nodePrefab, graphContainer);
        RectTransform nodeRect = newNode.GetComponent<RectTransform>();
        nodeRect.anchoredPosition = position;

        // Set the text of the node to the knot or stitch name
        Text nodeText = newNode.GetComponentInChildren<Text>();
        nodeText.text = nodeName;

        // Store the node for later reference
        nodes[nodeName] = newNode;
    }

    void CreateConnection(string parentNode, string childNode)
    {
        if (!nodes.ContainsKey(parentNode) || !nodes.ContainsKey(childNode)) return;

        // Instantiate the connection prefab (a line between two nodes)
        GameObject connection = Instantiate(connectionPrefab, graphContainer);
        RectTransform connectionRect = connection.GetComponent<RectTransform>();

        // Get the positions of the nodes
        Vector2 start = nodes[parentNode].GetComponent<RectTransform>().anchoredPosition;
        Vector2 end = nodes[childNode].GetComponent<RectTransform>().anchoredPosition;

        // Position the connection between the two nodes
        connectionRect.anchoredPosition = (start + end) / 2;
        connectionRect.sizeDelta = new Vector2(Vector2.Distance(start, end), 5); // Set the width of the connection line

        // Rotate the connection to align with the direction of the nodes
        float angle = Mathf.Atan2(end.y - start.y, end.x - start.x) * Mathf.Rad2Deg;
        connectionRect.rotation = Quaternion.Euler(0, 0, angle);
    }
}
