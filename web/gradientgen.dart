library gradientgen;

import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

part 'src/color.dart';

var random = new Random();

void main() {
  CanvasElement canvas = querySelector('canvas');
  
  paint(canvas,document.body.clientWidth, document.body.clientHeight);
}

paint(CanvasElement canvas, int width, int height){
  var timer = new Stopwatch()..start();
  // canvas to fullscren
  canvas.width = width;
  canvas.height = height;
  
  var paint = canvas.getContext('2d');
  
  var grad = createGradient(paint, width, height);
    
  addStepsFirst(grad);
  
  paint.fillStyle = grad;
  paint.fillRect(0, 0, width, height);
  
  for(int i = 0; i < 9; i += 1){
    var grad = createGradient(paint, width, height);    
    addSteps(grad);
    paint.fillStyle = grad;
    paint.fillRect(0, 0, width, height);
  }
  timer.stop();
  print(timer.elapsedMilliseconds);
}

CanvasGradient createGradient(CanvasRenderingContext2D paint,
                              int width, int height){
  if(random.nextBool()){
    return paint.createLinearGradient(
      random.nextDouble()*width, random.nextDouble()*height,
      random.nextDouble()*width, random.nextDouble()*height);
  }else{
    return paint.createRadialGradient(
      random.nextDouble()*width, random.nextDouble()*height,
      random.nextDouble()*width, random.nextDouble()*width,
      random.nextDouble()*height, random.nextDouble()*height);
  }
}

addStepsFirst(var gradiant){
  for(int i = 0; i < 10; i += 1){
    gradiant.addColorStop(random.nextDouble(),
        new Color.randomSolid(random).toString());
  }
}

addSteps(var gradiant){
  for(int i = 0; i < 10; i += 1){
    gradiant.addColorStop(random.nextDouble(),
        new Color.random(random).toString());
  }
}

