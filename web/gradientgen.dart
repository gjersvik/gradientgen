library gradientgen;

import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

part 'src/color.dart';

var random = new Random();

void main() {
  var button = querySelector('.refresh');
  button.onClick.listen(refresh);
  
  querySelectorAll('.help').onClick.listen(help);
  
  refresh();
}

help([_]){
  var style = querySelectorAll('.helptext').style;
  if(style.display == 'none'){
    style.display = 'block';
  }else{
    style.display = 'none';
  };
}

refresh([_]){
  var timer = new Stopwatch()..start();
  var width = document.body.clientWidth * window.devicePixelRatio;
  width = width.toInt();
  var height = document.body.clientHeight * window.devicePixelRatio;
  height = height.toInt();
  
  CanvasElement canvas = new CanvasElement();
  paint(canvas, width, height);
  ImageElement pic = querySelector('.pic');
  var beforeSave = timer.elapsedMilliseconds;
  pic.src = canvas.toDataUrl();
  
  timer.stop();
  print("$beforeSave:${timer.elapsedMilliseconds}");
}

paint(CanvasElement canvas, int width, int height){
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

