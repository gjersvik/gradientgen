import 'dart:html';
import 'dart:math';

var random = new Random();

void main() {
  CanvasElement canvas = querySelector('canvas');
  CanvasRenderingContext2D paint = canvas.getContext('2d');
  
  // canvas to fullscren
  var height = canvas.height = document.body.clientHeight;
  var width = canvas.width = document.body.clientWidth;
  
  var grad = paint.createLinearGradient(
      random.nextDouble()*width, random.nextDouble()*height,
      random.nextDouble()*width, random.nextDouble()*height);
  
  grad.addColorStop(random.nextDouble(), genColor());
  grad.addColorStop(random.nextDouble(), genColor());
  grad.addColorStop(random.nextDouble(), genColor());
  grad.addColorStop(random.nextDouble(), genColor());
  grad.addColorStop(random.nextDouble(), genColor());
  grad.addColorStop(random.nextDouble(), genColor());
  grad.addColorStop(random.nextDouble(), genColor());
  
  paint.fillStyle = grad;
  paint.fillRect(0, 0, width, height);
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

