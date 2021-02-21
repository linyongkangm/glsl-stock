#include "demo/common.glsl"

struct Circle{
  vec2 center;
  float radius;
};

float drawCircle(inout Circle circle,inout vec2 st){
  float len=distance(st,circle.center);
  return step(len,circle.radius);
}

void main(){
  vec2 st=ratioResolution(gl_FragCoord.xy,10.);
  vec3 color=vec3(0.);// 背景色
  color+=cartesianCoordinateSystem(st)*vec3(1.,0.,0.);// 绘制笛卡尔坐标系
  
  Circle circle=Circle(vec2(1.,-1.),1.);
  float pct=drawCircle(circle,st);
  color+=vec3(pct);
  
  gl_FragColor=vec4(color,1.);
}
