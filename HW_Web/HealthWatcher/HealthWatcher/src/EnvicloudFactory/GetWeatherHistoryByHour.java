package EnvicloudFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.restlet.data.MediaType;
import org.restlet.ext.json.JsonRepresentation;
import org.restlet.representation.Representation;
import org.restlet.resource.ClientResource;
import com.google.gson.Gson;

public class GetWeatherHistoryByHour {
	public static String getWeatherHistoryGetRsp(String baseUrl,String accessId,String querytime,String citycode) {
		String response=null;
		String url=baseUrl+"/getWeatherHistory?citycode="+citycode+"&querytime="+querytime+"&ak="+accessId;
		ClientResource clientResource=new ClientResource(url);
		try {
			Representation reply=clientResource.get();
			response=reply.getText();
		} 
		catch(Exception e) {
			e.printStackTrace();
		} 
		finally {
			clientResource.release();
		}
		return response;
	}

	public static String getWeatherHistoryPostRsp(String baseUrl,String accessId,String querytime,List<String> citycodes) {
		String response=null;
		String url=baseUrl+"/getWeatherHistory";
		Map<String,Object> reqMap=new HashMap<String,Object>();
		reqMap.put("accessId", accessId);
		reqMap.put("querytime", querytime);
		reqMap.put("citycodes", citycodes);
		Gson gson=new Gson();
		String reqJson=gson.toJson(reqMap);
		ClientResource clientResource=new ClientResource(url);
		try {
			Representation rep=new JsonRepresentation(new JSONObject(reqJson));
			rep.setMediaType(MediaType.APPLICATION_JSON);
			Representation reply=clientResource.post(rep);
			response=reply.getText();
		} 
		catch(Exception e) {
			e.printStackTrace();
		} 
		finally {
			clientResource.release();
		}
		return response;
	}
}
