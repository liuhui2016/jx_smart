(function(){var n=this,aa=function(a){var b=typeof a;return"object"==b&&null!=a||"function"==b},ba=function(a,b,c){return a.call.apply(a.bind,arguments)},ca=function(a,b,c){if(!a)throw Error();if(2<arguments.length){var d=Array.prototype.slice.call(arguments,2);return function(){var c=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(c,d);return a.apply(b,c)}}return function(){return a.apply(b,arguments)}},q=function(a,b,c){q=Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?
ba:ca;return q.apply(null,arguments)},t=function(a,b){var c=Array.prototype.slice.call(arguments,1);return function(){var b=c.slice();b.push.apply(b,arguments);return a.apply(this,b)}},v=Date.now||function(){return+new Date},da=function(a,b){function c(){}c.prototype=b.prototype;a.Za=b.prototype;a.prototype=new c;a.Xa=function(a,c,g){for(var f=Array(arguments.length-2),h=2;h<arguments.length;h++)f[h-2]=arguments[h];return b.prototype[c].apply(a,f)}};var ea=(new Date).getTime();var w=function(a){a=parseFloat(a);return isNaN(a)||1<a||0>a?0:a},fa=function(a,b){var c=parseInt(a,10);return isNaN(c)?b:c},ga=function(a,b){return/^true$/.test(a)?!0:/^false$/.test(a)?!1:b},ha=/^([\w-]+\.)*([\w-]{2,})(\:[0-9]+)?$/,ia=function(a,b){if(!a)return b;var c=a.match(ha);return c?c[0]:b};var ja=fa("101",-1),la=fa("98",0),ma=w("0.05"),na=w("0.001"),oa=w("0.0"),pa=w(""),qa=w("0.001"),ra=ga("true",!0),sa=w(""),ta=w("0.001"),ua=w("0.001"),
va=w(""),xa=w("0.1");var ya=ga("false",!1),za=ga("false",!1),Aa=ga("false",!1),Ba=Aa||!za;var Ca=function(){return ia("","pagead2.googlesyndication.com")};var Da=String.prototype.trim?function(a){return a.trim()}:function(a){return a.replace(/^[\s\xa0]+|[\s\xa0]+$/g,"")},Ea=/&/g,Fa=/</g,Ga=/>/g,Ha=/"/g,Ia=/'/g,Ja=/\x00/g,Ka={"\x00":"\\0","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\x0B",'"':'\\"',"\\":"\\\\","<":"<"},La={"'":"\\'"},Ma=function(a,b){return a<b?-1:a>b?1:0};var Na=function(a,b){this.start=a<b?a:b;this.end=a<b?b:a};var Oa=function(a,b){this.width=a;this.height=b};Oa.prototype.floor=function(){this.width=Math.floor(this.width);this.height=Math.floor(this.height);return this};Oa.prototype.round=function(){this.width=Math.round(this.width);this.height=Math.round(this.height);return this};var Pa=function(a){Pa[" "](a);return a};Pa[" "]=function(){};var Qa=function(a){try{var b;if(b=!!a&&null!=a.location.href)a:{try{Pa(a.foo);b=!0;break a}catch(c){}b=!1}return b}catch(c){return!1}},Ra=function(a){return Qa(a.top)?a.top:null},Sa=function(a,b){var c=a.createElement("script");c.src=b;var d=a.getElementsByTagName("script")[0];return d&&d.parentNode?(d.parentNode.insertBefore(c,d),c):null},Ta=function(a,b){return b.getComputedStyle?b.getComputedStyle(a,null):a.currentStyle},y=function(a,b){if(!(1E-4>Math.random())){var c=Math.random();if(c<b)return c=
Ua(window),a[Math.floor(c*a.length)]}return null},Ua=function(a){try{var b=new Uint32Array(1);a.crypto.getRandomValues(b);return b[0]/65536/65536}catch(c){return Math.random()}},Va=function(a,b){for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&b.call(void 0,a[c],c,a)},Wa=function(a){var b=a.length;if(0==b)return 0;for(var c=305419896,d=0;d<b;d++)c^=(c<<5)+(c>>2)+a.charCodeAt(d)&4294967295;return 0<c?c:4294967296+c},Xa=/^([0-9.]+)px$/,Ya=/^(-?[0-9.]{1,30})$/,Za=function(a){return Ya.test(a)&&
(a=Number(a),!isNaN(a))?a:null},$a=function(a){return(a=Xa.exec(a))?+a[1]:null};var ab=function(a){var b;try{b=parseInt(a.localStorage.getItem("google_experiment_mod"),10)}catch(c){return null}if(0<=b&&1E3>b)return b;b=Math.floor(1E3*Ua(a));try{return a.localStorage.setItem("google_experiment_mod",""+b),b}catch(c){return null}};var bb=function(a,b,c){a.addEventListener?a.addEventListener(b,c,!1):a.attachEvent&&a.attachEvent("on"+b,c)};var eb=function(a,b,c,d,e,g){try{if((d?a.da:Math.random())<(e||a.V)){var f=a.T+b+cb(c),f=f.substring(0,2E3);"undefined"===typeof g?db(f):db(f,g)}}catch(h){}},cb=function(a){var b="";Va(a,function(a,d){if(0===a||a)b+="&"+d+"="+encodeURIComponent(String(a))});return b},db=function(a,b){n.google_image_requests||(n.google_image_requests=[]);var c=n.document.createElement("img");if(b){var d=function(a){b(a);a=d;c.removeEventListener?c.removeEventListener("load",a,!1):c.detachEvent&&c.detachEvent("onload",
a);a=d;c.removeEventListener?c.removeEventListener("error",a,!1):c.detachEvent&&c.detachEvent("onerror",a)};bb(c,"load",d);bb(c,"error",d)}c.src=a;n.google_image_requests.push(c)};var fb=function(a,b,c){this.aa=a;this.X=b;this.P=c;this.J=null;this.W=this.u;this.ja=!1},gb=function(a,b,c){this.message=a;this.fileName=b||"";this.lineNumber=c||-1},ib=function(a,b,c,d,e,g){var f;try{f=c()}catch(k){var h=a.P;try{var l=hb(k),h=(g||a.W).call(a,b,l,void 0,d)}catch(m){a.u("pAR",m)}if(!h)throw k;}finally{if(e)try{e()}catch(k){}}return f},C=function(a,b,c){var d=z;return function(){var e=arguments;return ib(d,a,function(){return b.apply(void 0,e)},void 0,c)}};
fb.prototype.u=function(a,b,c,d,e){var g={};g.context=a;b instanceof gb||(b=hb(b));g.msg=b.message.substring(0,512);b.fileName&&(g.file=b.fileName);0<b.lineNumber&&(g.line=b.lineNumber.toString());a=n.document;g.url=a.URL.substring(0,512);g.ref=a.referrer.substring(0,512);jb(this,g,d);eb(this.aa,e||this.X,g,this.ja,c);return this.P};
var jb=function(a,b,c){if(a.J)try{a.J(b)}catch(d){}if(c)try{c(b)}catch(d){}},hb=function(a){var b=a.toString();a.name&&-1==b.indexOf(a.name)&&(b+=": "+a.name);a.message&&-1==b.indexOf(a.message)&&(b+=": "+a.message);if(a.stack){var c=a.stack,d=b;try{-1==c.indexOf(d)&&(c=d+"\n"+c);for(var e;c!=e;)e=c,c=c.replace(/((https?:\/..*\/)[^\/:]*:\d+(?:.|\n)*)\2/,"$1");b=c.replace(/\n */g,"\n")}catch(g){b=d}}return new gb(b,a.fileName,a.lineNumber)};var D;a:{var kb=n.navigator;if(kb){var lb=kb.userAgent;if(lb){D=lb;break a}}D=""}var E=function(a){return-1!=D.indexOf(a)};var mb=E("Opera")||E("OPR"),G=E("Trident")||E("MSIE"),nb=E("Edge"),ob=E("Gecko")&&!(-1!=D.toLowerCase().indexOf("webkit")&&!E("Edge"))&&!(E("Trident")||E("MSIE"))&&!E("Edge"),pb=-1!=D.toLowerCase().indexOf("webkit")&&!E("Edge"),qb=function(){var a=D;if(ob)return/rv\:([^\);]+)(\)|;)/.exec(a);if(nb)return/Edge\/([\d\.]+)/.exec(a);if(G)return/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/.exec(a);if(pb)return/WebKit\/(\S+)/.exec(a)},rb=function(){var a=n.document;return a?a.documentMode:void 0},sb=function(){if(mb&&
n.opera){var a;var b=n.opera.version;try{a=b()}catch(c){a=b}return a}a="";(b=qb())&&(a=b?b[1]:"");return G&&(b=rb(),b>parseFloat(a))?String(b):a}(),tb={},ub=function(a){if(!tb[a]){for(var b=0,c=Da(String(sb)).split("."),d=Da(String(a)).split("."),e=Math.max(c.length,d.length),g=0;0==b&&g<e;g++){var f=c[g]||"",h=d[g]||"",l=RegExp("(\\d*)(\\D*)","g"),k=RegExp("(\\d*)(\\D*)","g");do{var m=l.exec(f)||["","",""],p=k.exec(h)||["","",""];if(0==m[0].length&&0==p[0].length)break;b=Ma(0==m[1].length?0:parseInt(m[1],
10),0==p[1].length?0:parseInt(p[1],10))||Ma(0==m[2].length,0==p[2].length)||Ma(m[2],p[2])}while(0==b)}tb[a]=0<=b}},vb=n.document,wb=vb&&G?rb()||("CSS1Compat"==vb.compatMode?parseInt(sb,10):5):void 0;var xb;if(!(xb=!ob&&!G)){var yb;if(yb=G)yb=9<=wb;xb=yb}xb||ob&&ub("1.9.1");G&&ub("9");var zb=document,I=window;var Ab=Object.prototype.hasOwnProperty,Bb=function(a,b){for(var c in a)Ab.call(a,c)&&b.call(void 0,a[c],c,a)},J=function(a){return!!a&&"function"==typeof a&&!!a.call},Cb=function(a,b){if(!(2>arguments.length))for(var c=1,d=arguments.length;c<d;++c)a.push(arguments[c])},K=function(a,b){if(a.indexOf){var c=a.indexOf(b);return 0<c||0===c}for(c=0;c<a.length;c++)if(a[c]===b)return!0;return!1},Db=function(a){a.google_unique_id?++a.google_unique_id:a.google_unique_id=1},Eb=function(a){a=a.google_unique_id;
return"number"==typeof a?a:0},Fb=!!window.google_async_iframe_id,Gb=/(^| )adsbygoogle($| )/,Hb={"http://googleads.g.doubleclick.net":!0,"http://pagead2.googlesyndication.com":!0,"https://googleads.g.doubleclick.net":!0,"https://pagead2.googlesyndication.com":!0},Ib=/\.google\.com(:\d+)?$/;var Jb,z;Jb=new function(){this.T="http"+("http:"==I.location.protocol?"":"s")+"://pagead2.googlesyndication.com/pagead/gen_204?id=";this.V=.01;this.da=Math.random()};z=new fb(Jb,"jserror",!0);var Kb=function(a,b,c,d){ib(z,a,c,d,void 0,b)},Lb=z.u,Mb=function(a,b,c){eb(Jb,a,b,"jserror"!=a,c,void 0)},Ob=function(a){return C("aa:reactiveTag",a,void 0)};var Pb=null,Qb=function(){if(!Pb){for(var a=window,b=a,c=0;a&&a!=a.parent;)if(a=a.parent,c++,Qa(a))b=a;else break;Pb=b}return Pb};var N={Ua:{j:"453848100",i:"453848101"},Ca:{j:"828064124",ra:"828064125",sa:"828064172",ta:"828064173"},Ba:{j:"828064127",i:"828064128"},Da:{j:"828064170",i:"828064171"},Ga:{j:"24819308",i:"24819309",ma:"24819320",qa:"24819321"},Fa:{j:"24819330",i:"24819331"},Ia:{j:"828064162",i:"828064163"},Ha:{j:"828064164",i:"828064165",ua:"828064166"},ya:{j:"86724438",i:"86724439"},za:{j:"828064190",i:"828064191"},Na:{j:"10573505",i:"10573506"},D:{j:"10573595",i:"10573596"},Ta:{j:"10573511",i:"10573512"},F:{j:"10573581",
i:"10573582"},Oa:{j:"10573531",i:"10573532"},v:{j:"10573561",i:"10573562"},Pa:{j:"10573551",i:"10573552"},Ma:{j:"312815004",i:"312815005"},C:{j:"312815104",i:"312815105"},pa:{j:"26835105",i:"26835106"},wa:{j:"35923720",i:"35923721"},G:{j:"35923760",i:"35923761"},Va:{j:"27415001",i:"27415002"},H:{j:"20040000",i:"20040001"},na:{j:"20040016",i:"20040017"},va:{j:"828064202",i:"828064203"},xa:{j:"314159284",Wa:"314159285"},Ja:{j:"19188000",i:"19188001"},Ka:{j:"20040026",i:"20040027"},La:{j:"33895410",
i:"33895411"},oa:{la:"314159230",Ea:"314159231"},Aa:{Qa:"27285692",Sa:"27285712",Ra:"27285713"}};var Rb=function(){},Tb=function(a,b,c){switch(typeof b){case "string":Sb(b,c);break;case "number":c.push(isFinite(b)&&!isNaN(b)?String(b):"null");break;case "boolean":c.push(String(b));break;case "undefined":c.push("null");break;case "object":if(null==b){c.push("null");break}if(b instanceof Array||void 0!=b.length&&b.splice){var d=b.length;c.push("[");for(var e="",g=0;g<d;g++)c.push(e),Tb(a,b[g],c),e=",";c.push("]");break}c.push("{");d="";for(e in b)b.hasOwnProperty(e)&&(g=b[e],"function"!=typeof g&&
(c.push(d),Sb(e,c),c.push(":"),Tb(a,g,c),d=","));c.push("}");break;case "function":break;default:throw Error("Unknown type: "+typeof b);}},Ub={'"':'\\"',"\\":"\\\\","/":"\\/","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","\t":"\\t","\x0B":"\\u000b"},Vb=/\uffff/.test("\uffff")?/[\\\"\x00-\x1f\x7f-\uffff]/g:/[\\\"\x00-\x1f\x7f-\xff]/g,Sb=function(a,b){b.push('"');b.push(a.replace(Vb,function(a){if(a in Ub)return Ub[a];var b=a.charCodeAt(0),e="\\u";16>b?e+="000":256>b?e+="00":4096>b&&(e+="0");return Ub[a]=
e+b.toString(16)}));b.push('"')};var Wb=null,Xb=ob||pb||mb||"function"==typeof n.atob;var Yb={google_ad_modifications:!0,google_analytics_domain_name:!0,google_analytics_uacct:!0},Zb=function(a){a.google_page_url&&(a.google_page_url=String(a.google_page_url));var b=[];Bb(a,function(a,d){if(null!=a){var e;try{var g=[];Tb(new Rb,a,g);e=g.join("")}catch(f){}e&&(e=e.replace(/\//g,"\\$&"),Cb(b,d,"=",e,";"))}});return b.join("")};var $b=function(a,b,c){Kb("files::getSrc",Lb,function(){if("https:"==I.location.protocol&&"http"==c)throw c="https",Error("Requested url "+a+b);});return[c,"://",a,b].join("")},ac=function(a,b,c){c||(c=Ba?"https":"http");return $b(a,b,c)};var bc=function(a){var b=ab(n);a=a.mods;if(isNaN(b)||!a)return!1;for(var c=0;c<a.length;c++){var d=a[c],e=d.max;if(b>=d.min&&b<=e)return!0}return!1},cc=function(a,b){a.location.href&&a.location.href.substring&&(b.url=a.location.href.substring(0,200));Mb("ama",b,.01)};var dc={overlays:1,interstitials:2,vignettes:2,inserts:3,immersives:4};var O=function(a){a=a.document;return("CSS1Compat"==a.compatMode?a.documentElement:a.body)||{}};var ec=new function(){this.ba=new Na(100,199)};var P=function(a){return(a=a.google_ad_modifications)?a.loeids||[]:[]},fc=function(a,b,c){if(!a)return null;for(var d=0;d<a.length;++d)if((a[d].ad_slot||b)==b&&(a[d].ad_tag_origin||c)==c)return a[d];return null};var gc=function(a,b,c){return I.location&&I.location.hash=="#google_plle_"+c?c:y([b,c],a)},hc=function(a,b,c,d){a=a.google_active_plles=a.google_active_plles||[];return K(P(b),c)?(a.push(c),c):K(P(b),d)?(a.push(d),d):null};var ic=null;var jc=function(a){this.s=a;a.google_iframe_oncopy||(a.google_iframe_oncopy={handlers:{},upd:q(this.ia,this)});this.fa=a.google_iframe_oncopy},kc;var R="var i=this.id,s=window.google_iframe_oncopy,H=s&&s.handlers,h=H&&H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&&d&&(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}";
/[\x00&<>"']/.test(R)&&(-1!=R.indexOf("&")&&(R=R.replace(Ea,"&amp;")),-1!=R.indexOf("<")&&(R=R.replace(Fa,"&lt;")),-1!=R.indexOf(">")&&(R=R.replace(Ga,"&gt;")),-1!=R.indexOf('"')&&(R=R.replace(Ha,"&quot;")),-1!=R.indexOf("'")&&(R=R.replace(Ia,"&#39;")),-1!=R.indexOf("\x00")&&(R=R.replace(Ja,"&#0;")));kc=R;jc.prototype.set=function(a,b){this.fa.handlers[a]=b;this.s.addEventListener&&this.s.addEventListener("load",q(this.Y,this,a),!1)};
jc.prototype.Y=function(a){a=this.s.document.getElementById(a);try{var b=a.contentWindow.document;if(a.onload&&b&&(!b.body||!b.body.firstChild))a.onload()}catch(c){}};jc.prototype.ia=function(a,b){var c=lc("rx",a),d;a:{if(a&&(d=a.match("dt=([^&]+)"))&&2==d.length){d=d[1];break a}d=""}d=(new Date).getTime()-d;c=c.replace(/&dtd=(\d+|-?M)/,"&dtd="+(1E5<=d?"M":0<=d?d:"-M"));this.set(b,c);return c};
var lc=function(a,b){var c=new RegExp("\\b"+a+"=(\\d+)"),d=c.exec(b);d&&(b=b.replace(c,a+"="+(+d[1]+1||1)));return b};var mc=!1,nc=function(a,b,c){var d=["<iframe"],e;for(e in a)a.hasOwnProperty(e)&&Cb(d,e+"="+a[e]);e="left:0;position:absolute;top:0;";mc&&(e=e+"width:"+b+"px;height:"+c+"px;");d.push('style="'+e+'"');d.push("></iframe>");a=a.id;b="border:none;height:"+c+"px;margin:0;padding:0;position:relative;visibility:visible;width:"+b+"px;background-color:transparent";return['<ins id="',a+"_expand",'" style="display:inline-table;',b,'"><ins id="',a+"_anchor",'" style="display:block;',b,'">',d.join(" "),"</ins></ins>"].join("")};var oc=function(a){if(!a)return"";(a=a.toLowerCase())&&"ca-"!=a.substring(0,3)&&(a="ca-"+a);return a};var pc={"120x90":!0,"160x90":!0,"180x90":!0,"200x90":!0,"468x15":!0,"728x15":!0};var qc="google_ad_client google_ad_format google_ad_height google_ad_width google_city google_country google_encoding google_language google_page_url".split(" "),rc=function(a){try{var b=a.top.google_ads_params_store;if(b)return b;b=a.top.google_ads_params_store={};if(b===a.top.google_ads_params_store)return b}catch(c){}return null};var sc,S=function(a){this.B=[];this.s=a||window;this.o=0;this.A=null;this.S=0},tc=function(a,b){this.Z=a;this.ka=b};S.prototype.enqueue=function(a,b){0!=this.o||0!=this.B.length||b&&b!=window?this.K(a,b):(this.o=2,this.O(new tc(a,window)))};S.prototype.K=function(a,b){this.B.push(new tc(a,b||this.s));uc(this)};S.prototype.$=function(a){this.o=1;if(a){var b=q(this.N,this,!0);this.A=this.s.setTimeout(C("sjr::timeout",b,void 0),a)}};
S.prototype.N=function(a){a&&++this.S;1==this.o&&(null!=this.A&&(this.s.clearTimeout(this.A),this.A=null),this.o=0);uc(this)};S.prototype.ea=function(){return!(!window||!Array)};S.prototype.ga=function(){return this.S};S.prototype.nq=S.prototype.enqueue;S.prototype.nqa=S.prototype.K;S.prototype.al=S.prototype.$;S.prototype.rl=S.prototype.N;S.prototype.sz=S.prototype.ea;S.prototype.tc=S.prototype.ga;var uc=function(a){var b=q(a.ha,a);a.s.setTimeout(C("sjr::tryrun",b,void 0),0)};
S.prototype.ha=function(){if(0==this.o&&this.B.length){var a=this.B.shift();this.o=2;var b=q(this.O,this,a);a.ka.setTimeout(C("sjr::run",b,void 0),0);uc(this)}};S.prototype.O=function(a){this.o=0;a.Z()};
var vc=function(a){try{return a.sz()}catch(b){return!1}},wc=function(a){return!!a&&("object"==typeof a||"function"==typeof a)&&vc(a)&&J(a.nq)&&J(a.nqa)&&J(a.al)&&J(a.rl)},xc=function(){if(sc&&vc(sc))return sc;var a=Qb(),b=a.google_jobrunner;return wc(b)?sc=b:a.google_jobrunner=sc=new S(a)},yc=function(a,b){xc().nq(a,b)},zc=function(a,b){xc().nqa(a,b)};var U=function(a){this.name="TagError";this.message=a||"";Error.captureStackTrace?Error.captureStackTrace(this,U):this.stack=Error().stack||""};da(U,Error);
var Ac=Fb?1==Eb(I):!Eb(I),Bc=function(){var a=Aa?"https":"http",b=Pa("script");return["<",b,' src="',ac(Ca(),"/pagead/js/r20151201/r20151006/show_ads_impl.js",a),'"></',b,">"].join("")},Cc=function(a,b,c,d){return function(){var e=!1;d&&xc().al(3E4);try{var g=a.document.getElementById(b).contentWindow;if(Qa(g)){var f=a.document.getElementById(b).contentWindow,
h=f.document;h.body&&h.body.firstChild||(h.open(),f.google_async_iframe_close=!0,h.write(c))}else{for(var l=a.document.getElementById(b).contentWindow,g=c,g=String(g),f=['"'],h=0;h<g.length;h++){var k=g.charAt(h),m=k.charCodeAt(0),p=h+1,F;if(!(F=Ka[k])){var H;if(31<m&&127>m)H=k;else{var x=k;if(x in La)H=La[x];else if(x in Ka)H=La[x]=Ka[x];else{var u=x,r=x.charCodeAt(0);if(31<r&&127>r)u=x;else{if(256>r){if(u="\\x",16>r||256<r)u+="0"}else u="\\u",4096>r&&(u+="0");u+=r.toString(16).toUpperCase()}H=La[x]=
u}}F=H}f[p]=F}f.push('"');l.location.replace("javascript:"+f.join(""))}e=!0}catch(A){l=Qb().google_jobrunner,wc(l)&&l.rl()}e&&(e=lc("google_async_rrc",c),(new jc(a)).set(b,Cc(a,b,e,!1)))}},Dc=function(a){var b=["<iframe"];Bb(a,function(a,d){null!=a&&b.push(" "+d+'="'+a+'"')});b.push("></iframe>");return b.join("")},Fc=function(a,b,c){Ec(a,b,c,function(a,b,g){for(var f=a.document,h=b.id,l=0;!h||f.getElementById(h);)h="aswift_"+l++;b.id=h;b.name=h;var h=Number(g.google_ad_width),l=Number(g.google_ad_height),
k=N.G;hc(g,a,k.j,k.i);mc=K(P(a),k.i);16==g.google_reactive_ad_format?(a=f.createElement("div"),a.innerHTML=nc(b,h,l),c.appendChild(a.firstChild)):c.innerHTML=nc(b,h,l);return b.id})},Ec=function(a,b,c,d){var e=Pa("script"),g,f;a:{try{var h=a.top.google_pubvars_reuse_experiment;if("undefined"!==typeof h){f=h;break a}h=y(["C","E"],sa)||null;a.top.google_pubvars_reuse_experiment=h;if(a.top.google_pubvars_reuse_experiment===h){f=h;break a}}catch(ka){}f=null}if("E"===f){g=null!=b.google_ad_client;f=null!=
b.google_ad_width;var h=null!=b.google_ad_height,l=rc(a);if(l){for(var k=0;k<qc.length;k++){var m=qc[k];null!=b[m]&&(l[m]=b[m])}if(l=rc(a)){var k=l.google_ad_width,m=l.google_ad_height,p=l.google_ad_format;k&&m&&p&&(p=(p=p&&p.match(/(\d+)x(\d+)/))?{width:p[1],height:p[2]}:null,!p||p.width==k&&p.height==m||delete l.google_ad_format)}}if(l=rc(a))for(k=0;k<qc.length;k++)m=qc[k],null==b[m]&&null!=l[m]&&(b[m]=l[m]);l=null!=b.google_ad_client;k=null!=b.google_ad_width;m=null!=b.google_ad_height;g=[g?"c2":
l?"c1":"c0",f?"w2":k?"w1":"w0",h?"h2":m?"h1":"h0"].join()}f={};h=b.google_ad_height;f.width='"'+b.google_ad_width+'"';f.height='"'+h+'"';f.frameborder='"0"';f.marginwidth='"0"';f.marginheight='"0"';f.vspace='"0"';f.hspace='"0"';f.allowtransparency='"true"';f.scrolling='"no"';f.allowfullscreen='"true"';f.onload='"'+kc+'"';d=d(a,f,b);h=b.google_ad_output;f=b.google_ad_format;f||"html"!=h&&null!=h||(f=b.google_ad_width+"x"+b.google_ad_height,b.google_ad_format_suffix&&(f+=b.google_ad_format_suffix));
h=!b.google_ad_slot||b.google_override_format||!pc[b.google_ad_width+"x"+b.google_ad_height]&&"aa"==b.google_loader_used;f=f&&h?f.toLowerCase():"";b.google_ad_format=f;f=[b.google_ad_slot,b.google_ad_format,b.google_ad_type,b.google_ad_width,b.google_ad_height];h=[];l=0;for(k=c;k&&25>l;k=k.parentNode,++l)h.push(9!=k.nodeType&&k.id||"");(h=h.join())&&f.push(h);b.google_ad_unit_key=Wa(f.join(":")).toString();f=a.google_adk2_experiment=a.google_adk2_experiment||y(["C","E"],qa)||"N";if("E"==f){f=[];for(h=
0;c&&25>h;++h){l="";l=(l=9!=c.nodeType&&c.id)?"/"+l:"";a:{if(c&&c.nodeName&&c.parentElement)for(var k=c.nodeName.toString().toLowerCase(),m=c.parentElement.childNodes,F=p=0;F<m.length;++F){var H=m[F];if(H.nodeName&&H.nodeName.toString().toLowerCase()==k){if(c==H){k="."+p;break a}++p}}k=""}f.push((c.nodeName&&c.nodeName.toString().toLowerCase())+l+k);c=c.parentElement}c=f.join()+":";f=a;h=[];if(f)try{for(var x=f.parent,l=0;x&&x!=f&&25>l;++l){for(var u=x.frames,k=0;k<u.length;++k)if(f==u[k]){h.push(k);
break}f=x;x=f.parent}}catch(ka){}b.google_ad_unit_key_2=Wa(c+h.join()).toString()}else"C"==f&&(b.google_ad_unit_key_2="ctrl");x=Zb(b);u=null;c=y(["C","E"],ta);if("E"==c){a:{try{if(window.JSON&&window.JSON.stringify&&window.encodeURIComponent){var r=encodeURIComponent(window.JSON.stringify(b)),A;if(Xb)A=n.btoa(r);else{f=[];for(l=h=0;l<r.length;l++){for(var Q=r.charCodeAt(l);255<Q;)f[h++]=Q&255,Q>>=8;f[h++]=Q}if(!Wb)for(Wb={},r=0;65>r;r++)Wb[r]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".charAt(r);
r=Wb;Q=[];for(h=0;h<f.length;h+=3){var L=f[h],wa=h+1<f.length,T=wa?f[h+1]:0,Z=h+2<f.length,Nb=Z?f[h+2]:0,l=L>>2,k=(L&3)<<4|T>>4,m=(T&15)<<2|Nb>>6,p=Nb&63;Z||(p=64,wa||(m=64));Q.push(r[l],r[k],r[m],r[p])}A=Q.join("")}u=A;break a}Mb("sblob",{json:window.JSON?1:0,eURI:window.encodeURIComponent?1:0})}catch(ka){z.u("sblob",ka,void 0,void 0)}u=""}u||(u="{X}")}else"C"==c&&(u="{C}");var B;b=b.google_ad_client;if(A=Ac){if(!ic)b:{L=[n.top];A=[];for(wa=0;T=L[wa++];){A.push(T);try{if(T.frames)for(var M=T.frames.length,
Z=0;Z<M&&1024>L.length;++Z)L.push(T.frames[Z])}catch(ka){}}for(M=0;M<A.length;M++)try{if(B=A[M].frames.google_esf){ic=B;break b}}catch(ka){}ic=null}A=!ic}A?(B={style:"display:none"},B["data-ad-client"]=oc(b),B.id="google_esf",B.name="google_esf",B.src=ac(ia("","googleads.g.doubleclick.net"),"/pagead/html/r20151201/r20151006/zrt_lookup.html"),B=Dc(B)):B="";M=ea;b=(new Date).getTime();if(A=a.google_async_for_oa_experiment)a.google_async_for_oa_experiment=
void 0;L=a.google_always_use_delayed_impressions_experiment;B=["<!doctype html><html><body>",B,"<",e,">",x,"google_show_ads_impl=true;google_unique_id=",Eb(a),';google_async_iframe_id="',d,'";google_start_time=',M,";",c?'google_pub_vars = "'+u+'";':"",g?'google_pubvars_reuse_experiment_result = "'+g+'";':"",A?'google_async_for_oa_experiment="'+A+'";':"",L?'google_always_use_delayed_impressions_experiment="'+L+'";':"","google_bpp=",b>M?b-M:1,";google_async_rrc=0;google_iframe_start_time=new Date().getTime();</",
e,">",Bc(),"</body></html>"].join("");(a.document.getElementById(d)?yc:zc)(Cc(a,d,B,!0))},Gc=function(a,b){var c=navigator;if(ra&&a&&b&&c){var c=a.document,d=ac("pagead2.googlesyndication.com","/pub-config/"+oc(b)+".js");Sa(c,d)}};var V=function(a,b){this.M=a;this.L=b};V.prototype.minWidth=function(){return this.M};V.prototype.height=function(){return this.L};V.prototype.w=function(a){return 300<a&&300<this.L?this.M:1200<a?1200:Math.round(a)};var Hc={rectangle:1,horizontal:2,vertical:4,autorelaxed:1},W=function(a,b,c){V.call(this,a,b);this.ca=c};da(W,V);var Ic=function(a){return function(b){return!!(b.ca&a)}},Jc=[new W(970,90,2),new W(728,90,2),new W(468,60,2),new W(336,280,1),new W(320,100,2),new W(320,50,2),new W(300,600,4),new W(300,250,1),new W(250,250,1),new W(234,60,2),new W(200,200,1),new W(180,150,1),new W(160,600,4),new W(125,125,1),new W(120,600,4),new W(120,240,4)];var Kc=function(a,b){for(var c=["width","height"],d=0;d<c.length;d++){var e="google_ad_"+c[d];if(!b.hasOwnProperty(e)){var g;g=$a(a[c[d]]);g=null===g?null:Math.round(g);null!=g&&(b[e]=g)}}},Lc=function(a,b){try{var c=b.document.documentElement.getBoundingClientRect(),d=a.getBoundingClientRect();return{x:d.left-c.left,y:d.top-c.top}}catch(e){return null}},Mc=function(a){var b=0,c;for(c in Hc)-1!=a.indexOf(c)&&(b|=Hc[c]);return b};var Nc=function(a){return function(b){return b.minWidth()<=a}},Pc=function(a,b,c){var d=a&&Oc(c,b);return function(a){return!(d&&250<=a.height())}},Oc=function(a,b){var c=Math.min(O(b).clientHeight,16*O(b).clientWidth/9),d=Lc(a,b);return(d?d.y:0)<c-100},Rc=function(a,b){var c=b,d=Infinity;do{var e=Qc(c,a,"height");e&&(d=Math.min(d,e));(e=Qc(c,a,"maxHeight"))&&(d=Math.min(d,e))}while((c=c.parentElement)&&"HTML"!=c.tagName);return d},Qc=function(a,b,c){if(a.style){var d=$a(a.style[c]);if(d)return d}if(a=
Ta(a,b))if(d=$a(a[c]))return d;return null};var Sc=function(a){return function(b){for(var c=a.length-1;0<=c;--c)if(!a[c](b))return!1;return!0}},Tc=function(a,b,c){for(var d=a.length,e=null,g=0;g<d;++g){var f=a[g];if(b(f)){if(!c||c(f))return f;null===e&&(e=f)}}return e};var Vc=function(a,b,c,d){var e=Jc.slice(0);if(K(P(c),N.F.i))for(var g=Math.random,f=e.length-1;0<f;f--){var h=Math.floor(g()*(f+1)),l=e[f];e[f]=e[h];e[h]=l}g=488>O(c).clientWidth;b=[Nc(a),Uc(g),Pc(g,c,d),Ic(b)];e=Tc(e,Sc(b));if(!e)throw new U("adsbygoogle.push() error: No slot size for availableWidth="+a);return e},Uc=function(a){return function(b){return!(320==b.minWidth()&&(a&&50==b.height()||!a&&100==b.height()))}};var X=function(a,b){V.call(this,a,b)};da(X,V);X.prototype.w=function(a){return Math.min(1200,Math.round(a))};var Wc=[new X(468,300),new X(414,828),new X(384,768),new X(375,750),new X(360,720),new X(320,640),new X(120,600)],Xc=[new X(468,350),new X(414,828),new X(384,768),new X(375,750),new X(360,720),new X(320,640),new X(120,600)],Yc=function(a,b){var c=Tc(a,Nc(b));if(!c)throw new U("adsbygoogle.push() error: No autorelaxed size for width="+b+"px");return c};var $c=function(){return!Zc()&&(E("iPod")||E("iPhone")||E("Android")||E("IEMobile"))},Zc=function(){return E("iPad")||E("Android")&&!E("Mobile")||E("Silk")};var ad=[{l:[3,0,0],m:[6,12,14,0,1,3,2,4,13,5,7,8,9,10,11,15]},{l:[3,0,1],m:[6,15,0,1,2,3,4,13,5,7,8,9,10,11,12,14]},{l:[3,0,2],m:[6,15,0,1,2,3,4,7,8,9,10,13,5,11,12,14]},{l:[3,1,0],m:[6,12,15,0,1,3,4,13,2,5,7,8,9,10,11,14]},{l:[3,1,1],m:[6,15,0,1,7,8,11,2,3,4,5,9,10,12,13,14]},{l:[3,1,2],m:[6,15,0,1,2,3,4,7,9,11,5,8,10,12,13,14]},{l:[3,2,0],m:[0,6,12,15,1,2,3,4,13,5,7,8,9,10,11,14]},{l:[3,2,1],m:[0,6,12,14,1,2,3,4,13,5,7,8,9,10,11,15]},{l:[3,2,2],m:[0,15,1,2,3,4,13,9,5,6,7,8,10,11,12,14]},{l:[2,0,
0],m:[6,15,0,1,3,2,7,8,10,13,9,4,5,11,12,14]},{l:[2,0,1],m:[6,15,0,1,2,3,7,8,4,10,9,13,5,11,12,14]},{l:[2,0,2],m:[0,15,1,2,3,4,7,8,13,5,6,9,10,11,12,14]},{l:[4,0,0],m:[6,12,14,15,0,1,7,2,8,11,9,3,4,5,10,13]},{l:[4,0,1],m:[6,12,14,0,1,2,3,4,7,8,11,13,5,9,10,15]},{l:[4,0,2],m:[6,15,0,1,2,3,5,7,8,13,9,4,10,11,12,14]}],bd=function(a,b,c){return"auto"==c?(b/=Math.min(1200,O(a).clientWidth),.6<b&&!(488>O(a).clientWidth)?2:.25>=b?4:3):Mc(c)},cd=function(a,b){var c=Rc(a,b);return function(a){return a.height()<=
c}},ed=function(a,b,c,d,e){var g;a:{var f;f=$c()?2:Zc()?4:3;g=Lc(d,c);f=[f,g&&3==f?83>g.x?0:265>g.x?1:2:0,dd(f,g)];for(g=0;g<ad.length;++g){var h=ad[g],l;b:if(l=h.l,f&&"number"==typeof f.length&&l&&"number"==typeof l.length&&f.length==l.length){for(var k=f.length,m=0;m<k;m++)if(f[m]!==l[m]){l=!1;break b}l=!0}else l=!1;if(l){g=h.m;break a}}throw Error("No format for "+f);}f=[];for(h=0;h<g.length;++h)f.push(Jc[g[h]]);g=488>O(c).clientWidth;a=[cd(c,d),Nc(a),Pc(g,c,d)];c=[];(e?c:a).push(Ic(b));return Tc(f,
Sc(a),Sc(c))},dd=function(a,b){if(!b)return 0;var c=b.y;switch(a){case 2:return 285>c?0:1396>c?1:2;case 4:return 275>c?0:1057>c?1:2;default:return 216>c?0:838>c?1:2}};var Y=function(a,b){V.call(this,a,b)};da(Y,V);Y.prototype.w=function(){return this.minWidth()};var fd=[new Y(728,15),new Y(468,15),new Y(200,90),new Y(180,90),new Y(160,90),new Y(120,90)];var jd=function(){var a=window;if(void 0===a.google_dre){var b="";a.postMessage&&Ra(a)&&$c()&&(b=y(["20050000","20050001"],ua))&&(a.google_ad_modifications=a.google_ad_modifications||{},a.google_ad_modifications.eids=a.google_ad_modifications.eids||[],a.google_ad_modifications.eids.push(b));a.google_dre=b;"20050001"==a.google_dre&&(bb(a.top,"message",C("dr::mh",t(gd,a),t(hd,a))),a.setTimeout(C("dr::to",t(id,a,!0),t(hd,a)),2E3),a.google_drc=0,a.google_q=a.google_q||{},a.google_q.tags=a.google_q.tags||
[])}},kd=function(a){"20050001"==n.google_dre&&(a.params=a.params||{},a.params.google_delay_requests_delay=0,a.params.google_delay_requests_count=n.google_drc++,a.U=v())},ld=function(a){if("20050001"==n.google_dre){var b=v()-a.U;a.params.google_delay_requests_delay=b}},gd=function(a,b){var c;if(c=b&&"afb"==b.data)c=b.origin,c=!!Hb[c]||ya&&Ib.test(c);c&&id(a,!1)},id=function(a,b){if(a.google_q&&a.google_q.tags){var c=a.google_q.tags;hd(a);c.length&&(b&&Mb("drt",{Ya:c.length,duration:2E3},1),md(c))}};var nd=function(a){return Gb.test(a.className)&&"done"!=a.getAttribute("data-adsbygoogle-status")},pd=function(a,b){var c=window;a.setAttribute("data-adsbygoogle-status","done");od(a,b,c)},od=function(a,b,c){qd(a,b,c);if(!rd(a,b,c)){if(b.google_reactive_ads_config){if(sd)throw new U("adsbygoogle.push() error: Only one 'enable_page_level_ads' allowed per page.");sd=!0}else Db(c);td||(td=!0,Gc(c,b.google_ad_client));Bb(Yb,function(a,d){b[d]=b[d]||c[d]});b.google_loader_used="aa";var d=b.google_ad_output;
if(d&&"html"!=d)throw new U("adsbygoogle.push() error: No support for google_ad_output="+d);Kb("aa::load",Lb,function(){Fc(c,b,a)})}},rd=function(a,b,c){var d=b.google_reactive_ads_config;if(d)var e=d.page_level_pubvars,g=(aa(e)?e:{}).google_tag_origin;var f=b.google_ad_slot,e=c.google_ad_modifications;!e||fc(e.ad_whitelist,f,g||b.google_tag_origin)?e=null:(g=e.space_collapsing||"none",e=(f=fc(e.ad_blacklist,f))?{I:!0,R:f.space_collapsing||g}:e.remove_ads_by_default?{I:!0,R:g}:null);return e&&e.I&&
"on"!=b.google_adtest?("slot"==e.R&&(null!==Za(a.getAttribute("width"))&&a.setAttribute("width",0),null!==Za(a.getAttribute("height"))&&a.setAttribute("height",0),a.style.width="0px",a.style.height="0px"),!0):!(e=Ta(a,c))||"none"!=e.display||"on"==b.google_adtest||0<b.google_reactive_ad_format||d?!1:(c.document.createComment&&a.appendChild(c.document.createComment("No ad requested because of display:none on the adsbygoogle tag")),!0)},ud=function(a,b){var c;try{c=a.getBoundingClientRect()}catch(e){}if(!c||
0==c.left&&0==c.right&&0==c.width&&0==c.height)return!1;var d=Ta(a,b);if(!d)return!1;c=$a(d.width);d=$a(d.height);return null==c||null==d||pc[c+"x"+d]?!1:!0},qd=function(a,b,c){for(var d=a.attributes,e=d.length,g=0;g<e;g++){var f=d[g];if(/data-/.test(f.name)){var h=f.name.replace("data","google").replace(/-/g,"_");if(!b.hasOwnProperty(h)){var f=f.value,l={google_reactive_ad_format:fa,google_allow_expandable_ads:ga},f=l.hasOwnProperty(h)?l[h](f,null):f;null===f||(b[h]=f)}}}if(b.google_enable_content_recommendations&&
1==b.google_reactive_ad_format)b.google_ad_width=O(c).clientWidth,b.google_ad_height=50,a.style.display="none";else if(1==b.google_reactive_ad_format)b.google_ad_width=320,b.google_ad_height=50,a.style.display="none";else if(8==b.google_reactive_ad_format)b.google_ad_width=O(c).clientWidth||0,b.google_ad_height=O(c).clientHeight||0,a.style.display="none";else if(9==b.google_reactive_ad_format)b.google_ad_width=O(c).clientWidth||0,b.google_ad_height=O(c).clientHeight||0,a.style.display="none";else{d=
b.google_ad_format;"autorelaxed"==d?(d=N.C,hc(b,c,d.j,d.i),d=K(P(c),N.C.i)?3:2):"auto"==d||/^((^|,) *(horizontal|vertical|rectangle) *)+$/.test(d)?(d=N.D,hc(b,c,d.j,d.i),d=K(P(c),N.D.i)||K(P(c),N.v.i)?5:1):d="link"==d?4:void 0;if(e=!d)ud(a,c)?(e=N.v,hc(b,c,e.j,e.i)!==e.i?e=!1:(b.google_ad_format="auto",e=!0)):e=!1;e&&(d=5);if(d){var k=a.offsetWidth;a:{var m=b.google_ad_format;switch(d){default:case 1:var p="auto"==m?.25>=k/Math.min(1200,O(c).clientWidth)?4:3:Mc(m);b&&(b.google_responsive_formats=
p,m=N.F,hc(b,c,m.j,m.i));c=Vc(k,p,c,a);break a;case 2:c=Yc(Wc,k);break a;case 3:c=Yc(Xc,k);break a;case 5:m=bd(c,k,m);b.google_responsive_formats=m;var F=K(P(c),N.v.i);b:{d=a;do if((e=Ta(d,c))&&"fixed"==e.position){d=!1;break b}while(d=d.parentElement);d=!0}d&&(p=ed(k,m,c,a,F));c=p||Vc(k,m,c,a);break a;case 4:c=Tc(fd,Nc(k));if(!c)throw new U("adsbygoogle.push() error: No link unit size for width="+k+"px");b.google_ad_format_suffix="_0ads_al";b.google_override_format=1}}b.google_ad_width=c.w(k);b.google_ad_height=
c.height();a.style.height=c.height()+"px";b.google_ad_resizable=!0;delete b.google_ad_format;b.google_loader_features_used=128}else{p=ud(a,c)?(p=y(["LC","LE"],pa))?"LE"==(b.google_responsive_override_logs_experiment=p):!1:!1;if(p)try{m=a.offsetWidth,F=ed(m,bd(c,m,"auto"),c,a,!0),k=new Oa(F.w(m),F.height()),b.google_ember_w=k.width,b.google_ember_h=k.height}catch(H){b.google_ember_w=b.google_ember_h="e"}!Ya.test(b.google_ad_width)&&!Xa.test(a.style.width)||!Ya.test(b.google_ad_height)&&!Xa.test(a.style.height)?
(c=Ta(a,c),a.style.width=c.width,a.style.height=c.height,Kc(c,b),b.google_ad_width||(b.google_ad_width=a.offsetWidth),b.google_ad_height||(b.google_ad_height=a.offsetHeight),b.google_loader_features_used=256):(Kc(a.style,b),b.google_ad_output&&"html"!=b.google_ad_output||300!=b.google_ad_width||250!=b.google_ad_height||(c=a.style.width,a.style.width="100%",p=a.offsetWidth,a.style.width=c,b.google_available_width=p))}}},vd=function(a){for(var b=document.getElementsByTagName("ins"),c=0,d=b[c];c<b.length;d=
b[++c]){var e=d;if(nd(e)&&"reserved"!=e.getAttribute("data-adsbygoogle-status")&&(!a||d.id==a))return d}return null},sd=!1,td=!1,yd=function(a){if($c()&&!n.google_q){n.google_q={};var b;a:{try{b=n.JSON.parse(n.localStorage.getItem("google_ama_config")||"");break a}catch(e){}b=null}if(b)if(b.exp>v()&&bc(b)){n.google_q.tags=[];var c=v();b=ac(Ca(),b.lib);b=Sa(n.document,b);b.onload=C("aa::amarn",t(wd,n,c,a),t(hd,n));var d=C("aa::amaabt",t(xd,n,b,c),t(hd,n));n.setTimeout(function(){n.setTimeout(d,100)},
0)}else try{n.localStorage.removeItem("google_ama_config")}catch(e){cc(n,{lserr:1})}}},wd=function(a,b,c){a.google_q.tags&&(cc(a,{stg:1,t:v()-b}),(b=a.google_amar)&&J(b)&&Kb("aa::amar",Lb,t(b,a,c)),zd(a))},xd=function(a,b,c){a.google_q.tags&&(b.onload=function(){cc(a,{stg:0,t:v()-c})},zd(a))},zd=function(a){var b=a.google_q.tags;a.google_q.tags=void 0;md(b)},hd=function(a){a.google_q.tags=void 0},md=function(a){if(a&&a.shift)try{for(var b,c=20;0<a.length&&(b=a.shift())&&0<c;)Ad(b),--c}catch(d){throw window.setTimeout(Bd,
0),d;}},Cd=function(a,b){var c={};Bb(dc,function(b,d){a.hasOwnProperty(d)&&(c[d]=a[d])});aa(a.enable_page_level_ads)&&(c.page_level_pubvars=a.enable_page_level_ads);var d=document.createElement("ins");d.className="adsbygoogle";d.style.display="none";b?zb.body.appendChild(d):zb.documentElement.appendChild(d);pd(d,{google_reactive_ads_config:c,google_ad_client:a.google_ad_client})},Dd=function(a){if(!Ra(window))throw new U("adsbygoogle.push() error: Page-level tag does not work inside iframes.");var b=
K(P(I),N.H.i),c=!b;zb.body||b?Cd(a,c):bb(zb,"DOMContentLoaded",Ob(function(){Cd(a,c)}))},Ed=function(a,b,c,d){if(0==b.message.indexOf("TagError")){var e={};jb(z,e,d);e.context=a;e.msg=b.message.substring(0,512);a=n.document;e.url=a.URL.substring(0,512);e.ref=a.referrer.substring(0,512);eb(Jb,"puberror",e,!0,c||.01);return!1}return z.u(a,b,c,d)},Fd=function(a,b,c,d){return 0==b.message.indexOf("TagError")?!1:z.u(a,b,c,d)},Ad=function(a){var b={};Kb("aa::hqe",Ed,function(){Gd(a,b)},function(c){c.client=
c.client||b.google_ad_client||a.google_ad_client;c.slotname=c.slotname||b.google_ad_slot;c.tag_origin=c.tag_origin||b.google_tag_origin})},Gd=function(a,b){ea=(new Date).getTime();if(n.google_q&&n.google_q.tags)kd(a),n.google_q.tags.push(a);else{var c;a:{if(a.enable_page_level_ads){if("string"==typeof a.google_ad_client){c=!0;break a}throw new U("adsbygoogle.push() error: 'google_ad_client' is missing from the tag config.");}c=!1}if(c)yd(a.google_ad_client),Dd(a);else{n.google_q?ld(a):(jd(),kd(a));
c=a.element;var d=a.params;d&&Bb(d,function(a,c){b[c]=a});if(c){if(!nd(c)&&(c=c.id?vd(c.id):null,!c))throw new U("adsbygoogle.push() error: 'element' has already been filled.");if(!("innerHTML"in c))throw new U("adsbygoogle.push() error: 'element' is not a good DOM element.");}else if(c=vd(),!c)throw new U("adsbygoogle.push() error: All ins elements in the DOM with class=adsbygoogle already have ads in them.");pd(c,b)}}},Bd=function(){Kb("aa::main",Fd,Hd)},Hd=function(){var a=I.google_ad_modifications=
I.google_ad_modifications||{};if(!a.plle){a.plle=!0;var a=a.loeids=a.loeids||[],b=N.D,c=b.i;if(I.location&&I.location.hash=="#google_plle_"+c)b=c;else{var b=[b.j,c],c=new Na(ja,ja+la-1),d;(d=0>=la||la%b.length)||(d=ec.ba,d=!(d.start<=c.start&&d.end>=c.end));d?b=null:(d=ab(I),b=null!==d&&c.start<=d&&c.end>=d?b[(d-ja)%b.length]:null)}b&&a.push(b);b=N.C;(b=gc(ma,b.j,b.i))&&a.push(b);b=N.F;(b=gc(na,b.j,b.i))&&a.push(b);b=N.v;(b=gc(oa,b.j,b.i))&&a.push(b);b=N.G;(b=gc(va,b.j,b.i))&&a.push(b);zb.body||(b=
N.H,(b=gc(xa,b.j,b.i))&&a.push(b))}a=window.adsbygoogle;md(a);if(!a||!a.loaded){window.adsbygoogle={push:Ad,loaded:!0};a&&Id(a.onload);try{Object.defineProperty(window.adsbygoogle,"onload",{set:Id})}catch(e){}}},Id=function(a){J(a)&&window.setTimeout(a,0)};Bd();}).call(this);
