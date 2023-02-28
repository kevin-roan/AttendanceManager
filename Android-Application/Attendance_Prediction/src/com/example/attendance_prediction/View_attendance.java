package com.example.attendance_prediction;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.example.attendance_prediction.*;
import com.example.attendance_prediction.View_deptinfo.getjson2;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

public class View_attendance extends Activity {
	ListView l1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_view_attendance);
		l1=(ListView)findViewById(R.id.listView1);
		
		new getjson2().execute();
		
		l1.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
					long arg3) {
				// TODO Auto-generated method stub
				HashMap<String, String>hmap=(HashMap<String, String>)arg0.getItemAtPosition(arg2);				
				
				
				
				String h1=hmap.get("h1");
				String h2=hmap.get("h2");
				String h3=hmap.get("h3");
				String h4=hmap.get("h4");
				String h5=hmap.get("h5");
				
				if(h1.equals("A") || h2.equals("A") || h3.equals("A") || h4.equals("A") || h5.equals("A")){
					Intent i=new Intent(getApplicationContext(),Submit_reason.class);
					i.putExtra("a", hmap.get("a_id"));
					i.putExtra("d", hmap.get("date"));
					startActivity(i);
				}
				else{
					Toast.makeText(getApplicationContext(), "Your are not absent", 6).show();
				}
				
				
				
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.view_attendance, menu);
		return true;
	}

	

	
	

	public class getjson2 extends AsyncTask<Void, Void, Void>{
		ArrayList<HashMap<String,String>> al=new ArrayList<HashMap<String,String>>();
				@Override
				protected Void doInBackground(Void... params) {
					// TODO Auto-generated method stub
					
					String url = "http://192.168.43.89:8000/attendance/android/";
					
					JSONArray jdata=JsonHandler.GetJson(url);
					if(jdata!=null)
					{
						try {
						for (int i = 0; i < jdata.length(); i++) {
		                    JSONObject c;
							c = jdata.getJSONObject(i);
							
							
						    String a_id  = c.getString("a_id");
							String sem = c.getString("sem");
							String date = c.getString("date");
							String attendence = c.getString("attendence");
							String h1 = c.getString("h1");

		                    String h2 = c.getString("h2");
		                    String h3 = c.getString("h3");
		                    String h4 = c.getString("h4");
		                    String h5 = c.getString("h5");
		                    String status = c.getString("status");
		                    String cc = c.getString("c");
		                    String s = c.getString("s");
		                    String t = c.getString("t");
		                    

		                    
		                    
		                    HashMap<String, String> contact =  new HashMap<String, String>();
		                    
		                    contact.put("a_id", a_id);   
		                    contact.put("sem",sem);
		                    contact.put("date", date);
		                    contact.put("attendence",attendence);
		                    contact.put("h1",h1);
		                    contact.put("h2",h2);
		                    contact.put("h3",h3);
		                    contact.put("h4",h4);
		                    contact.put("h5",h5);
		                    contact.put("status",status);
		                    contact.put("c",cc);
		                    contact.put("s",s);
		                    contact.put("t",t);
		                    
		                    
		                    
		                    
		                    if(s.equals(Login.uid)){
		                    	
		                    	al.add(contact);
		                    }
		                    	
		                    
		                  
		                  
		                     
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
			         
			         Toast.makeText(getApplicationContext(), "Click to submit absent reason", 6).show();
			         //List Adapter                         java
			         ListAdapter adapter = new SimpleAdapter(View_attendance.this, al,
			        		 
			            R.layout.attendace, new String[]{ "date","attendence","h1","h2","h3","h4","h5"}, 
			               new int[]{R.id.textView3,R.id.textView4,R.id.textView7,R.id.textView8,R.id.textView13,R.id.textView14,R.id.textView12});
			         l1.setAdapter(adapter);
			      }
			}
	


	
	
	
//	to
	
	
}


