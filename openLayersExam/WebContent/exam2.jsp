<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="">
<head>
    <meta charset="utf-8">
    <title>wfs example</title>
    <meta name="author" content="Your Name">
    <meta name="description" content="Example description">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.2.1/css/ol.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.2.1/build/ol.js"></script>
    <style>
        .map {
            height: 1000px;
            width: 100%;
        }
    </style>
</head>


<body>
    <div id="map" class="map"></div>
    <script type="text/javascript">

    	var vectorSource= new ol.source.Vector({
    		format: new ol.format.GeoJSON(),
    		url: function(extent){
    		result='http://localhost:8080/geoserver/wfs?service=WFS&' +
                'version=1.1.0&request=GetFeature&typename=tl_scco_ctprvn&' +
                'outputFormat=application/json&srsname=EPSG:3857&' +
                'bbox=' + extent.join(',') + ',EPSG:3857';
    			console.log(result);
    			return result;
    		},
    		
    		
    	strategy: ol.loadingstrategy.bbox
    	})
    	
		

    	var vector = new ol.layer.Vector({
    		source : vectorSource,
    		style : new ol.style.Style({
    			stroke:new ol.style.Stroke({
    				color:'rgba(0,0,255,1)',
    				width:2
    			}),
    			fill:new ol.style.Fill({
    				color:'rgba(0,0,255,0.1)'
    			})
    		})
    	});
    	
    	var raster = new ol.layer.Tile({
    		source : new ol.source.OSM()
    	});
    	
    	var map = new ol.Map({
    		layers:[raster,vector],
    		target:document.getElementById('map'),
    		 view: new ol.View({
    			  
    	          center: ol.proj.fromLonLat([127,37]),  // 맵이 로딩되었을 때 보여질 기본 위치(좌표) 설정
    	          zoom: 6// 줌 레벨은 말 그대로 확대 레벨 (숫자가 커질수록 확대 됨)
    	        })
    	})
    	
    	 var selectPointerMove = new ol.interaction.Select({
             condition: ol.events.condition.pointerMove,
             style: new ol.style.Style({
                 stroke: new ol.style.Stroke({
                     color: 'yellow',
                     width: 2
                 }),
                 fill: new ol.style.Fill({
                     color: 'rgba(0,0,255,0.6)'
                 })
             })
         });
         // interaction 추가
         map.addInteraction(selectPointerMove);
    	
    </script>
</body></html>