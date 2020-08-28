# geoServerExam
GIS 관련 예제 - GeoServer, PostgresSQl(PostGis), OpenLayers lib
CORS Policy 해결 위해 TomcatServer에서 GeoServer 데이터를 요청하기때문에 GeoServer의 web.xml 파일의 설정 변경하여야함
->
<filter>
        <filter-name>cross-origin</filter-name>
        <filter-class>org.eclipse.jetty.servlets.CrossOriginFilter</filter-class>
    </filter>
 
    <filter-mapping>
        <filter-name>cross-origin</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
