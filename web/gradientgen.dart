import 'dart:html';
import 'dart:math';

void main() {
  var random = new Random();
  CanvasElement canvas = querySelector('canvas');
  CanvasRenderingContext2D paint = canvas.getContext('2d');
  
  // canvas to fullscren
  canvas.height = document.body.clientHeight;
  canvas.width = document.body.clientWidth;
}
