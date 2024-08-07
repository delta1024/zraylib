const std = @import("std");
const ray = @cImport(@cInclude("raylib.h"));
const rty = @import("structs.zig");
const Color = rty.Color;
const Vector2 = rty.Vector2;
const Rectangle = rty.Rectangle;
/// Draw a pixel
pub fn drawPixel(pos_x: i32, pos_y: i32, color: Color) void {
    ray.DrawPixel(pos_x, pos_y, @bitCast(color));
}
// // NOTE: It can be useful when using basic shapes and one single font,
// // defining a font char white rectangle would allow drawing everything in a single draw call
// void SetShapesTexture(Texture2D texture, Rectangle source);       // Set texture and rectangle to be used on shapes drawing
//
// // Basic shapes drawing functions
// void DrawPixelV(Vector2 position, Color color);                                                    // Draw a pixel (Vector version)
// void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);                // Draw a line
// void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);                                     // Draw a line (using gl lines)
// void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);                       // Draw a line (using triangles/quads)
// void DrawLineStrip(Vector2 *points, int pointCount, Color color);                                  // Draw lines sequence (using gl lines)
// void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);                   // Draw line segment cubic-bezier in-out interpolation
// void DrawCircle(int centerX, int centerY, float radius, Color color);                              // Draw a color-filled circle
// void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);      // Draw a piece of a circle
// void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color); // Draw circle sector outline
// void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);       // Draw a gradient-filled circle
/// Draw a color-filled circle (Vector version)
pub fn drawCircleV(center: Vector2, radius: f32, color: Color) void {
    ray.DrawCircleV(@bitCast(center), radius, @bitCast(color));
}
/// Draw circle outline
pub fn drawCircleLines(center_x: i32, center_y: i32, radius: f32, color: Color) void {
    ray.DrawCircleLines(center_x, center_y, radius, @bitCast(color));
}
// void DrawCircleLinesV(Vector2 center, float radius, Color color);                                  // Draw circle outline (Vector version)
// void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);             // Draw ellipse
// void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);        // Draw ellipse outline
// void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color); // Draw ring
// void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);    // Draw ring outline

/// Draw a color-filled rectangle
pub fn drawRectangle(pos_x: i32, pos_y: i32, width: i32, height: i32, color: Color) void {
    ray.DrawRectangle(pos_x, pos_y, width, height, @bitCast(color));
}
/// Draw a color-filled rectangle (Vector version)
pub fn drawRectangleV(position: Vector2, size: Vector2, color: Color) void {
    ray.DrawRectangleV(@bitCast(position), @bitCast(size), @bitCast(color));
}
/// Draw a color-filled rectangle
pub fn drawRectangleRec(rec: Rectangle, color: Color) void {
    ray.DrawRectangleRec(@bitCast(rec), @bitCast(color));
}
// void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);                 // Draw a color-filled rectangle with pro parameters
pub fn drawRectanglePro(rec: Rectangle, origin: Vector2, rotation: f32, color: Color) void {
    ray.DrawRectanglePro(@bitCast(rec), @bitCast(origin), rotation, @bitCast(color));
}
// void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);// Draw a vertical-gradient-filled rectangle
// void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);// Draw a horizontal-gradient-filled rectangle
// void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);       // Draw a gradient-filled rectangle with custom vertex colors
// void DrawRectangleLines(int posX, int posY, int width, int height, Color color);                   // Draw rectangle outline
// void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);                            // Draw rectangle outline with extended parameters
// void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);              // Draw rectangle with rounded edges
// void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color); // Draw rectangle with rounded edges outline
/// Draw a color-filled triangle (vertex in counter-clockwise order!)
pub fn drawTriangle(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void {
    ray.DrawTriangle(@bitCast(v1), @bitCast(v2), @bitCast(v3), @bitCast(color));
}
// void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                           // Draw triangle outline (vertex in counter-clockwise order!)
// void DrawTriangleFan(Vector2 *points, int pointCount, Color color);                                // Draw a triangle fan defined by points (first vertex is the center)
// void DrawTriangleStrip(Vector2 *points, int pointCount, Color color);                              // Draw a triangle strip defined by points
// void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);               // Draw a regular polygon (Vector version)
// void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);          // Draw a polygon outline of n sides
// void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color); // Draw a polygon outline of n sides with extended parameters
//
// // Splines drawing functions
// void DrawSplineLinear(Vector2 *points, int pointCount, float thick, Color color);                  // Draw spline: Linear, minimum 2 points
// void DrawSplineBasis(Vector2 *points, int pointCount, float thick, Color color);                   // Draw spline: B-Spline, minimum 4 points
// void DrawSplineCatmullRom(Vector2 *points, int pointCount, float thick, Color color);              // Draw spline: Catmull-Rom, minimum 4 points
// void DrawSplineBezierQuadratic(Vector2 *points, int pointCount, float thick, Color color);         // Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
// void DrawSplineBezierCubic(Vector2 *points, int pointCount, float thick, Color color);             // Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
// void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color);                    // Draw spline segment: Linear, 2 points
// void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color); // Draw spline segment: B-Spline, 4 points
// void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color); // Draw spline segment: Catmull-Rom, 4 points
// void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color); // Draw spline segment: Quadratic Bezier, 2 points, 1 control point
// void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color); // Draw spline segment: Cubic Bezier, 2 points, 2 control points
//
// // Spline segment point evaluation functions, for a given t [0.0f .. 1.0f]
// Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t);                           // Get (evaluate) spline point: Linear
// Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);              // Get (evaluate) spline point: B-Spline
// Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);         // Get (evaluate) spline point: Catmull-Rom
// Vector2 GetSplinePointBezierQuad(Vector2 p1, Vector2 c2, Vector2 p3, float t);                     // Get (evaluate) spline point: Quadratic Bezier
// Vector2 GetSplinePointBezierCubic(:Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t);        // Get (evaluate) spline point: Cubic Bezier
//
// // Basic shapes collision detection functions

/// Check collision between two rectangles
pub fn checkCollisionRecs(rec1: Rectangle, rec2: Rectangle) bool {
    return ray.CheckCollisionRecs(@bitCast(rec1), @bitCast(rec2));
}

// bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);        // Check collision between two circles
pub fn checkCollisionCircles(center_1: Vector2, radius_1: f32, center_2: Vector2, radius_2: f32) bool {
    return ray.CheckCollisionCircles(@bitCast(center_1), radius_1, @bitCast(center_2), radius_2);
}
/// Check collision between circle and rectangle
pub fn checkCollisionCircleRec(center: Vector2, radius: f32, rec: Rectangle) bool {
    return ray.CheckCollisionCircleRec(@bitCast(center), radius, @bitCast(rec));
}
// bool CheckCollisionPointRec(Vector2 point, Rectangle rec);                                         // Check if point is inside rectangle
// bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);                       // Check if point is inside circle
// bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);               // Check if point is inside a triangle
// bool CheckCollisionPointPoly(Vector2 point, Vector2 *points, int pointCount);                      // Check if point is within a polygon described by array of vertices
// bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint); // Check the collision between two lines defined by two points each, returns collision point by reference
pub fn checkCollisionLines(start_pos1: Vector2, end_pos1: Vector2, start_pos2: Vector2, end_pos2: Vector2) ?Vector2 {
    var out: ray.Vector2 = undefined;
    if (ray.CheckCollisionLines(@bitCast(start_pos1), @bitCast(end_pos1), @bitCast(start_pos2), @bitCast(end_pos2), &out))
        return @bitCast(out);
    return null;
}
/// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
pub fn checkCollisionPointLine(point: Vector2, p1: Vector2, p2: Vector2, threshold: i32) bool {
    return ray.CheckCollisionPointLine(@bitCast(point), @bitCast(p1), @bitCast(p2), threshold);
}

/// Get collision rectangle for two rectangles collision
pub fn getCollisionRec(rec1: Rectangle, rec2: Rectangle) Rectangle {
    return @bitCast(ray.GetCollisionRec(@bitCast(rec1), @bitCast(rec2)));
}
