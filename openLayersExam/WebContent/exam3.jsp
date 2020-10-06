<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="">
<head>
    <meta charset="utf-8">
    <title>예제3 example</title>
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
    
    <span id="status"></span>
    
    <script type="text/javascript">


    	
    	var vectorSource = new ol.source.Vector({
    		  format: new ol.format.GeoJSON(),
    		  loader: function(extent, resolution) {
    		      url = 'http://localhost:8080/geoserver/wfs?service=WFS&' +
                 'version=1.1.0&request=GetFeature&typename=cite:vl_blk&' +
                 'outputFormat=application/json&srsname=EPSG:3857&' +
                 'bbox=' + extent.join(',') + ',EPSG:3857';
    		     var xhr = new XMLHttpRequest();
    		     xhr.open('POST', url);
    		     var onError = function() {
    		       vectorSource.removeLoadedExtent(extent);
    		     }
    		     xhr.onerror = onError;
    		     xhr.onload = function() {
    		       if (xhr.status == 200) {
    		         vectorSource.addFeatures(
    		         vectorSource.getFormat().readFeatures(xhr.responseText));
    		         	
    		         getFeatures(JSON.parse(this.response));
    		       } else {
    		         onError();
    		       }
    		     }
    		     xhr.send();
    		   },
    		   strategy:ol.loadingstrategy.bbox
    		 });


    	var vector = new ol.layer.Vector({
    		source : vectorSource,
    		style : new ol.style.Style({
    			stroke:new ol.style.Stroke({
    				color:'rgba(255,255,255,0.5)',
    				width:2
    			}),
    			fill:new ol.style.Fill({
    				color:'rgba(0,0,0,0.1)'
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
    			  
    	          center: ol.proj.fromLonLat([126.8,37.7]),  // 맵이 로딩되었을 때 보여질 기본 위치(좌표) 설정
    	          zoom: 11// 줌 레벨은 말 그대로 확대 레벨 (숫자가 커질수록 확대 됨)
    	        })
    	})
    	
    	var selected = null;
  	    var statusSpan = document.getElementById("status");
  	  
  	    
  	    //옵션 click, doubleClick
    	map.on('click', function (e) {
    	  if (selected !== null) {
    	    selected.setStyle(undefined);
    	    selected = null;
    	  }

    	  map.forEachFeatureAtPixel(e.pixel, function (f) {
    	    selected = f;
    	    var selectedText = selected.get("__gid");
    	    var selectedVal = selected.get("val");
    	    var layerStyle11 = new ol.style.Style({
    	    	  fill: new ol.style.Fill({
    	    	    color: 'rgba(255,255,255,0.7)',
    	    	  }),
//     	    	  stroke: new ol.style.Stroke({
//     	    	    color: '#3399CC',
//     	    	    width: 3,
//     	    	  }),
    	    	  text: new ol.style.Text({
    				  text: selectedText+'\n 인구수:'+selectedVal,
    			  }),
    	    	});
    	    
    	    
    	    f.setStyle(layerStyle11);
    	    return true;
    	  });
    	  if (selected) {
//     		  statusSpan.innerHTML = selected.getProperties().__gid;
    		  statusSpan.innerHTML = selected.get("__gid");
    		  
    		 
    		  
    	  } else {
    		  statusSpan.innerHTML = '&nbsp;';
    	  }
    	});
        	
    
        
    	
    	
// 		필터 관련
        var cql_filter1 = "val is not NULL AND val <> '0' AND val BETWEEN 1 AND 100"; 
        var cql_filter2 = "val is not NULL AND val <> '0' AND val BETWEEN 100 AND 300";
        var cql_filter3 = "val is not NULL AND val <> '0' AND val > 300";
    	
         
        var extent = map.getView().calculateExtent();
        
         function getFeatures(data){
        	
//         	 url = 'http://localhost:8080/geoserver/wfs?service=WFS&' +
//              'version=1.1.0&request=GetFeature&typename=cite:vl_blk&' +
//              'outputFormat=application/json&srsname=EPSG:3857&' +
//              'bbox=' + extent.join(',') + ',EPSG:3857';
        	 
//         	 var xhr = new XMLHttpRequest();
//              xhr.open('GET', url);
//              var onError = function() {
//                vectorSource.removeLoadedExtent(extent);
//              }
//              xhr.onerror = onError;
//              xhr.onload = function(e) {
//                if (xhr.status == 200) {
//                data = JSON.parse(this.response);
              
//                addLayer(data);
//                } else {
//                  onError();
//                }
//              }
             
//              xhr.send();

			
              
            addLayer(data);

         }
         
	function addLayer(data) {
		
		style1 = new ol.style.Style({
    		fill: new ol.style.Fill({
    			color: 'rgba(222, 0, 0, 0.15)'
    		}),
    		stroke: new ol.style.Stroke({
    			color: 'rgba(222, 0, 0, 1)',
    			width: 3
    		}),
    		
        })
		
		style2 = new ol.style.Style({
    		fill: new ol.style.Fill({
    			color: 'rgba(222, 0, 0, 0.4)'
    		}),
    		stroke: new ol.style.Stroke({
    			color: 'rgba(222, 0, 0, 1)',
    			width: 3
    		}),
    		
        })
		
		style3 = new ol.style.Style({
    		fill: new ol.style.Fill({
    			color: 'rgba(222, 0, 0,0.8)'
    		}),
    		stroke: new ol.style.Stroke({
    			color: 'rgba(222, 0, 0, 1)',
    			width: 3
    		}),
    		
        })
		
		
		//메인 레이어에 올라갈 레이어들로 WMS로 불러올 것
		var vectorSource1 = new ol.source.Vector({
	    		format: new ol.format.GeoJSON(),
	    		 url : 'http://localhost:8080/geoserver/wfs?service=WFS&' +
	             'version=1.1.0&request=GetFeature&typename=cite:vl_blk&' +
	             'outputFormat=application/json&srsname=EPSG:3857&' +
	             'cql_filter='+cql_filter1,
		})
		var vectorSource2 = new ol.source.Vector({
    		format: new ol.format.GeoJSON(),
    		 url : 'http://localhost:8080/geoserver/wfs?service=WFS&' +
             'version=1.1.0&request=GetFeature&typename=cite:vl_blk&' +
             'outputFormat=application/json&srsname=EPSG:3857&' +
             'cql_filter='+cql_filter2,
	})
		var vectorSource3 = new ol.source.Vector({
    		format: new ol.format.GeoJSON(),
    		 url : 'http://localhost:8080/geoserver/wfs?service=WFS&' +
             'version=1.1.0&request=GetFeature&typename=cite:vl_blk&' +
             'outputFormat=application/json&srsname=EPSG:3857&' +
             'cql_filter='+cql_filter3,
	})
		
		  var vector1 = new ol.layer.Vector({
  	    	source: vectorSource1,
  	    	style: style1,
  	    });
		
		 var vector2 = new ol.layer.Vector({
	  	    	source: vectorSource2,
	  	    	style: style2,
	  	    });
		 var vector3 = new ol.layer.Vector({
	  	    	source: vectorSource3,
	  	    	style: style3,
	  	    });
		
		
		
		map.addLayer(vector1);
		map.addLayer(vector2);
		map.addLayer(vector3);
		
	}

    </script>
    
    
    
</body></html>