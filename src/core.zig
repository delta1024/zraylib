const std = @import("std");
const mem = std.mem;
const ray = @cImport(@cInclude("raylib.h"));
const t = @import("structs.zig");
const e = @import("enums.zig");
const Key = e.KeyboardKey;
const RenderTexture2D = t.RenderTexture2D;
const ConfigFlags = e.ConfigFlags;
const Image = t.Image;
const Vector2 = t.Vector2;
const Camera2D = t.Camera2D;
const Camera3D = t.Camera3D;
const Shader = t.Shader;
const VrStereoConfig = t.VrStereoConfig;

/// Initialize window and OpenGL context
pub fn initWindow(width: i32, height: i32, title: [:0]const u8) void {
    ray.InitWindow(width, height, title.ptr);
}

/// Close window and unload OpenGL context
pub const closeWindow = ray.CloseWindow;
/// Check if application should close (Key.Escape pressed or windows close icon clicked)
pub const windowShouldClose = ray.WindowShouldClose;
/// Check if window has been initialized successfully
pub const isWindowReady = ray.IsWindowReady;
/// Check if window is currently fullscreen
pub const isWindowFullscreen = ray.IsWindowFullscreen;
/// Check if window is currently hidden (only PLATFORM_DESKTOP)
pub const isWindowHidden = ray.IsWindowHidden;
/// Check if window is currently minimized (only PLATFORM_DESKTOP)
pub const isWindowMinimized = ray.IsWindowMinimized;
/// Check if window is currently maximized (only PLATFORM_DESKTOP)
pub const isWindowMaximized = ray.IsWindowMaximized;
/// Check if window is currently focused (only PLATFORM_DESKTOP)
pub const isWindowFocused = ray.IsWindowFocused;
/// Check if window has been resized last frame
pub const isWindowResized = ray.IsWindowResized;

/// Check if one specific window flag is enabled
pub fn isWindowState(flag: ConfigFlags) bool {
    return ray.IsWindowState(@intFromEnum(flag));
}
pub const ConfigOptions = packed struct(c_uint) {
    /// Set to run program in fullscreen
    fullscreen_mode: bool = false,
    /// Set to allow resizable window
    window_resizable: bool = false,
    /// Set to disable window decoration (frame and buttons)
    window_undecorated: bool = false,
    /// Set to allow transparent framebuffer
    window_transparent: bool = false,
    /// Set to try enabling MSAA 4X
    msaa_4x_hint: bool = false,
    /// Set to try enabling V-Sync on GPU
    vsync_hint: bool = false,
    /// Set to hide window
    window_hidden: bool = false,
    /// Set to allow windows running while minimized
    window_always_run: bool = false,
    /// Set to minimize window (iconify)
    window_minimized: bool = false,
    /// Set to maximize window (expanded to monitor)
    window_maximized: bool = false,
    /// Set to window non focused
    window_unfocused: bool = false,
    /// Set to window always on top
    window_topmost: bool = false,
    /// Set to support HighDPI
    window_highdpi: bool = false,
    /// Set to support mouse passthrough = false, only supported when ConfigFlags.WindowUndecorated
    window_mouse_passthrough: bool = false,
    /// Set to run program in borderless windowed mode
    borderless_windowed_mode: bool = false,
    /// Set to try enabling interlaced video format (for V3D)
    interlaced_hint: bool = false,
};
/// Set window configuration state using flags (only PLATFORM_DESKTOP)
pub fn setWindowState(flags: ConfigOptions) void {
    ray.SetWindowState(@bitCast(flags));
}
/// Clear window configuration state flags
pub fn clearWindowState(flags: ConfigOptions) void {
    ray.ClearWindowState(@bitCast(flags));
}

/// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
pub const toggleFullscreen = ray.ToggleFullscreen;
/// Toggle window state: borderless windowed (only PLATFORM_DESKTOP)
pub const toggleBorderlessWindowed = ray.ToggleBorderlessWindowed;
/// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
pub const maximizeWindow = ray.MaximizeWindow;
/// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
pub const minimizeWindow = ray.MinimizeWindow;
/// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
pub const restoreWindow = ray.RestoreWindow;
/// Set icon for window (single image, RGBA 32bit, only PLATFORM_DESKTOP)
pub fn setWindowIcon(image: Image) void {
    ray.SetWindowIcon(@bitCast(image));
}
/// Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)
pub fn setWindowIcons(images: []Image) void {
    ray.SetWindowIcons(images.ptr, @intCast(images.len));
}
/// Set title for window (only PLATFORM_DESKTOP and PLATFORM_WEB)
pub fn setWindowTitle(title: [:0]const u8) void {
    ray.SetWindowTitle(title.ptr);
}
/// Set window position on screen (only PLATFORM_DESKTOP)
pub const setWindowPosition = ray.SetWindowPosition;
/// Set monitor for the current window
pub const setWindowMonitor = ray.SetWindowMonitor;
/// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
pub const setWindowMinSize = ray.SetWindowMinSize;
/// Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
pub const setWindowMaxSize = ray.SetWindowMaxSize;
/// Set window dimensions
pub const setWindowSize = ray.SetWindowSize;
/// Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
pub const setWindowOpacity = ray.SetWindowOpacity;
/// Set window focused (only PLATFORM_DESKTOP)
pub const setWindowFocused = ray.SetWindowFocused;
/// Get native window handle
pub const getWindowHandle = ray.GetWindowHandle;
/// Get current screen width
pub fn getScreenHeight() i32 {
    return @bitCast(ray.GetScreenHeight());
}

/// Get current screen height
pub fn getScreenWidth() i32 {
    return @bitCast(ray.GetScreenWidth());
}
/// Get current render width (it considers HiDPI)
pub const getRenderWidth = ray.GetRenderWidth;
/// Get current render height (it considers HiDPI)
pub const getRenderHeight = ray.GetRenderHeight;
/// Get number of connected monitors
pub const getMonitorCount = ray.GetMonitorCount;
/// Get current connected monitor
pub const getCurrentMonitor = ray.GetCurrentMonitor;
/// Get specified monitor position
pub fn getMonitorPosition(monitor: i32) Vector2 {
    return @bitCast(ray.GetMonitorPosition(monitor));
}
/// Get specified monitor width (current video mode used by monitor)
pub const getMonitorWidth = ray.GetMonitorWidth;
/// Get specified monitor height (current video mode used by monitor)
pub const getMonitorHeight = ray.GetMonitorHeight;
/// Get specified monitor physical width in millimetres
pub const getMonitorPhysicalWidth = ray.GetMonitorPhysicalWidth;
/// Get specified monitor physical height in millimetres
pub const getMonitorPhysicalHeight = ray.GetMonitorPhysicalHeight;
/// Get specified monitor refresh rate
pub const getMonitorRefreshRate = ray.GetMonitorRefreshRate;
/// Get window position XY on monitor
pub const getWindowPosition = ray.GetWindowPosition;
/// Get window scale DPI factor
pub const getWindowScaleDPI = ray.GetWindowScaleDPI;
/// Get the human-readable, UTF-8 encoded name of the specified monitor
pub fn getMonitorName(monitor: i32) [:0]const u8 {
    const ptr: [*:0]const u8 = @ptrCast(ray.GetMonitorName(monitor));
    return ptr[0..std.mem.indexOfSentinel(u8, 0, ptr) :0];
}
// void SetClipboardText(const char *text);                    // Set clipboard text content
pub fn setClipboardText(text: [:0]const u8) void {
    ray.SetClipboardText(text.ptr);
}
/// Get clipboard text content
pub fn getClipboardText() [:0]const u8 {
    const ptr: [*:0]const u8 = @ptrCast(ray.GetClipboardText());
    return ptr[0..std.mem.indexOfSentinel(u8, 0, ptr) :0];
}
/// Enable waiting for events on endDrawing(), no automatic event polling
pub const enableEventWaiting = ray.EnableEventWaiting;
/// Disable waiting for events on endDrawing(), automatic events polling
pub const disableEventWaiting = ray.DisableEventWaiting;

/// Shows cursor
pub const showCursor = ray.ShowCursor;
/// Hides cursor
pub const hideCursor = ray.HideCursor;
/// Check if cursor is not visible
pub const isCursorHidden = ray.IsCursorHidden;
/// Enables cursor (unlock cursor)
pub const enableCursor = ray.EnableCursor;
/// Disables cursor (lock cursor)
pub const disableCursor = ray.DisableCursor;
/// Check if cursor is on the screen
pub const isCursorOnScreen = ray.IsCursorOnScreen;

/// Set background color (framebuffer clear color)
pub fn clearBackground(color: t.Color) void {
    ray.ClearBackground(@bitCast(color));
}
/// Setup canvas (framebuffer) to start drawing
pub const beginDrawing = ray.BeginDrawing;
/// End canvas drawing and swap buffers (double buffering)
pub const endDrawing = ray.EndDrawing;
// // Drawing-related functions
/// Begin 2D mode with custom camera (2D)
pub fn beginMode2D(camera: Camera2D) void {
    ray.BeginMode2D(@bitCast(camera));
}
/// Ends 2D mode with custom camera
pub const endMode2D = ray.EndMode2D;
/// Begin 3D mode with custom camera (3D)
pub fn beginMode3D(camera: Camera3D) void {
    ray.BeginMode3D(@bitCast(camera));
}
/// Ends 3D mode and returns to default 2D orthographic mode
pub const endMode3D = ray.EndMode3D;
/// Begin drawing to render texture
pub fn beginTextureMode(target: RenderTexture2D) void {
    ray.BeginTextureMode(@bitCast(target));
}
/// Ends drawing to render texture
pub const endTextureMode = ray.EndTextureMode;
/// Begin custom shader drawing
pub fn beginShaderMode(shader: Shader) void {
    ray.BeginShaderMode(@bitCast(shader));
}
/// End custom shader drawing (use default shader)
pub const endShaderMode = ray.EndShaderMode;

/// Begin blending mode (alpha, additive, multiplied, subtract, custom)
pub const beginBlendMode = ray.BeginBlendMode;
/// End blending mode (reset to default: alpha blending)
pub const endBlendMode = ray.EndBlendMode;
/// Begin scissor mode (define screen area for following drawing)
pub const beginScissorMode = ray.BeginScissorMode;
/// End scissor mode
pub const endScissorMode = ray.EndScissorMode;
/// Begin stereo rendering (requires VR simulator)
pub fn beginVrStereoMode(config: VrStereoConfig) void {
    ray.BeginVrStereoMode(@bitCast(config));
}
/// End stereo rendering (requires VR simulator)
pub const endVrStereoMode = ray.EndVrStereoMode;

// // VR stereo config functions for VR simulator
// VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);     // Load VR stereo config for VR simulator device parameters
// void UnloadVrStereoConfig(VrStereoConfig config);           // Unload VR stereo config
//
// // Shader management functions
// // NOTE: Shader functionality is not available on OpenGL 1.1
// Shader LoadShader(const char *vsFileName, const char *fsFileName);   // Load shader from files and bind default locations
// Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode); // Load shader from code strings and bind default locations
// bool IsShaderReady(Shader shader);                                   // Check if a shader is ready
// int GetShaderLocation(Shader shader, const char *uniformName);       // Get shader uniform location
// int GetShaderLocationAttrib(Shader shader, const char *attribName);  // Get shader attribute location
// void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType);               // Set shader uniform value
// void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count);   // Set shader uniform value vector
// void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);         // Set shader uniform value (matrix 4x4)
// void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture); // Set shader uniform value for texture (sampler2d)
// void UnloadShader(Shader shader);                                    // Unload shader from GPU memory (VRAM)
//
// // Screen-space-related functions
// Ray GetMouseRay(Vector2 mousePosition, Camera camera);      // Get a ray trace from mouse position
// Matrix GetCameraMatrix(Camera camera);                      // Get camera transform matrix (view matrix)
// Matrix GetCameraMatrix2D(Camera2D camera);                  // Get camera 2d transform matrix
// Vector2 GetWorldToScreen(Vector3 position, Camera camera);  // Get the screen space position for a 3d world space position
// Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera); // Get the world space position for a 2d camera screen space position
// Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height); // Get size position for a 3d world space position
// Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera); // Get the screen space position for a 2d camera world space position
//
// // Timing-related functions
/// Set target FPS (maximum)
pub fn setTargetFps(fps: i32) void {
    ray.SetTargetFPS(fps);
}
/// Get time in seconds for last frame drawn (delta time)
pub const getFrameTime = ray.GetFrameTime;
/// Get elapsed time in seconds since InitWindow()
pub const getTime = ray.GetTime;
/// Get current FPS
pub const getFPS = ray.GetFPS;
//
// // Custom frame control functions
// // NOTE: Those functions are intended for advance users that want full control over the frame processing
// // By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// // To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
/// Swap back buffer with front buffer (screen drawing)
pub const swapScreenBuffer = ray.SwapScreenBuffer;
/// Register all input events
pub const pollInputEvents = ray.PollInputEvents;
/// Wait for some time (halt program execution)
pub const waitTime = ray.WaitTime;
//
// // Random values generation functions
/// Set the seed for the random number generator
pub const setRandomSeed = ray.SetRandomSeed;
/// Get a random value between min and max (both included)
pub const getRandomValue = ray.GetRandomValue;
// int *LoadRandomSequence(unsigned int count, int min, int max); // Load random values sequence, no values repeated
// void UnloadRandomSequence(int *sequence);                   // Unload random values sequence
//
// // Misc. functions
// void TakeScreenshot(const char *fileName);                  // Takes a screenshot of current screen (filename extension defines format)
// void SetConfigFlags(unsigned int flags);                    // Setup init configuration flags (view FLAGS)
// void OpenURL(const char *url);                              // Open URL with default system browser (if available)
//
// // NOTE: Following functions implemented in module [utils]
// //------------------------------------------------------------------
// void TraceLog(int logLevel, const char *text, ...);         // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
// void SetTraceLogLevel(int logLevel);                        // Set the current threshold (minimum) log level
// void *MemAlloc(unsigned int size);                          // Internal memory allocator
// void *MemRealloc(void *ptr, unsigned int size);             // Internal memory reallocator
// void MemFree(void *ptr);                                    // Internal memory free
//
// // Set custom callbacks
// // WARNING: Callbacks setup is intended for advance users
// void SetTraceLogCallback(TraceLogCallback callback);         // Set custom trace log
// void SetLoadFileDataCallback(LoadFileDataCallback callback); // Set custom file binary data loader
// void SetSaveFileDataCallback(SaveFileDataCallback callback); // Set custom file binary data saver
// void SetLoadFileTextCallback(LoadFileTextCallback callback); // Set custom file text data loader
// void SetSaveFileTextCallback(SaveFileTextCallback callback); // Set custom file text data saver
//
// // Files management functions
// unsigned char *LoadFileData(const char *fileName, int *dataSize); // Load file data as byte array (read)
// void UnloadFileData(unsigned char *data);                   // Unload file data allocated by LoadFileData()
// bool SaveFileData(const char *fileName, void *data, int dataSize); // Save data to file from byte array (write), returns true on success
// bool ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName); // Export data to code (.h), returns true on success
// char *LoadFileText(const char *fileName);                   // Load text data from file (read), returns a '\0' terminated string
// void UnloadFileText(char *text);                            // Unload file text data allocated by LoadFileText()
// bool SaveFileText(const char *fileName, char *text);        // Save text data to file (write), string must be '\0' terminated, returns true on success
// //------------------------------------------------------------------
//
// // File system functions
// bool FileExists(const char *fileName);                      // Check if file exists
// bool DirectoryExists(const char *dirPath);                  // Check if a directory path exists
// bool IsFileExtension(const char *fileName, const char *ext); // Check file extension (including point: .png, .wav)
// int GetFileLength(const char *fileName);                    // Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
// const char *GetFileExtension(const char *fileName);         // Get pointer to extension for a filename string (includes dot: '.png')
// const char *GetFileName(const char *filePath);              // Get pointer to filename for a path string
// const char *GetFileNameWithoutExt(const char *filePath);    // Get filename string without extension (uses static string)
// const char *GetDirectoryPath(const char *filePath);         // Get full path for a given fileName with path (uses static string)
// const char *GetPrevDirectoryPath(const char *dirPath);      // Get previous directory path for a given path (uses static string)
// const char *GetWorkingDirectory(void);                      // Get current working directory (uses static string)
// const char *GetApplicationDirectory(void);                  // Get the directory of the running application (uses static string)
// bool ChangeDirectory(const char *dir);                      // Change working directory, return true on success
// bool IsPathFile(const char *path);                          // Check if a given path is a file or a directory
// FilePathList LoadDirectoryFiles(const char *dirPath);       // Load directory filepaths
// FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, bool scanSubdirs); // Load directory filepaths with extension filtering and recursive directory scan
// void UnloadDirectoryFiles(FilePathList files);              // Unload filepaths
// bool IsFileDropped(void);                                   // Check if a file has been dropped into window
// FilePathList LoadDroppedFiles(void);                        // Load dropped filepaths
// void UnloadDroppedFiles(FilePathList files);                // Unload dropped filepaths
// long GetFileModTime(const char *fileName);                  // Get file modification time (last write time)
//
// // Compression/Encoding functionality
// unsigned char *CompressData(const unsigned char *data, int dataSize, int *compDataSize);        // Compress data (DEFLATE algorithm), memory must be MemFree()
// unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize);  // Decompress data (DEFLATE algorithm), memory must be MemFree()
// char *EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize);               // Encode data to Base64 string, memory must be MemFree()
// unsigned char *DecodeDataBase64(const unsigned char *data, int *outputSize);                    // Decode Base64 string data, memory must be MemFree()
//
// // Automation events functionality
// AutomationEventList LoadAutomationEventList(const char *fileName);                // Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
// void UnloadAutomationEventList(AutomationEventList *list);                        // Unload automation events list from file
// bool ExportAutomationEventList(AutomationEventList list, const char *fileName);   // Export automation events list as text file
// void SetAutomationEventList(AutomationEventList *list);                           // Set automation event list to record to
// void SetAutomationEventBaseFrame(int frame);                                      // Set automation event internal base frame to start recording
/// Start recording automation events (AutomationEventList must be set)
pub const startAutomationEventRecording = ray.StartAutomationEventRecording;
/// Stop recording automation events
pub const stopAutomationEventRecording = ray.StopAutomationEventRecording;
// void PlayAutomationEvent(AutomationEvent event);                                  // Play a recorded automation event
//
// //------------------------------------------------------------------------------------
// // Input Handling Functions (Module: core)
// //------------------------------------------------------------------------------------
//

/// Check if a key has been pressed once
pub fn isKeyPressed(k: Key) bool {
    return ray.IsKeyPressed(@intFromEnum(k));
}

// bool IsKeyPressedRepeat(int key);                       // Check if a key has been pressed again (Only PLATFORM_DESKTOP)

/// Check if a key is being pressed
pub fn isKeyDown(k: Key) bool {
    return ray.IsKeyDown(@intFromEnum(k));
}

/// Check if a key has been released once
pub fn isKeyReleased(k: Key) bool {
    return ray.IsKeyReleased(@intFromEnum(k));
}

/// Check if a key is NOT being pressed
pub fn isKeyUp(k: Key) bool {
    return ray.IsKeyUp(@intFromEnum(k));
}

/// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
pub const getKeyPressed = ray.GetKeyPressed;
/// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
pub const getCharPressed = ray.GetCharPressed;
// void SetExitKey(int key);                               // Set a custom key to exit program (default is ESC)
//
// // Input-related functions: gamepads
// bool IsGamepadAvailable(int gamepad);                   // Check if a gamepad is available
// const char *GetGamepadName(int gamepad);                // Get gamepad internal name id
// bool IsGamepadButtonPressed(int gamepad, int button);   // Check if a gamepad button has been pressed once
// bool IsGamepadButtonDown(int gamepad, int button);      // Check if a gamepad button is being pressed
// bool IsGamepadButtonReleased(int gamepad, int button);  // Check if a gamepad button has been released once
// bool IsGamepadButtonUp(int gamepad, int button);        // Check if a gamepad button is NOT being pressed
/// Get the last gamepad button pressed
pub const getGamepadButtonPressed = ray.GetGamepadButtonPressed;
// int GetGamepadAxisCount(int gamepad);                   // Get gamepad axis count for a gamepad
// float GetGamepadAxisMovement(int gamepad, int axis);    // Get axis movement value for a gamepad axis
// int SetGamepadMappings(const char *mappings);           // Set internal gamepad mappings (SDL_GameControllerDB)
//
// // Input-related functions: mouse
// bool IsMouseButtonPressed(int button);                  // Check if a mouse button has been pressed once
// bool IsMouseButtonDown(int button);                     // Check if a mouse button is being pressed
// bool IsMouseButtonReleased(int button);                 // Check if a mouse button has been released once
// bool IsMouseButtonUp(int button);                       // Check if a mouse button is NOT being pressed
/// Get mouse position X
pub const getMouseX = ray.GetMouseX;
/// Get mouse position Y
pub const getMouseY = ray.GetMouseY;
// Vector2 GetMousePosition(void);                         // Get mouse position XY
// Vector2 GetMouseDelta(void);                            // Get mouse delta between frames
// void SetMousePosition(int x, int y);                    // Set mouse position XY
// void SetMouseOffset(int offsetX, int offsetY);          // Set mouse offset
// void SetMouseScale(float scaleX, float scaleY);         // Set mouse scaling
/// Get mouse wheel movement for X or Y, whichever is larger
pub const getMouseWheelMove = ray.GetMouseWheelMove;
// Vector2 GetMouseWheelMoveV(void);                       // Get mouse wheel movement for both X and Y
// void SetMouseCursor(int cursor);                        // Set mouse cursor
//
// // Input-related functions: touch
/// Get touch position X for touch point 0 (relative to screen size)
pub const getTouchX = ray.GetTouchX;
/// Get touch position Y for touch point 0 (relative to screen size)
pub const getTouchY = ray.GetTouchY;
// Vector2 GetTouchPosition(int index);                    // Get touch position XY for a touch point index (relative to screen size)
/// Get touch point identifier for given index
pub const getTouchPointId = ray.GetTouchPointId;
/// Get number of touch points
pub const getTouchPointCount = ray.GetTouchPointCount;
//
// //------------------------------------------------------------------------------------
// // Gestures and Touch Handling Functions (Module: rgestures)
// //------------------------------------------------------------------------------------
// void SetGesturesEnabled(unsigned int flags);      // Enable a set of gestures using flags
// bool IsGestureDetected(unsigned int gesture);     // Check if a gesture have been detected
/// Get latest detected gesture
pub const getGestureDetected = ray.GetGestureDetected;
/// Get gesture hold time in milliseconds
pub const getGestureHoldDuration = ray.GetGestureHoldDuration;
// Vector2 GetGestureDragVector(void);               // Get gesture drag vector
/// Get gesture drag angle
pub const getGestureDragAngle = ray.GetGestureDragAngle;
// Vector2 GetGesturePinchVector(void);              // Get gesture pinch delta
/// Get gesture pinch angle
pub const getGesturePinchAngle = ray.GetGesturePinchAngle;
//
// //------------------------------------------------------------------------------------
// // Camera System Functions (Module: rcamera)
// //------------------------------------------------------------------------------------
// void UpdateCamera(Camera *camera, int mode);      // Update camera position for selected mode
// void UpdateCameraPro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom); // Update camera movement/rotation
