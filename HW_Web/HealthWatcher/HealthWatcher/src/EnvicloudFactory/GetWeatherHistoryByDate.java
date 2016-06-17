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

public class GetWeatherHistoryByDate {
	public static String getWeatherHistoryByDateGetRsp(String baseUrl,String accessId,String querydate,String citycode) {
		String response=null;
		String url=baseUrl+"/getWeatherHistoryByDate?citycode="+citycode+"&querydate="+querydate+"&ak="+accessId;
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

	public static String getWeatherHistoryByDatePostRsp(String baseUrl,String accessId,String querydate,List<String> citycodes) {
		String response=null;
		String url=baseUrl+"/getWeatherHistoryByDate";
		Map<String,Object> reqMap=new HashMap<String,Object>();
		reqMap.put("accessId",accessId);
		reqMap.put("querydate",querydate);
		reqMap.put("citycodes",citycodes);
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
