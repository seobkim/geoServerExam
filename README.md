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


web.xml의 설정을 변경하지않고 CORS Policy를 제거하는 브라우저 여는법

실행창(win+r) C:\Program Files (x86)\Google\Chrome\Application\chrome.exe


그 외 참고 자료로

https://m.blog.naver.com/PostView.nhn?blogId=plusvolts&logNo=221500257878&proxyReferer=https:%2F%2Fwww.google.com%2F
https://progworks.tistory.com/6
->geoserver에 Postgis 추가하기


https://openlayers.org/en/latest/doc/quickstart.html
->OpenLayers lib을 통한 basic map 생성

https://progworks.tistory.com/18
->geoServer에 있는 기본 내장 레이어를 openLayers를 이용하여 basicmap에 추가


http://www.gisdeveloper.co.kr/?p=2332
->shp파일


http://www.gisdeveloper.co.kr/?p=2493

https://kithub.tistory.com/entry/Openlayers-%EB%A7%88%EC%9A%B0%EC%8A%A4-%EC%98%A4%EB%B2%84%EC%8B%9C-%ED%8A%B9%EC%A0%95-%EA%B5%AC%EC%97%AD-%ED%95%98%EC%9D%B4%EB%9D%BC%EC%9D%B4%ED%8C%85%ED%95%98%EA%B8%B0with-olinteractionselect
//WFS 관련 자료



feature 데이터 확인 -> 객체.getFeatures();
