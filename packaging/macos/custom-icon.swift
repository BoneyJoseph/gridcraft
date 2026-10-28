// Original matched cobalt/violet app icon for the GridCraft community build.
// Matches the custom PdfCraft/PhotoCraft icon family; spreadsheet grid motif.
// SPDX-License-Identifier: MIT OR Apache-2.0
import AppKit
import Foundation
guard CommandLine.arguments.count == 2 else { fatalError("Usage: swift custom-icon.swift PNG_PATH") }
let n = 1024
guard let b = NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:n,pixelsHigh:n,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0),
      let ctx = NSGraphicsContext(bitmapImageRep:b) else { fatalError("Image buffer unavailable") }
func c(_ r:CGFloat,_ g:CGFloat,_ bl:CGFloat,_ alpha:CGFloat=1)->NSColor {
    NSColor(calibratedRed:r/255,green:g/255,blue:bl/255,alpha:alpha)
}
func p(_ coordinates:[CGPoint])->NSBezierPath {
    let path = NSBezierPath()
    path.move(to:coordinates[0])
    for v in coordinates.dropFirst() { path.line(to:v) }
    path.close()
    return path
}
func gradient(_ a:NSColor,_ b:NSColor,_ path:NSBezierPath,_ angle:CGFloat) {
    NSGradient(starting:a,ending:b)?.draw(in:path,angle:angle)
}
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = ctx
ctx.cgContext.clear(CGRect(x:0,y:0,width:n,height:n))
let tile = NSBezierPath(roundedRect:NSRect(x:48,y:48,width:928,height:928),xRadius:211,yRadius:211)
NSGraphicsContext.saveGraphicsState()
let shadow = NSShadow()
shadow.shadowColor = .black.withAlphaComponent(0.25)
shadow.shadowBlurRadius = 34
shadow.shadowOffset = NSSize(width:0,height:-15)
shadow.set()
c(33,72,185).setFill()
tile.fill()
NSGraphicsContext.restoreGraphicsState()
gradient(c(12,121,239),c(82,34,185),tile,-40)
NSGraphicsContext.saveGraphicsState()
tile.addClip()
c(165,215,255,0.16).setFill()
p([CGPoint(x:42,y:862),CGPoint(x:380,y:1014),CGPoint(x:695,y:1014),CGPoint(x:85,y:510)]).fill()
c(179,53,238,0.60).setFill()
p([CGPoint(x:500,y:20),CGPoint(x:1000,y:530),CGPoint(x:1000,y:20)]).fill()
NSGraphicsContext.restoreGraphicsState()
// Light spreadsheet document over the cobalt/violet tile.
let sheet = NSBezierPath(roundedRect:NSRect(x:227,y:208,width:568,height:602),xRadius:58,yRadius:58)
NSGraphicsContext.saveGraphicsState()
let sh=NSShadow()
sh.shadowColor=c(17,31,76,0.35)
sh.shadowBlurRadius=38
sh.shadowOffset=NSSize(width:9,height:-15)
sh.set()
c(238,247,255).setFill()
sheet.fill()
NSGraphicsContext.restoreGraphicsState()
let frame=NSBezierPath(roundedRect:NSRect(x:262,y:253,width:494,height:510),xRadius:26,yRadius:26)
gradient(c(248,253,255),c(228,235,255),frame,90)
NSGraphicsContext.saveGraphicsState()
frame.addClip()
c(181,207,239).setFill()
NSBezierPath(rect:NSRect(x:262,y:686,width:494,height:76)).fill()
NSBezierPath(rect:NSRect(x:262,y:253,width:68,height:509)).fill()
c(138,163,205,0.82).setStroke()
for x in [330.0,437.0,544.0,651.0] {
    let line=NSBezierPath()
    line.move(to:NSPoint(x:x,y:253))
    line.line(to:NSPoint(x:x,y:762))
    line.lineWidth=5
    line.stroke()
}
for y in [344.0,430.0,516.0,602.0,686.0] {
    let line=NSBezierPath()
    line.move(to:NSPoint(x:262,y:y))
    line.line(to:NSPoint(x:756,y:y))
    line.lineWidth=5
    line.stroke()
}
gradient(c(146,198,253),c(175,136,246),NSBezierPath(rect:NSRect(x:438,y:433,width:106,height:82)),90)
c(57,87,198).setStroke()
let selection=NSBezierPath(rect:NSRect(x:437,y:430,width:108,height:86))
selection.lineWidth=9
selection.stroke()
for (x,h) in [(352.0,48.0),(459.0,73.0),(566.0,40.0),(673.0,66.0)] {
    gradient(c(46,132,232,0.92),c(128,69,207,0.93),
        NSBezierPath(roundedRect:NSRect(x:x,y:267,width:45,height:h),xRadius:7,yRadius:7),90)
}
NSGraphicsContext.restoreGraphicsState()
c(255,255,255,0.75).setStroke()
sheet.lineWidth=8
sheet.stroke()
// Matched violet corner ribbon.
NSGraphicsContext.saveGraphicsState()
tile.addClip()
gradient(c(153,52,244,0.94),c(72,34,188,0.95),
    p([CGPoint(x:575,y:49),CGPoint(x:975,y:440),CGPoint(x:975,y:242),CGPoint(x:780,y:49)]),-36)
NSGraphicsContext.restoreGraphicsState()
ctx.flushGraphics()
NSGraphicsContext.restoreGraphicsState()
guard let data=b.representation(using:.png,properties:[:]) else {fatalError("PNG encoding failed")}
try data.write(to:URL(fileURLWithPath:CommandLine.arguments[1]),options:.atomic)
