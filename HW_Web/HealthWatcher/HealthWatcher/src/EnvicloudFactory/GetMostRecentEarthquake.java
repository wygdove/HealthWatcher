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

public class GetMostRecentEarthquake {
	public static String getEarthquakesRspJson(String baseUrl,String accessId) {
		String response=null;
		String url=baseUrl+"/getMostRecentEarthquake";
		Map<String,Object> reqMap=new HashMap<String, Object>();
		reqMap.put("accessId", accessId);
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
