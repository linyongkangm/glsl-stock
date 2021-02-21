#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 ratioResolution(vec2 xy,float ratio){
  float longSide=max(u_resolution.x,u_resolution.y);
  vec2 st=xy/vec2(longSide);// 规整长边[0,1]，按比例调整短边[0, <=1]
  st=st-(u_resolution/longSide/2.);// 平移(0,0)到屏幕中间
  st=st*ratio;// 放大
  return st;
}

// 笛卡尔坐标系
float cartesianCoordinateSystem(vec2 st){
  float pct=smoothstep(.05,0.,abs(st.y))+smoothstep(.05,0.,abs(st.x));
  return pct;
}

void main(){
  vec2 st=gl_FragCoord.xy/u_resolution.xy;
  vec3 color=vec3(0.);
  
  // bottom-left
  vec2 bl=step(vec2(.1),st);
  float pct=bl.x*bl.y;
  
  // top-right
  vec2 tr=step(vec2(.1),1.-st);
  pct*=tr.x*tr.y;
  
  color=vec3(pct);
  
  gl_FragColor=vec4(color,1.);
}
