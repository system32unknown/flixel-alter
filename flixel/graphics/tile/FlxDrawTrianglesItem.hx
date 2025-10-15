package flixel.graphics.tile;

import flixel.FlxCamera;
import flixel.graphics.frames.FlxFrame;
import flixel.graphics.tile.FlxDrawBaseItem.FlxDrawItemType;
import flixel.math.FlxMatrix;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxAssets.FlxShader;
import flixel.util.FlxColor;
import openfl.display.ShaderParameter;
import openfl.display.TriangleCulling;
import openfl.geom.ColorTransform;

typedef DrawData<T> = openfl.Vector<T>;

/**
 * @author Zaphod
 */
class FlxDrawTrianglesItem extends FlxDrawBaseItem<FlxDrawTrianglesItem>
{
	static inline final INDICES_PER_QUAD = 6;
<<<<<<< HEAD
	static final point = FlxPoint.get();
	static final rect = FlxRect.get();
	static final bounds = FlxRect.get();
	
	public var shader:FlxShader;
	var alphas:Array<Float> = [];
	var colorMultipliers:Array<Float> = [];
	var colorOffsets:Array<Float> = [];
	
	public var vertices:DrawData<Float> = new DrawData<Float>();
	public var indices:DrawData<Int> = new DrawData<Int>();
	public var uvtData:DrawData<Float> = new DrawData<Float>();
	@:deprecated("colors is deprecated")
	public var colors:DrawData<Int> = new DrawData<Int>();

	@:deprecated("verticesPosition is deprecated, use vertices.length, instead")
	public var verticesPosition(get, never):Int;
	@:deprecated("indicesPosition is deprecated, use indices.length, instead")
	public var indicesPosition(get, never):Int;
	@:deprecated("colorsPosition is deprecated")
	public var colorsPosition(get, never):Int;
=======
	static var point:FlxPoint = FlxPoint.get();
	static var rect:FlxRect = FlxRect.get();

	public var shader:FlxShader;
	var alphas:Array<Float>;
	var colorMultipliers:Array<Float>;
	var colorOffsets:Array<Float>;

	public var vertices:DrawData<Float> = new DrawData<Float>();
	public var indices:DrawData<Int> = new DrawData<Int>();
	public var uvtData:DrawData<Float> = new DrawData<Float>();
	@:deprecated("colors is deprecated, use colorMultipliers and colorOffsets")
	public var colors:DrawData<Int> = new DrawData<Int>();

	public var verticesPosition:Int = 0;
	public var indicesPosition:Int = 0;
	@:deprecated("colorsPosition is deprecated")
	public var colorsPosition:Int = 0;

	var bounds:FlxRect = FlxRect.get();
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524

	public function new()
	{
		super();
		type = FlxDrawItemType.TRIANGLES;
<<<<<<< HEAD
=======
		alphas = [];
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
	}

	#if !flash
	override public function render(camera:FlxCamera):Void
	{
<<<<<<< HEAD
		if (numTriangles == 0)
			return;

		// TODO: catch this error when the dev actually messes up, not in the draw phase
		if (shader == null && graphics.isDestroyed)
			throw 'Attempted to render an invalid FlxDrawItem, did you destroy a cached sprite?';
		
		final shader = shader != null ? shader : graphics.shader;
=======
		if (numTriangles <= 0)
			return;

		#if !flash
		var shader = shader != null ? shader : graphics.shader;
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
		shader.bitmap.input = graphics.bitmap;
		shader.bitmap.filter = (camera.antialiasing || antialiasing) ? LINEAR : NEAREST;
		shader.bitmap.wrap = REPEAT; // in order to prevent breaking tiling behaviour in classes that use drawTriangles
		shader.alpha.value = alphas;

		if (colored || hasColorOffsets)
		{
			shader.colorMultiplier.value = colorMultipliers;
			shader.colorOffset.value = colorOffsets;
		}
		else
		{
			shader.colorMultiplier.value = null;
			shader.colorOffset.value = null;
		}

		setParameterValue(shader.hasTransform, true);
		setParameterValue(shader.hasColorTransform, colored || hasColorOffsets);

		camera.canvas.graphics.overrideBlendMode(blend);
		camera.canvas.graphics.beginShaderFill(shader);
		camera.canvas.graphics.drawTriangles(vertices, indices, uvtData, TriangleCulling.NONE);
		camera.canvas.graphics.endFill();

		#if FLX_DEBUG
		if (FlxG.debugger.drawDebug)
		{
			final gfx = camera.debugLayer.graphics;
			gfx.lineStyle(1, FlxColor.BLUE, 0.5);
			gfx.drawTriangles(vertices, indices, uvtData);
		}
		#end

		super.render(camera);
	}

	inline function setParameterValue(parameter:ShaderParameter<Bool>, value:Bool):Void
	{
		if (parameter.value == null)
			parameter.value = [];
		parameter.value[0] = value;
	}
	#end
	
	@:haxe.warning("-WDeprecated")
	override public function reset():Void
	{
		super.reset();
		vertices.length = 0;
		indices.length = 0;
		uvtData.length = 0;
<<<<<<< HEAD
		colors.length = 0;
		alphas.resize(0);
		colorMultipliers.resize(0);
		colorOffsets.resize(0);
=======

		verticesPosition = 0;
		indicesPosition = 0;
		alphas.splice(0, alphas.length);
		if (colorMultipliers != null)
			colorMultipliers.splice(0, colorMultipliers.length);
		if (colorOffsets != null)
			colorOffsets.splice(0, colorOffsets.length);
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
	}

	@:haxe.warning("-WDeprecated")
	override public function dispose():Void
	{
		super.dispose();
		vertices = null;
		indices = null;
		uvtData = null;
<<<<<<< HEAD
		colors = null;
=======
		bounds = null;
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
		alphas = null;
		colorMultipliers = null;
		colorOffsets = null;
	}

<<<<<<< HEAD
	public function addTriangles(vertices:DrawData<Float>, indices:DrawData<Int>, uvtData:DrawData<Float>, ?colors:DrawData<FlxColor>, ?position:FlxPoint,
=======
	public function addTriangles(vertices:DrawData<Float>, indices:DrawData<Int>, uvtData:DrawData<Float>, ?colors:DrawData<Int>, ?position:FlxPoint,
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
			?cameraBounds:FlxRect, ?transform:ColorTransform):Void
	{
		if (position == null)
			position = point.set();

		if (cameraBounds == null)
			cameraBounds = rect.set(0, 0, FlxG.width, FlxG.height);

<<<<<<< HEAD
		// reset bounds outside camera view
		bounds.set(Math.NaN, Math.NaN, Math.NaN, Math.NaN);
		
		final prevNumVertices = numVertices;
		final verticesLength = Std.int(vertices.length / 2) * 2;
		var i = 0;
		
=======
		var verticesLength:Int = vertices.length;
		var prevVerticesLength:Int = this.vertices.length;
		var numberOfVertices:Int = Std.int(verticesLength / 2);
		var prevIndicesLength:Int = this.indices.length;
		var prevUVTDataLength:Int = this.uvtData.length;
		var prevNumberOfVertices:Int = this.numVertices;

		var tempX:Float, tempY:Float;
		var i:Int = 0;
		var currentVertexPosition:Int = prevVerticesLength;

>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
		while (i < verticesLength)
		{
			final tempX = position.x + vertices[i];
			final tempY = position.y + vertices[i + 1];
			
			this.vertices.push(tempX);
			this.vertices.push(tempY);
			
			if (i == 0)
				bounds.set(tempX, tempY, 0, 0);
			else
				inflateBounds(bounds, tempX, tempY);

			i += 2;
		}

<<<<<<< HEAD
		position.putWeak();
		
		if (!bounds.overlaps(cameraBounds))
		{
			this.vertices.length -= verticesLength;
			return;
		}
		
		final indicesLength = Std.int(indices.length / 3) * 3;
		final colorsLength = colors != null ? colors.length : -1;
		
		for (i in 0...verticesLength)
			this.uvtData.push(uvtData[i]);
		
		for (i in 0...indicesLength)
			this.indices.push(prevNumVertices + indices[i]);
		
		final alphaMultiplier = transform != null ? transform.alphaMultiplier : 1.0;
		for (i in 0...indicesLength)
		{
			var alpha = alphaMultiplier;
			
			if (i < colorsLength)
			{
				final color = colors[indices[i]];
				alpha *= color.alphaFloat;
			}
			
			alphas.push(alpha);
		}

		if (colored || hasColorOffsets)
		{
			var redMultiplier = 1.0;
			var greenMultiplier = 1.0;
			var blueMultiplier = 1.0;
			
			var redOffset = 1.0;
			var greenOffset = 1.0;
			var blueOffset = 1.0;
			var alphaOffset = 1.0;
			
			if (transform != null)
			{
				redMultiplier = transform.redMultiplier;
				greenMultiplier = transform.greenMultiplier;
				blueMultiplier = transform.blueMultiplier;
				
				redOffset = transform.redOffset;
				greenOffset = transform.greenOffset;
				blueOffset = transform.blueOffset;
				alphaOffset = transform.alphaOffset;
			}
			for (i in 0...indicesLength)
			{
				var red = redMultiplier;
				var green = greenMultiplier;
				var blue = blueMultiplier;
				
				if (i < colorsLength)
				{
					final color = colors[indices[i]];
					red *= color.redFloat;
					green *= color.greenFloat;
					blue *= color.blueFloat;
				}

				colorMultipliers.push(red);
				colorMultipliers.push(green);
				colorMultipliers.push(blue);
				colorMultipliers.push(1);
				colorOffsets.push(redOffset);
				colorOffsets.push(greenOffset);
				colorOffsets.push(blueOffset);
				colorOffsets.push(alphaOffset);
			}
		}
=======
		var indicesLength:Int = indices.length;
		if (!cameraBounds.overlaps(bounds))
		{
			this.vertices.splice(this.vertices.length - verticesLength, verticesLength);
		}
		else
		{
			var uvtDataLength:Int = uvtData.length;
			for (i in 0...uvtDataLength)
			{
				this.uvtData[prevUVTDataLength + i] = uvtData[i];
			}

			for (i in 0...indicesLength)
			{
				this.indices[prevIndicesLength + i] = indices[i] + prevNumberOfVertices;
			}
			
			final alphaMultiplier = transform != null ? transform.alphaMultiplier : 1.0;
			for (_ in 0...indicesLength)
				alphas.push(alphaMultiplier);
			
			if (colored || hasColorOffsets)
			{
				if (colorMultipliers == null)
					colorMultipliers = [];
				
				if (colorOffsets == null)
					colorOffsets = [];
				
				for (_ in 0...indicesLength)
				{
					if (transform != null)
					{
						colorMultipliers.push(transform.redMultiplier);
						colorMultipliers.push(transform.greenMultiplier);
						colorMultipliers.push(transform.blueMultiplier);
						
						colorOffsets.push(transform.redOffset);
						colorOffsets.push(transform.greenOffset);
						colorOffsets.push(transform.blueOffset);
						colorOffsets.push(transform.alphaOffset);
					}
					else
					{
						colorMultipliers.push(1);
						colorMultipliers.push(1);
						colorMultipliers.push(1);
						
						colorOffsets.push(0);
						colorOffsets.push(0);
						colorOffsets.push(0);
						colorOffsets.push(0);
					}
					
					colorMultipliers.push(1);
				}
			}
			
			verticesPosition += verticesLength;
			indicesPosition += indicesLength;
		}

		position.putWeak();
		cameraBounds.putWeak();
	}

	inline function setParameterValue(parameter:ShaderParameter<Bool>, value:Bool):Void
	{
		if (parameter.value == null)
			parameter.value = [];
		parameter.value[0] = value;
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
	}

	public static inline function inflateBounds(bounds:FlxRect, x:Float, y:Float):FlxRect
	{
		if (x < bounds.x)
		{
			bounds.width += bounds.x - x;
			bounds.x = x;
		}

		if (y < bounds.y)
		{
			bounds.height += bounds.y - y;
			bounds.y = y;
		}

		if (x > bounds.right)
			bounds.width = x - bounds.x;

		if (y > bounds.bottom)
			bounds.height = y - bounds.y;

		return bounds;
	}

	override public function addQuad(frame:FlxFrame, matrix:FlxMatrix, ?transform:ColorTransform):Void
	{
<<<<<<< HEAD
		final prevNumVertices = numVertices;
		
		inline function addVertex(x:Float, y:Float)
		{
			point.set(x, y).transform(matrix);
			vertices.push(point.x);
			vertices.push(point.y);
		}
		
		addVertex(0, 0);
		addVertex(frame.frame.width, 0);
		addVertex(frame.frame.width, frame.frame.height);
		addVertex(0, frame.frame.height);
		
		uvtData.push(frame.uv.left);
		uvtData.push(frame.uv.top);
		uvtData.push(frame.uv.right);
		uvtData.push(frame.uv.top);
		uvtData.push(frame.uv.right);
		uvtData.push(frame.uv.bottom);
		uvtData.push(frame.uv.left);
		uvtData.push(frame.uv.bottom);
		
		indices.push(prevNumVertices);
		indices.push(prevNumVertices + 1);
		indices.push(prevNumVertices + 2);
		indices.push(prevNumVertices + 2);
		indices.push(prevNumVertices + 3);
		indices.push(prevNumVertices);
		
		final alphaMultiplier = transform != null ? transform.alphaMultiplier : 1.0;
		for (_ in 0...INDICES_PER_QUAD)
			alphas.push(alphaMultiplier);
		
		if (colored || hasColorOffsets)
		{
			var redMultiplier = 1.0;
			var greenMultiplier = 1.0;
			var blueMultiplier = 1.0;
			
			var redOffset = 1.0;
			var greenOffset = 1.0;
			var blueOffset = 1.0;
			var alphaOffset = 1.0;
			
			if (transform != null)
			{
				redMultiplier = transform.redMultiplier;
				greenMultiplier = transform.greenMultiplier;
				blueMultiplier = transform.blueMultiplier;
				
				redOffset = transform.redOffset;
				greenOffset = transform.greenOffset;
				blueOffset = transform.blueOffset;
				alphaOffset = transform.alphaOffset;
			}

			for (_ in 0...INDICES_PER_QUAD)
			{
				colorMultipliers.push(redMultiplier);
				colorMultipliers.push(greenMultiplier);
				colorMultipliers.push(blueMultiplier);
				colorMultipliers.push(1);
				
				colorOffsets.push(redOffset);
				colorOffsets.push(greenOffset);
				colorOffsets.push(blueOffset);
				colorOffsets.push(alphaOffset);
			}
=======
		final prevVerticesPos = verticesPosition;
		final prevNumberOfVertices = numVertices;
		
		final w = frame.frame.width;
		final h = frame.frame.height;
		vertices[prevVerticesPos + 0] = matrix.transformX(0, 0); // left
		vertices[prevVerticesPos + 1] = matrix.transformY(0, 0); // top
		vertices[prevVerticesPos + 2] = matrix.transformX(w, 0); // right
		vertices[prevVerticesPos + 3] = matrix.transformY(w, 0); // top
		vertices[prevVerticesPos + 4] = matrix.transformX(0, h); // left
		vertices[prevVerticesPos + 5] = matrix.transformY(0, h); // bottom
		vertices[prevVerticesPos + 6] = matrix.transformX(w, h); // right
		vertices[prevVerticesPos + 7] = matrix.transformY(w, h); // bottom
		
		uvtData[prevVerticesPos + 0] = frame.uv.left;
		uvtData[prevVerticesPos + 1] = frame.uv.top;
		uvtData[prevVerticesPos + 2] = frame.uv.right;
		uvtData[prevVerticesPos + 3] = frame.uv.top;
		uvtData[prevVerticesPos + 4] = frame.uv.left;
		uvtData[prevVerticesPos + 5] = frame.uv.bottom;
		uvtData[prevVerticesPos + 6] = frame.uv.right;
		uvtData[prevVerticesPos + 7] = frame.uv.bottom;
		
		final prevIndicesPos = indicesPosition;
		indices[prevIndicesPos + 0] = prevNumberOfVertices + 0; // TL
		indices[prevIndicesPos + 1] = prevNumberOfVertices + 1; // TR
		indices[prevIndicesPos + 2] = prevNumberOfVertices + 2; // BL
		indices[prevIndicesPos + 3] = prevNumberOfVertices + 1; // TR
		indices[prevIndicesPos + 4] = prevNumberOfVertices + 2; // BL
		indices[prevIndicesPos + 5] = prevNumberOfVertices + 3; // BR

		final alphaMultiplier = transform != null ? transform.alphaMultiplier : 1.0;
		for (i in 0...INDICES_PER_QUAD)
			alphas.push(alphaMultiplier);
			
		if (colored || hasColorOffsets)
		{
			if (colorMultipliers == null)
				colorMultipliers = [];
				
			if (colorOffsets == null)
				colorOffsets = [];
				
			for (i in 0...INDICES_PER_QUAD)
			{
				if (transform != null)
				{
					colorMultipliers.push(transform.redMultiplier);
					colorMultipliers.push(transform.greenMultiplier);
					colorMultipliers.push(transform.blueMultiplier);
					
					colorOffsets.push(transform.redOffset);
					colorOffsets.push(transform.greenOffset);
					colorOffsets.push(transform.blueOffset);
					colorOffsets.push(transform.alphaOffset);
				}
				else
				{
					colorMultipliers.push(1);
					colorMultipliers.push(1);
					colorMultipliers.push(1);
					
					colorOffsets.push(0);
					colorOffsets.push(0);
					colorOffsets.push(0);
					colorOffsets.push(0);
				}
				
				colorMultipliers.push(1);
			}
>>>>>>> 78d4e25671a4774e80d0e2315c824a67e3509524
		}
	}

	override function get_numVertices():Int
	{
		return Std.int(vertices.length / 2);
	}

	override function get_numTriangles():Int
	{
		return Std.int(indices.length / 3);
	}
	@:noCompletion
	inline function get_verticesPosition():Int
	{
		return vertices.length;
	}
	
	@:noCompletion
	inline function get_indicesPosition():Int
	{
		return indices.length;
	}
	
	@:noCompletion
	inline function get_colorsPosition():Int
	{
		return 0;
	}
}