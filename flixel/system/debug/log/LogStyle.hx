package flixel.system.debug.log;

import flixel.util.FlxSignal;
import haxe.PosInfos;

using flixel.util.FlxStringUtil;

/**
 * A class that allows you to create a custom style for `FlxG.log.advanced()`.
 * Also used internally for the pre-defined styles.
 */
class LogStyle
{
<<<<<<< HEAD
	public static var NORMAL:LogStyle = new LogStyle();
	public static var WARNING:LogStyle = new LogStyle("[WARNING] ", "D9F85C", 12, false, false, false, "flixel/sounds/beep", true);
	public static var ERROR:LogStyle = new LogStyle("[ERROR] ", "FF8888", 12, false, false, false, "flixel/sounds/beep", true);
	public static var NOTICE:LogStyle = new LogStyle("[NOTICE] ", "5CF878", 12, false);
	public static var CONSOLE:LogStyle = new LogStyle("> ", "5A96FA", 12, false);

	/**
	 * A prefix which is always attached to the start of the logged data
	 */
	public var prefix:String;

	public var color:String;
	public var size:Int;
	public var bold:Bool;
	public var italic:Bool;
	public var underlined:Bool;

	/**
	 * A sound to be played when this LogStyle is used
	 */
	public var errorSound:String;

	/**
	 * Whether the console should be forced to open when this LogStyle is used
	 */
	public var openConsole:Bool;

	/**
	 * A callback function that is called when this LogStyle is used
	 * **Note:** Unlike the deprecated `callbackFunction`, this is called every time,
	 * even when logged with `once = true` and even in release mode.
	 */
	public final onLog = new FlxTypedSignal<(data:Any, ?pos:PosInfos) -> Void>();
	/**
	 * Whether an exception is thrown when this LogStyle is used.
	 * **Note**: Unlike other log style properties, this happens even in release mode.
	 * @since 5.4.0
	 */
	public var throwException:Bool = false;
	
	/**
	 * Create a new LogStyle to be used in conjunction with `FlxG.log.advanced()`
	 *
	 * @param   prefix            A prefix which is always attached to the start of the logged data
	 * @param   color             The text color
	 * @param   size              The text size
	 * @param   bold              Whether the text is bold or not
	 * @param   italic            Whether the text is italic or not
	 * @param   underlined        Whether the text is underlined or not
	 * @param   errorSound        A sound to be played when this LogStyle is used
	 * @param   openConsole       Whether the console should be forced to open when this LogStyle is used
	 * @param   callbackFunction  A callback function that is called when this LogStyle is used
	 * @param   callback          A callback function that is called when this LogStyle is used
	 * @param   throwError        Whether an error is thrown when this LogStyle is used
	 */
	public function new(prefix = "", color = "FFFFFF", size = 12, bold = false, italic = false, underlined = false, ?errorSound:String, openConsole = false,
			?callbackFunction:() -> Void, ?callback:(Any, ?PosInfos) -> Void, throwException = false)
	{
		this.prefix = prefix;
		this.color = color;
		this.size = size;
		this.bold = bold;
		this.italic = italic;
		this.underlined = underlined;
		this.errorSound = errorSound;
		this.openConsole = openConsole;
=======
	@:deprecated("LogStyle.NORMAL is deprecated, use FlxG.log.styles.NORMAL, instead")
	public static var NORMAL (default, set):LogStyle;
	static function set_NORMAL(style:LogStyle)
	{
		@:bypassAccessor
		FlxG.log.styles.normal = style;
		return NORMAL = style;
	}
	
	@:deprecated("LogStyle.WARNING is deprecated, use FlxG.log.styles.WARNING, instead")
	public static var WARNING(default, set):LogStyle;
	static function set_WARNING(style:LogStyle)
	{
		@:bypassAccessor
		FlxG.log.styles.warning = style;
		return WARNING = style;
	}
	
	@:deprecated("LogStyle.ERROR is deprecated, use FlxG.log.styles.ERROR, instead")
	public static var ERROR  (default, set):LogStyle;
	static function set_ERROR(style:LogStyle)
	{
		@:bypassAccessor
		FlxG.log.styles.error = style;
		return ERROR = style;
	}
	
	@:deprecated("LogStyle.NOTICE is deprecated, use FlxG.log.styles.NOTICE, instead")
	public static var NOTICE (default, set):LogStyle;
	static function set_NOTICE(style:LogStyle)
	{
		@:bypassAccessor
		FlxG.log.styles.notice = style;
		return NOTICE = style;
	}
	
	@:deprecated("LogStyle.CONSOLE is deprecated, use FlxG.log.styles.CONSOLE, instead")
	public static var CONSOLE(default, set):LogStyle;
	static function set_CONSOLE(style:LogStyle)
	{
		@:bypassAccessor
		FlxG.log.styles.console = style;
		return CONSOLE = style;
	}
	
	
	public var color(get, set):String;
	inline function get_color() return this.format.getColorString();
	inline function set_color(value:String) return this.format.setColorString(value);
	
	public var size(get, set):Int;
	inline function get_size() return this.format.size;
	inline function set_size(value:Int) return this.format.size = value;
	
	public var bold(get, set):Bool;
	inline function get_bold() return this.format.bold;
	inline function set_bold(value:Bool) return this.format.bold = value;
	
	public var italic(get, set):Bool;
	inline function get_italic() return this.format.italic;
	inline function set_italic(value:Bool) return this.format.italic = value;
	
	public var underlined(get, set):Bool;
	inline function get_underlined() return this.format.underlined;
	inline function set_underlined(value:Bool) return this.format.underlined = value;
	
	
	@:deprecated("LogStyle is deprecated, use FlxLogStyle, instead")
	public function new(prefix = "", color = "FFFFFF", size = 12, bold = false, italic = false, underlined = false,
			?errorSound:String, openConsole = false, ?callbackFunction:()->Void, ?callback:(Any, ?PosInfos)->Void, throwException = false)
	{
		final format = new FlxLogFormat(FlxColor.fromString('#$color'), size, bold, italic, underlined);
		this = new FlxLogStyle(prefix, format, errorSound, openConsole, throwException);
		
		this.callbackFunction = callbackFunction;
>>>>>>> ac92853fb1359c745d7c348893dccf928daaed2c
		if (callback != null)
			onLog.add(callback);
		this.throwException = throwException;
	}
	
	/**
	 * Converts the data into a log message according to this style.
	 * 
	 * @param   data  The data being logged
	 */
	public function toLogString(data:Array<Any>)
	{
		// Format FlxPoints, Arrays, Maps or turn the data entry into a String
		final texts = new Array<String>();
		for (i in 0...data.length)
		{
			final text = Std.string(data[i]);
			
			// Make sure you can't insert html tags
			texts.push(StringTools.htmlEscape(text));
		}
		
		return prefix + texts.join(" ");
	}
	
	/**
	 * Converts the data into an html log message according to this style.
	 * 
	 * @param   data  The data being logged
	 */
	public inline function toHtmlString(data:Array<Any>)
	{
		return toLogString(data).htmlFormat(size, color, bold, italic, underlined);
	}
}
