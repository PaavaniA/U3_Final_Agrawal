class Particle 
{
  PVector location, velocity, acceleration;
  float bounce = -0.5;
  int falls = 0;

  Particle (PVector loc, PVector acc) 
  {
    location = loc;
    velocity = new PVector();
    acceleration = acc;
  }

  void move() 
  {
    //Move() makes the particles fall
    stroke(50, 175, 255);
    point(location.x, location.y, location.z);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void changeVelocity (float drops) 
    //Makes the particles bounce and split
  {
    if (location.y > box-drops) falls++;
    {
      if (location.y > box-drops && falls == 1) 
      {
        acceleration = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
      }
    }
  }

  void applyForce (PVector force) 
  {
    acceleration.add(PVector.div(force, 1));
  }

  void Limit(float drops) 
    //Keeps the particles from bouncing outside of the box
  {
    if (location.x < -box) 
    { 
      velocity.x *= bounce; 
      location.x = -box;
    }
    if (location.x > box) 
    { 
      velocity.x *= bounce; 
      location.x = box;
    }

    if (location.y < -box) 
    { 
      velocity.y *= bounce; 
      location.y = -box;
    }
    if (location.y > box-drops) 
    { 
      velocity.y *= bounce; 
      location.y = box-drops;
    }

    if (location.z < -box) 
    { 
      velocity.z *= bounce; 
      location.z = -box;
    }
    if (location.z > box) 
    { 
      velocity.z *= bounce; 
      location.z = box;
    }
  }
}