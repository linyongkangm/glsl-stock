#include "demo/common.glsl"

// x=[-5.0,-5.0];y=[-5.0, 5.0]
float plot(vec2 st){
  float y=1.;
  float x=st.x;
  y=x;
  y=pow(x,2.);
  y=pow(x,.5);
  y=smoothstep(0.,1.,x);
  y=sin(x);
  y=cos(x);
  y=mod(x,.5);// 返回 x 对 0.5 取模的值
  y=fract(x);// 仅仅返回数的小数部分
  y=ceil(x);// 向正无穷取整
  y=floor(x);// 向负无穷取整
  y=sign(x);// 提取 x 的正负号
  y=abs(x);// 返回 x 的绝对值
  y=clamp(x,0.,1.);// 把 x 的值限制在 0.0 到 1.0
  y=min(0.,x);// 返回 x 和 0.0 中的较小值
  y=max(0.,x);// 返回 x 和 0.0 中的较大值
  y=log(x);// 对数函数
  float pct=smoothstep(.05,0.,abs(st.y-y));
  return pct;
}

void main(){
  vec2 st=ratioResolution(gl_FragCoord.xy,10.);
  vec3 color=vec3(0.);// 背景色
  color+=cartesianCoordinateSystem(st)*vec3(1.,0.,0.);// 绘制笛卡尔坐标系
  color+=plot(st)*vec3(0.,1.,0.);// 绘制函数曲线
  gl_FragColor=vec4(color,1.);
}
