using Godot;
using System;

public partial class player : CharacterBody2D
{
	[Export]
	public float Speed { get; set; } = 300.0f;
	[Export]
	public bool IsLocked { get; set; } = true;
	private AnimatedSprite2D _animatedSprite;
	private Vector2 _previousFacingDirection;
	private String _facingDirection;

	public override void _Ready()
	{
		_animatedSprite = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
		_animatedSprite.Play("idle_front");
		_previousFacingDirection = Vector2.Down;
		_facingDirection = "front";
	}
	public override void _PhysicsProcess(double delta)
	{
		Vector2 direction = IsLocked ? Vector2.Zero : Input.GetVector("left", "right", "up", "down").Normalized();
		Velocity = direction != Vector2.Zero ? Velocity = direction * Speed : Velocity = direction;
		
		MoveAndSlide();
		AnimationStuff(direction);
	}

	private void AnimationStuff(Vector2 direction)
	{
		bool isMoving = !direction.Equals(Vector2.Zero);
		String animationName = "";
		
		switch (direction.Y)
		{
			case 1:
				_facingDirection = "front";
				break;
			case -1:
				_facingDirection = "back";
				break;
			default:
				switch (direction.X)
				{
					case 1:
						_facingDirection = "right";
						break;
					
					case -1:
						_facingDirection = "left";
						break;
					default:
						break;
				}
				break;
		}
		
		animationName = (isMoving ? "walk_" : "idle_") + _facingDirection;
		
		_animatedSprite.Play(animationName);
	}

}
