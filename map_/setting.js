var markerSize =new BMap.Size(37, 37);
var markerSmallSize =new BMap.Size(17, 17);
var icon_camare = new BMap.Icon("02.png", markerSize);
var icon_camare_s = new BMap.Icon("02s.png", markerSmallSize);
var icon_truck = new BMap.Icon("03.png", markerSize);
var icon_taxi = new BMap.Icon("04.png", markerSize);
var icon_house = new BMap.Icon("05.png", markerSize);
var style = [
    {
        "featureType": "highway",
        "elementType": "geometry.fill",
        "stylers": {
            "color": "#000000"
        }
    },
    {
        "featureType": "highway",
        "elementType": "geometry.stroke",
        "stylers": {
            "color": "#147a92"
        }
    },
    {
        "featureType": "arterial",
        "elementType": "geometry.fill",
        "stylers": {
            "color": "#000000"
        }
    },
    {
        "featureType": "arterial",
        "elementType": "geometry.stroke",
        "stylers": {
            "color": "#0b3d51"
        }
    },
    {
        "featureType": "local",
        "elementType": "geometry",
        "stylers": {
            "color": "#000000"
        }
    },
    {
        "featureType": "land",
        "elementType": "all",
        "stylers": {
            "color": "#08304b"
        }
    },
    {
        "featureType": "railway",
        "elementType": "geometry.fill",
        "stylers": {
            "color": "#000000"
        }
    },
    {
        "featureType": "railway",
        "elementType": "geometry.stroke",
        "stylers": {
            "color": "#08304b"
        }
    },
    {
        "featureType": "subway",
        "elementType": "geometry",
        "stylers": {
            "lightness": -70
        }
    },
    {
        "featureType": "building",
        "elementType": "geometry.fill",
        "stylers": {
            "color": "#000000"
        }
    },
    {
        "featureType": "all",
        "elementType": "labels.text.fill",
        "stylers": {
            "color": "#857f7f"
        }
    },
    {
        "featureType": "all",
        "elementType": "labels.text.stroke",
        "stylers": {
            "color": "#000000"
        }
    },
    {
        "featureType": "building",
        "elementType": "geometry",
        "stylers": {
            "color": "#022338"
        }
    },
    {
        "featureType": "green",
        "elementType": "geometry",
        "stylers": {
            "color": "#062032"
        }
    },
    {
        "featureType": "boundary",
        "elementType": "all",
        "stylers": {
            "color": "#1e1c1c"
        }
    },
    {
        "featureType": "manmade",
        "elementType": "all",
        "stylers": {
            "color": "#022338"
        }
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": {
            "color": "#002e46"
        }
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": {
            "visibility": "on"
        }
    },
    {
        "featureType": "land",
        "elementType": "all",
        "stylers": {
            "color": "#001020"
        }
    },
    {
        "featureType": "building",
        "elementType": "all",
        "stylers": {
            "visibility": "off"
        }
    },
    {
        "featureType": "manmade",
        "elementType": "all",
        "stylers": {
            "visibility": "off"
        }
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": {
            "visibility": "off"
        }
    }
];

// 自定义覆盖层 【Overlay】==========================================================================================
hideOverlay = function() {
    map.removeOverlay(markerOverlay);
};
function MarkerOverlay(point, addr, dir, ip, dist) {
    this._point = point;
    this.addr = addr;
    this.dir = dir;
    this.ip = ip;
    this.dist = dist;
}
MarkerOverlay.prototype = new BMap.Overlay();
MarkerOverlay.prototype.initialize = function (mp) {
    this._map = mp;

    var div = this._div = document.createElement("div");
    div.style.position = "relative"
    div.style.background = "url(08c.png) no-repeat";
    div.style.backgroundSize = "contain";
    div.style.width = "50%";
    div.style.height = "20%";
    div.style.left = "25%";
    div.style.top = "30%";
    div.style.fontSize = "5px"


    var subDiv = this._subdiv = document.createElement("div");
    subDiv.style.padding = "10px";
    subDiv.style.color = "#2c80b6";

    var span1 = this._span1 = document.createElement("span");
    span1.appendChild(document.createTextNode("位置："));
    span1.style.margin="5px 0";
    subDiv.appendChild(span1);

    var span2 = this._span2 = document.createElement("span");
    span2.style.color = "#75bdea";
    span2.style.margin="5px 0";
    span2.appendChild(document.createTextNode(this.addr));
    subDiv.appendChild(span2);

    subDiv.appendChild(document.createElement("br"));
    subDiv.appendChild(document.createElement("br"));

    var span3 = this._span3 = document.createElement("span");
    span3.appendChild(document.createTextNode("方位："));
    span3.style.margin="5px 0";

    subDiv.appendChild(span3);

    var span4 = this._span4 = document.createElement("span");
    span4.style.color = "#75bdea";
    span4.style.margin="5px 0";
    var str = isNaN(this.dir) ? this.dir : "未知方位";
    span4.appendChild(document.createTextNode(str));
    subDiv.appendChild(span4);

    subDiv.appendChild(document.createElement("br"));
    subDiv.appendChild(document.createElement("br"));

    var span5 = this._span5 = document.createElement("span");
    span5.appendChild(document.createTextNode("区域："));
    span5.style.margin="5px 0";

    subDiv.appendChild(span5);

    var span6 = this._span6 = document.createElement("span");
    span6.style.color = "#75bdea";
    span6.style.margin="5px 0";
    span6.appendChild(document.createTextNode(this.dist));
    subDiv.appendChild(span6);

    subDiv.appendChild(document.createElement("br"));
    subDiv.appendChild(document.createElement("br"));

    var span7 = this._span7 = document.createElement("span");
    span7.appendChild(document.createTextNode("IP："));
    span7.style.margin="5px 0";

    subDiv.appendChild(span7);

    var span8 = this._span8 = document.createElement("span");
    span8.style.color = "#75bdea";
    span8.style.margin="5px 0";
    span8.appendChild(document.createTextNode(this.ip));
    subDiv.appendChild(span8);

    subDiv.appendChild(document.createElement("br"));
    subDiv.appendChild(document.createElement("br"));


     var retbtn = document.createElement("button");
        retbtn.color = "#000"
        retbtn.appendChild(document.createTextNode("查看监控画面"));
        retbtn.style.width = '100px';
        retbtn.style.color = 'white';

        retbtn.style.height = "20px";
        retbtn.style.backgroundColor="#031220";
        retbtn.style.borderColor="#7daad8";
        retbtn.style.borderWidth= '1px';

        retbtn.style.position = 'relative';


        retbtn.addEventListener('touchend',hideOverlay);
        retbtn.addEventListener('click',hideOverlay);

    subDiv.appendChild(retbtn);

    div.appendChild(subDiv);

    // mp.getPanes().labelPane.appendChild(div);
    map.getContainer().appendChild(div);

    return div;
}
MarkerOverlay.prototype.draw = function () {
    var map = this._map;
    var pixel = map.pointToOverlayPixel(this._point);
}


// 自定义控件->位置上下左右【Control】===================================================================================
// 定义一个控件类,即function
function TopRightRanking() {
    // 默认停靠位置和偏移量
    this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
    this.defaultOffset = new BMap.Size(10, 10);
}
// 通过JavaScript的prototype属性继承于BMap.Control
TopRightRanking.prototype = new BMap.Control();
// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中


var scores = [
    { label:"第6期",
    time:"4.25-5.1",
    scores:[
        {name:"小白楼街",s1:"13",s2:"15",s3:"20",s4:"14",s5:"15",s6:"12",s7:"11",count:"100",minus:"5",score:"45",bscore:"45",total:"90",order:"2"},
        {name:"南市街",s1:"10",s2:"7",s3:"11",s4:"7",s5:"8",s6:"3",s7:"2",count:"48",minus:"2.4",score:"47.6",bscore:"44.5",total:"92.1",order:"1"},
        {name:"五大道街",s1:"14",s2:"10",s3:"11",s4:"11",s5:"9",s6:"9",s7:"13",count:"77",minus:"3.85",score:"46.15",bscore:"43.5",total:"89.65",order:"3"},
        {name:"新兴街",s1:"17",s2:"16",s3:"19",s4:"28",s5:"17",s6:"10",s7:"21",count:"128",minus:"6.4",score:"43.6",bscore:"42",total:"85.6",order:"5"},
        {name:"南营门街",s1:"24",s2:"23",s3:"27",s4:"35",s5:"34",s6:"28",s7:"23",count:"194",minus:"9.7",score:"40.3",bscore:"45",total:"85.3",order:"6"},
        {name:"劝业场街",s1:"19",s2:"15",s3:"26",s4:"11",s5:"21",s6:"4",s7:"10",count:"106",minus:"5.3",score:"44.7",bscore:"43",total:"87.7",order:"4"}
    ]
    },

    { label:"第4期",
    time:"4.19-4.24",
        scores:[{name:"小白楼街",s1:"—",s2:"16",s3:"45",s4:"49",s5:"44",s6:"33",s7:"41",count:"228",minus:"11.4",score:"38.6",bscore:"44",total:"82.6",order:"3"},
    {name:"南市街",s1:"—",s2:"18",s3:"22",s4:"20",s5:"12",s6:"7",s7:"15",count:"94",minus:"4.7",score:"45.3",bscore:"45",total:"90.3",order:"1"},
    {name:"五大道街",s1:"—",s2:"22",s3:"32",s4:"33",s5:"19",s6:"32",s7:"36",count:"174",minus:"8.7",score:"41.3",bscore:"42",total:"83.3",order:"2"},
    {name:"新兴街",s1:"—",s2:"45",s3:"33",s4:"25",s5:"38",s6:"52",s7:"37",count:"230",minus:"11.5",score:"38.5",bscore:"43",total:"81.5",order:"4"},
    {name:"南营门街",s1:"—",s2:"45",s3:"47",s4:"51",s5:"51",s6:"72",s7:"57",count:"323",minus:"16.15",score:"33.85",bscore:"44",total:"77.85",order:"5"},
    {name:"劝业场街",s1:"—",s2:"52",s3:"67",s4:"61",s5:"49",s6:"66",s7:"56",count:"351",minus:"17.55",score:"32.45",bscore:"43",total:"75.45",order:"6"}]
    },

];

window.scores = scores;
var data = scores.shift();
window.data = data;
TopRightRanking.prototype.initialize = function (map) {
   var div = document.createElement("div");
    div.style.right = '0px';
    div.style.width = "100%";



    var sumarypane =document.createElement("div");
    sumarypane.id = "sumary"
    sumarypane.style.background = "url(06.png) no-repeat";
    sumarypane.style.backgroundSize = "100% 100%";
    sumarypane.style.width = "280px";
    sumarypane.style.minHeight = "150px";
    sumarypane.style.margin="0 auto";
    sumarypane.style.padding='10px';
    sumarypane.style.paddingTop='5px';

    var title = document.createElement("div");
    title.style.color = '#fff';
    title.style.paddingBottom = '5px'
    title.style.paddingTop = '5px'

    title.style.paddingLeft = '15px'
    title.style.fontSize = '14px'
    title.style.margin='0px auto';

    title.style.textAlign = 'center';
    var txt = document.createTextNode("百日会展成绩展示  ("+data.label+")");
    title.appendChild(txt);
    sumarypane.appendChild(title);






    var showDetail= function(row){

        sumarypane.style.display = 'none';


        var detailpane =document.createElement("div");
        detailpane.id = "detail"
        detailpane.style.background = "url(06.png) no-repeat";
        detailpane.style.backgroundSize = "100% 100%";
        detailpane.style.width = "280px";
        detailpane.style.minHeight = "150px";
        detailpane.style.margin="0 auto";
        detailpane.style.padding='10px';
        detailpane.style.paddingTop='5px';
        detailpane.style.postion = "absolute";

        var title = document.createElement("div");
        title.style.color = '#fff';
        title.style.paddingBottom = '5px'
        title.style.paddingTop = '5px'

        title.style.paddingLeft = '15px'
        title.style.fontSize = '14px'
        title.style.margin='0px auto';

        title.style.textAlign = 'center';
        var txt = document.createTextNode("百日会展成绩趋势  ("+row.name+")");
        title.appendChild(txt);
        detailpane.appendChild(title);

        var retbtn = document.createElement("button");
        retbtn.color = "#000"
        retbtn.appendChild(document.createTextNode("返回"));
        retbtn.style.width = '40px';
        retbtn.style.color = 'white';

        retbtn.style.height = "20px";
        retbtn.style.backgroundColor="#031220";
        retbtn.style.borderColor="#7daad8";
        retbtn.style.borderWidth= '1px';

        retbtn.style.position = 'absolute';
        retbtn.style.bottom = '10px';
        retbtn.style.right = '17%';

        var svg = document.createElement("iframe");
        svg.style.border = '0px';
        svg.style.width="100%";
        svg.src="/chart.html";

        var returnaction = function(e){
            e.preventDefault();
            detailpane.style.display = 'none';
            sumarypane.style.display = 'block';
            //fixme show are reloc map
            map.centerAndZoom(centers[2].center, 14);
            fillareas();
        }

        retbtn.addEventListener("click",returnaction);
        retbtn.addEventListener("touchend",returnaction);

        var svg = document.createElement("iframe");
        svg.style.border = '0px';
        svg.style.width="100%";

        var oldtotal = scores[0].scores.filter(function(r){return r.name===row.name})[0].total;



        svg.src="/chart.html?old="+ oldtotal +"&new="+row.total;
        svg.style.height="100px";
        detailpane.appendChild(svg);
        detailpane.appendChild(retbtn);
        div.appendChild(detailpane);
    };

    window.fillareas = function(){

        window.polygons.forEach(function(p){
            var name = p.centerPoint.desc;

            var total = data.scores.filter(function(r){return r.name === name;})[0].total;
            var ototal = scores[0].scores.filter(function(r){return r.name === name;})[0].total;
            if(total-ototal>0){
                console.log(name,"green");
                p.setFillColor('green');
                p.setStrokeColor('green');
            }else{
                p.setFillColor('red');
                p.setStrokeColor('red');
            }
        })
        polygon.show();

    }

    var appendRow = (function(rd){
        var row = document.createElement("div");

        if(rd.name!=="单位"){
            row.addEventListener("touchstart", function(){
                row.style.background = 'rgba(224, 219, 219, 0.18)';
            });


            var detailAction = function(e){
                console.log(e.target);
                window.sss = e;
                row.style.background = 'transparent';
                var select = polygons.filter(function(p){
                    return p.centerPoint.desc === rd.name;
                });

                // select[0].setFillColor('lightblue');
                //fixme 中心点定位，then polygon.hide();
                map.centerAndZoom(select[0].centerPoint.center, 16);
                polygon.hide();
                     // 初始化地图，设置中心点坐标和地图级别

                showDetail(rd);

            };
            row.addEventListener("click",detailAction);
            row.addEventListener("touchend",detailAction );
        }

        row.style.width="100%";
        row.style.height = '17px';
        row.style.fontSize="12px";


        var nspan = document.createElement("div");
        nspan.style.color = '#ccc';
        nspan.style.width='40%';
        nspan.style.float= 'left'
        nspan.style.marginLeft="15px"
        nspan.appendChild(document.createTextNode(rd.name));

        var sspan = document.createElement("div");
        sspan.style.color = '#ccd';
        sspan.style.width='40%';
        sspan.style.float= 'left'

        sspan.appendChild(document.createTextNode(rd.total));


        var ospan = document.createElement("div");
        if(parseInt(rd.order)<4){
            ospan.style.color = 'yellow';
            ospan.style.fontWeight = 'bold';
        }
        else
            ospan.style.color = '#ccd';
        ospan.style.width='10%';
        ospan.style.float= 'left'
        ospan.appendChild(document.createTextNode(rd.order));


        row.appendChild(nspan);
        row.appendChild(sspan);
        row.appendChild(ospan);
        sumarypane.appendChild(row);

    });


    appendRow({name:"单位",total:"得分",order:"排名"});
    data.scores.forEach(function(d){
        appendRow(d);
    });
    div.appendChild(sumarypane);


    // 设置样式
    // 绑定事件,点击一次放大两级
    div.onclick = function (e) {
        //alert('click');
    }
    // 添加DOM元素到地图中
    map.getContainer().appendChild(div);
    // 将DOM元素返回
    return div;
}
