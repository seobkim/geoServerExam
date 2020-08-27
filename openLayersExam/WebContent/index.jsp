<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<!-- OpenLayers CDN -->
<script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v6.1.1/build/ol.js"></script>

<link rel="stylesheet" href="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v6.1.1/css/ol.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.4.3/css/ol.css" type="text/css">
    <style>
      #map {
        height: 650px;
        width: 100%;
      }
    </style>

<meta charset="UTF-8">



<title>openLayers Exam</title>
</head>
<body>

<div id= "map"></div>

<script>
	// ol = OpenLayers 약어 
     var map = new ol.Map({
        target: 'map',  // 위 index.jsp에 div id가 map인 요소에 맵을 표출
        layers: [
          new ol.layer.Tile({
            source: new ol.source.OSM()
          })
        ],
        view: new ol.View({
          center: ol.proj.fromLonLat([-71.147,42.472]),  // 맵이 로딩되었을 때 보여질 기본 위치(좌표) 설정
          zoom: 6// 줌 레벨은 말 그대로 확대 레벨 (숫자가 커질수록 확대 됨)
        })
    });   
    
    /*//OpenLayer 버전 2 방식 -- 사용불가 
	map = new OpenLayers.Map(map);
	layer = new OpenLayers.Layer.OSM("Simple OSM Map");
	
	map.addLayer(layer);
	
	map.setCenter(
		new OpenLayers.LonLat(-71.147,42.472).transform(new OpenLayers.Projection("EPSG:4326"),map.getProjectionObject(),12)	
	);
	
 	var addWmsLayers = function(_layerName,isLayerSwitcher){
	var geoServerUrl="http://localhost:8080/web/geoserver";
	var wmsLayerUrl = geoServerUrl +"/wms";
	
	var params= {
		LAYERS : "poi",
		STYLES : "",
		format : "image/png",
		transparent: "true",
		tiled: "true",
		tilesOrigin : map.maxExtent.left+","+map.maxExtent.bottm
	};
	
	var options = {
		buffer: 2,
		displayOutsideMaxExtent : true,
		isBaseLayer:false,
		gutter: 16,
		displayInLayerSwitcher : isLayerSwitcher
	};
	
	var wmsLayer = new ol.Layer.WMS(_layerName,wmsLayerUrl,params,options);
	
	
	return wmsLayers;
	};
	
	map.addLayers(addWmsLayers);   */
	
	
	console.log(1);
	test = map;

	//OpenLayer 버전 2 방식 -- 사용불가 
 /* 	 var wms = new ol.Layers.WMS(
	        "WMS 레이어",
	        "http://localhost:8080/geoserver/wms",
	        {
	            layers: "poi",
	            format: "image/png",
	            transparent: true
	        },
	        {
	            version: "1.1.0",
	            singleTile: true,
	            isBaseLayer: true
	        }
	);  */
	
	
	
	
	
	//기본예제
	var layerName = "poi";
	var wms = new ol.source.TileWMS({
		urls:["http://localhost:8080/geoserver/wms"],
		params:{'LAYERS' : layerName,
				/* 'FORMAT' : 'gif', */ //FORMAT MISMATCH로 default로 처리
				'TRANSPARENT':'TRUE'
		},
		serverType:'geoserver',
		/* crossOrigin:'anonymous', */
	
	});
	
	var layer= new ol.layer.Tile({
		source : wms,
		layerName: layerName,
		layerCatergory : 'WMS',
		type:'WMS',
		visiable : true,
		opacity:1.0
	});
	
	
	var layerName2 = "tl_scco_ctprvn";
	var wms2 = new ol.source.TileWMS({
		urls:["http://localhost:8080/geoserver/wms"],
		params:{'LAYERS':layerName2,
				'TRANSPARENT':'TRUE'	
		},
		serverType:'geoserver',
	});
	
	var layer2= new ol.layer.Tile({
		source :wms2,
		layerCategory :'WMS',
		type:'WMS',
		visiable:true,
		opacity:1.0
	});
	


	map.addLayer(layer2);
	map.addLayer(layer);
	
	console.log(map);
</script>




</body>
</html>














