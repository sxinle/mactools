var markerSize = new BMap.Size(60, 57);
var icon_camare = new BMap.Icon("02.png", markerSize);
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
            "visibility": "off"
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
            "visibility": "on"
        }
    }
];

// 自定义覆盖层 【Overlay】==========================================================================================
function MarkerOverlay(point, pos, question) {
    this._point = point;
    this.pos = pos;
    this.question = question;
}
MarkerOverlay.prototype = new BMap.Overlay();
MarkerOverlay.prototype.initialize = function (mp) {
    this._map = mp;
    var div = this._div = document.createElement("div");
    div.style.position = "absolute"
    div.style.background = "url(08.png) no-repeat";
    div.style.backgroundSize = "contain";
    div.style.width = "600px";
    div.style.height = "300px";
    div.style.fontSize = "5px"

    var subDiv = this._subdiv = document.createElement("div");
    subDiv.style.paddingTop = "20%";
    subDiv.style.paddingLeft = "2%";
    subDiv.style.color = "#2c80b6";

    var span1 = this._span1 = document.createElement("span");
    span1.appendChild(document.createTextNode("位置："));
    subDiv.appendChild(span1);

    var span2 = this._span2 = document.createElement("span");
    span2.style.color = "#75bdea";
    span2.appendChild(document.createTextNode(this.pos));
    subDiv.appendChild(span2);

    subDiv.appendChild(document.createElement("br"));
    subDiv.appendChild(document.createElement("br"));

    var span3 = this._span3 = document.createElement("span");
    span3.appendChild(document.createTextNode("问题："));
    subDiv.appendChild(span3);

    var span4 = this._span4 = document.createElement("span");
    span4.style.color = "#75bdea";
    span4.appendChild(document.createTextNode(this.question));
    subDiv.appendChild(span4);

    var button = this._botton = document.createElement("button");
    button.appendChild(document.createTextNode("隐藏"));
    button.onclick = clearOverlay;
    subDiv.appendChild(button);

    div.appendChild(subDiv);

    map.getPanes().labelPane.appendChild(div);

    return div;
}
MarkerOverlay.prototype.draw = function () {
    var map = this._map;
    var pixel = map.pointToOverlayPixel(this._point);
    this._div.style.left = pixel.x + "px";
    this._div.style.top = pixel.y - 300 + "px";
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
TopRightRanking.prototype.initialize = function (map) {
    // 创建一个DOM元素
    var div = document.createElement("div");
    div.style.background = "url(06.png) no-repeat";
    div.style.backgroundSize = "contain";
    div.style.width = "600px";
    div.style.height = "300px";
    // 添加文字说明
    div.appendChild(document.createTextNode("右侧排名"));
    // 设置样式
    // 绑定事件,点击一次放大两级
    div.onclick = function (e) {
        alert('click');
    }
    // 添加DOM元素到地图中
    map.getContainer().appendChild(div);
    // 将DOM元素返回
    return div;
}
