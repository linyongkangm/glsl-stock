#include "demo/common.glsl"

void main(){
  vec2 st=gl_FragCoord.xy/u_resolution;
  gl_FragColor=vec4(st.x,st.y,0.,1.);
}
