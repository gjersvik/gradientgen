import 'dart:html';
import 'dart:math';

var random = new Random();

void main() {
  CanvasElement canvas = querySelector('canvas');
  
  paint(canvas,document.body.clientWidth, document.body.clientHeight);
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
    gradiant.addColorStop(random.nextDouble(), genColor());
  }
}

addSteps(var gradiant){
  for(int i = 0; i < 10; i += 1){
    gradiant.addColorStop(random.nextDouble(), genColorAlfa());
  }
}

String genColor(){
  var r = (random.nextDouble() * 256).floor();
  var g = (random.nextDouble() * 256).floor();
  var b = (random.nextDouble() * 256).floor();
  return 'rgb($r,$g,$b)';
}

String genColorAlfa(){
  var r = (random.nextDouble() * 256).floor();
  var g = (random.nextDouble() * 256).floor();
  var b = (random.nextDouble() * 256).floor();
  var a = random.nextDouble();
  return 'rgba($r,$g,$b,${a.toStringAsFixed(5)})';
}

