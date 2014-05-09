part of gradientgen;

class Color{
  final int red;
  final int green;
  final int blue;
  final int alfa;
  
  const Color(this.red, this.green, this.blue, [this.alfa = 255]);
  factory Color.random([Random rand]){
    if(rand == null){
      rand = new Random();
    }
    return new Color(rand.nextInt(255), rand.nextInt(255),
        rand.nextInt(255), rand.nextInt(255));
  }
  
  factory Color.randomSolid([Random rand]){
    if(rand == null){
      rand = new Random();
    }
    return new Color(rand.nextInt(255),rand.nextInt(255),rand.nextInt(255));
  }
  
  factory Color.fromData(Uint8List d) => new Color(d[0], d[1], d[2], d[3]);
  Uint8List toData() => new Uint8List.fromList(([red, green, blue, alfa]));
  
  toString(){
    if(alfa == 255){
      return 'rgb($red,$green,$blue)';
    }else{
      var a = alfa / 256;
      return 'rgba($red,$green,$blue,${a.toStringAsFixed(5)})';
    }
  }
}