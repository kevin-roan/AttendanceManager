package com.example.attendance_prediction;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

public class View_deptinfo extends Activity {

	ListView l1;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_view_deptinfo);
		l1=(ListView)findViewById(R.id.listView1);
		
		new getjson2().execute();
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.view_deptinfo, menu);
		return true;
	}

	
	
//	fromm
	
	

	public class getjson2 extends AsyncTask<Void, Void, Void>{
		ArrayList<HashMap<String,String>> al=new ArrayList<HashMap<String,String>>();
				@Override
				protected Void doInBackground(Void... params) {
					// TODO Auto-generated method stub
					
					String url = "http://192.168.18.5:8000/department/android/";
					
					JSONArray jdata=JsonHandler.GetJson(url);
					if(jdata!=null)
					{
						try {
						for (int i = 0; i < jdata.length(); i++) {
		                    JSONObject c;
							c = jdata.getJSONObject(i);
							
		                    String d_id = c.getString("d_id");	                    
		                    String dep = c.getString("dep");
		                  
		                    String info=c.getString("info");
		                    String date = c.getString("date");
		                    String h = c.getString("h");
		                    
		                    
		                    
		                    HashMap<String, String> contact =  new HashMap<String, String>();
		                    
		                    contact.put("d_id", d_id);   
		                 
		                    contact.put("dep", dep);
		                    contact.put("info",info);
		                    contact.put("date", date);
		                    contact.put("h",h);
		                    
		                    
		                    
		                    	al.add(contact);
		                    
		                  
		                  
		                     
		                }
						} catch (JSONException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							Toast.makeText(getApplicationContext(), "No information yet...", 3).show();
						}
					}
					else
					{
						Toast.makeText(getApplicationContext(), "No information yet...", 3).show();
					}
					return null;
				}
				
				@Override
			      protected void onPostExecute(Void result) {
			         super.onPostExecute(result);
			         
//			         Toast.makeText(getApplicationContext(), Login.uid, 3).show();
			         //List Adapter                         java
			         ListAdapter adapter = new SimpleAdapter(View_deptinfo.this, al,
			        		 
			            R.layout.dep, new String[]{ "date","info"}, 
			               new int[]{R.id.textView3,R.id.textView4});
			         l1.setAdapter(adapter);
			      }
			}
	

	
	
	

	
	
	
	
	
//	to
	
	
}
