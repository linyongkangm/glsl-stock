#include "demo/common.glsl"
float rectangle(vec2 point,float width,float height,vec2 st){
  vec4 bl=step(vec4(point,point+vec2(width,height)),vec4(st,st));
  float pct=bl.x*bl.y*(1.-bl.z)*(1.-bl.w);
  return pct;
}

void main(){
  vec2 st=ratioResolution(gl_FragCoord.xy,10.);
  vec3 color=vec3(0.);// 背景色
  color+=cartesianCoordinateSystem(st)*vec3(1.,0.,0.);// 绘制笛卡尔坐标系
  
  float pct=rectangle(vec2(.1,.1),2.,2.,st);
  
  color+=vec3(pct);
  
  gl_FragColor=vec4(color,1.);
}
