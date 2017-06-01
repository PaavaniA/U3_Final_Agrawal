ArrayList particles = new ArrayList();

float gravity = 0.1;
float box = 200;
float sidex; 
float sidey; 
float sidez;
PVector acc;
float wave;
float waves = 50;

void setup() 
{
  size(800, 800, P3D);
  background(0);
}

void draw()
{
  background(0);
  pushMatrix();
  noFill();
  popMatrix();

  //creates box
  sidex = random(-box, box);
  sidey = -box;
  sidez = random(-box, box);
  acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  translate(width/2, height/2);
  rotateY(radians(1+mouseX/3));

  for (int i = 0; i < 50; i++) 
  {
    particles.add(new Particle(new PVector(sidex+random(2, 5), sidey+random(2, 5), sidez+random(2, 5)), acc));
  }

  for (int i = 0; i < particles.size (); i++) 
  {
    Particle water = (Particle) particles.get(i);
    water.move();
    water.applyForce(new PVector(0, gravity, 0));
    //forms waves
    wave = abs(sin(radians(water.location.x+frameCount)))*sin(radians(water.location.z+frameCount))*cos(radians(water.location.y))*waves;
    water.changeVelocity(wave);
    water.Limit(wave);
  }
}