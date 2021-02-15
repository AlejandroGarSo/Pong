import processing.sound.*;

int msize, pa, pb, rh, rw, posa, posb, mova, movb, csize, bx, by, poscx, poscy;
SoundFile sfx;


void setup(){
  size(600,400);
  msize = 25;
  rh = 60;
  rw = 15;
  mova = 0;
  movb = 0;
  posa = height/2-rh/2;
  posb = height/2-rh/2;
  pa = 0;
  pb = 0;
  csize = 10;
  bx = 1;
  by = 1;
  poscx = width/2;
  poscy = int(random(1,height-1));
  base();
  sfx = new SoundFile(this,"Yamaha-TG100-Ocarina-C5.wav");
}

void draw(){
  if(pa == 9){
    mova = 0;
    movb = 0;
    bx = 0;
    by = 0;
    background(0);
    textSize(26);
    text("JUGADORx 1 GANA", width/2-100,height/2);
  }else if (pb == 9){
    mova = 0;
    movb = 0;
    bx = 0;
    by = 0;
    background(0);
    textSize(26);
    text("JUGADOR 2 GANA", width/2-100,height/2);
  }else{
    base();
  }
  posa += mova;
  posb += movb;
  poscx += bx;
  poscy += by;
  if(poscx > width-csize/2){ 
    bx = -bx;
    poscx = width/2;
    poscy = int(random(1,height-1));
    pa += 1;
    thread ("sfxPlay");
  }
  if(poscx < csize/2){
    bx = -bx;
    poscx = width/2;
    poscy = int(random(1,height-1));
    pb += 1;
    thread ("sfxPlay");
  }
  if(poscy > height-csize/2 || poscy < csize/2){
    by = -by;
    thread ("sfxPlay");
  }
  if(poscx <= 10+2*rw+csize/2 && poscx >= 10+rw+csize/2 && poscy <= posa+rh && poscy >= posa){
    bx = 1;
    thread ("sfxPlay");
  }
  if(poscx >= width-20-2*rw+csize && poscx <= width-20-rw+csize && poscy <= posb+rh && poscy >= posb){
    bx = -1;
    thread ("sfxPlay");
  }
}

void base(){
  background(0,0,0);
  stroke(255,255,255);
  strokeWeight(1);
  for(int i = 0; i < height; i+=20){
    line(width/2,i+5,width/2,i+15);
  }
  rect(10+rw,posa,rw,rh);
  rect(width-20-rw,posb,rw,rh);
  circle(poscx,poscy,csize);
  marcador(pa,pb);
}

void keyPressed(){
  if(( key == 'W' )||( key =='w' )){
    if(posa <= 0){  
      mova = 0;
    }else{
      mova = -1;
    }
  }else if(( key == 'S' )||( key =='s' )){
     if(posa >= height-rh){  
      mova = 0;
    }else{
      mova = 1;
    }
  }
  
  if(key == CODED){
    if(keyCode == UP){
       if(posb <= 0){  
        movb = 0;
       }else{
        movb = -1;
       }
    }else if (keyCode == DOWN){
      if(posb >= height-rh){  
        movb = 0;
      }else{
        movb = 1;
      }
    }
  }
}
void keyReleased() {
  mova = 0;
  movb = 0;
}

void sfxPlay(){
  sfx.play();
}

void marcador(int pa, int pb){
  strokeWeight(5);
  switch(pa){
    case 1:
      draw1(0);
      break;
    case 2:
      draw2(0);
      break;
    case 3:
      draw3(0);
      break;
    case 4:
      draw4(0);
      break;
    case 5:
      draw5(0);
      break;
    case 6:
      draw6(0);
      break;
    case 7:
      draw7(0);
      break;
    case 8:
      draw8(0);
      break;
    case 9:
      draw9(0);
      break;
    case 0:
      draw0(0);
      break;
  }
  
  switch(pb){
    case 1:
      draw1(1);
      break;
    case 2:
      draw2(1);
      break;
    case 3:
      draw3(1);
      break;
    case 4:
      draw4(1);
      break;
    case 5:
      draw5(1);
      break;
    case 6:
      draw6(1);
      break;
    case 7:
      draw7(1);
      break;
    case 8:
      draw8(1);
      break;
    case 9:
      draw9(1);
      break;
    case 0:
      draw0(1);
      break;
  }

}

void draw1(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
}

void draw2(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4-msize/2,75,v*width/4-msize/2,100);
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
  line(v*width/4-msize/2,75,v*width/4+msize/2,75);
  line(v*width/4-msize/2,100,v*width/4+msize/2,100);
}

void draw3(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
  line(v*width/4-msize/2,75,v*width/4+msize/2,75);
  line(v*width/4-msize/2,100,v*width/4+msize/2,100);
}

void draw4(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4-msize/2,50,v*width/4-msize/2,75);
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,75,v*width/4+msize/2,75);
}

void draw5(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4-msize/2,50,v*width/4-msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
  line(v*width/4-msize/2,75,v*width/4+msize/2,75);
  line(v*width/4-msize/2,100,v*width/4+msize/2,100);
}

void draw6(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4-msize/2,50,v*width/4-msize/2,75);
  line(v*width/4-msize/2,75,v*width/4-msize/2,100);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
  line(v*width/4-msize/2,75,v*width/4+msize/2,75);
  line(v*width/4-msize/2,100,v*width/4+msize/2,100);
}

void draw7(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
}

void draw8(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4-msize/2,50,v*width/4-msize/2,75);
  line(v*width/4-msize/2,75,v*width/4-msize/2,100);
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
  line(v*width/4-msize/2,75,v*width/4+msize/2,75);
  line(v*width/4-msize/2,100,v*width/4+msize/2,100);
}

void draw9(int pos){
  int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4-msize/2,50,v*width/4-msize/2,75);
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
  line(v*width/4-msize/2,75,v*width/4+msize/2,75);
  line(v*width/4-msize/2,100,v*width/4+msize/2,100);
}

void draw0(int pos){
int v = 1;
  if (pos == 1) v = 3;
  line(v*width/4-msize/2,50,v*width/4-msize/2,75);
  line(v*width/4-msize/2,75,v*width/4-msize/2,100);
  line(v*width/4+msize/2,50,v*width/4+msize/2,75);
  line(v*width/4+msize/2,75,v*width/4+msize/2,100);
  line(v*width/4-msize/2,50,v*width/4+msize/2,50);
  line(v*width/4-msize/2,100,v*width/4+msize/2,100);
}
