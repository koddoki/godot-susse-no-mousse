using Godot;
using System;
using System.Collections.Generic;
using System.Text.Json;

public partial class dialogue_builder : Node2D
{/*
	public Node2D _scene;
	public List<Scenario> scenarios;
	
	
	public override void _Ready()
	{
		_scene = GetNode<Node2D>("DialogueScene");
		string filePath = "res://sample/test_cutscene_node.json";
		dialogue_builder.readJson(filePath);
		_scene.Call("update_text", "bat", "ata");
	}
	
	public static void readJson(string filePath)
	{
		GD.Print("Olé");
		string jsonAsText = FileAccess.GetFileAsString(filePath);
		scenarios = Scenario.DeserializeScenarios(jsonAsText);
		GD.Print(scenarios);
		foreach(Scenario scenario in scenarios){
			GD.Print("Olé");
			GD.Print(scenario.ToString());
		}
	}
	
	public void nextScene()
	{
		/*
			TODO
			I need to save and keep the current state
			The current state is not only the scene, but also the dialogue
			pop dialogue everytime one is compilled?
			After all dialogue pops, pop the current scene?
			After all dialogue ends, before popping the current scene I should check if there is "Options", that is the multiple choice thingy
		
		
		if (scenario != null && scenarios.Count >= 0)
		{
			Scenario scenario = scenarios[0];
			GD.Print("TODO: Tratamento pra quando ainda tem algo na lista");
			return;
			
			if (scenario.Dialogue != null && scenario.Dialogue <= 0)
			{
				Dialogue dialogue = scenario.Dialogue[0]; 
				scenario.Dialogue.RemoteAt(0);
				GD.Print("TODO: Mudar o dialogo na cena");
				return;
			}
		
			
		
			if (scenario.Options != null || scenario.Options <= 0)
			{
				GD.Print("TODO: Tratamento para quando tem opções");
			}
		
			scenarios.RemoveAt(0);
		}
	}
	*/
}




