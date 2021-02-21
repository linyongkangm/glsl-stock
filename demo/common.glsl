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
  float pct=max(smoothstep(.05,0.,abs(st.y)),smoothstep(.05,0.,abs(st.x)));
  return pct;
}