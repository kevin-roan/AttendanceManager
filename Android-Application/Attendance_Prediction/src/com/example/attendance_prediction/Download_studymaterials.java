package com.example.attendance_prediction;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.example.attendance_prediction.*;
import com.example.attendance_prediction.View_deptinfo.getjson2;

import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.os.StrictMode;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RadioGroup;
import android.widget.SimpleAdapter;
import android.widget.Spinner;
import android.widget.Toast;

public class Download_studymaterials extends Activity {
	ListView l1;
	
	String imgurl="http://192.168.18.5:8000/static/";
	@SuppressLint("NewApi") @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_download_studymaterials);
		
		
		
		try
        {
            if (android.os.Build.VERSION.SDK_INT > 9)
            {
                StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                StrictMode.setThreadPolicy(policy);
            }
        }
        catch(Exception e)
        {
        }
		
		l1=(ListView)findViewById(R.id.listView1);
		
		new getjson2().execute();
		
		
		l1.setOnItemLongClickListener(new OnItemLongClickListener() {

			@Override
			public boolean onItemLongClick(AdapterView<?> arg0, View arg1,
					int arg2, long arg3) {
				// TODO Auto-generated method stub
				
				HashMap<String,String> hmap=(HashMap<String, String>)arg0.getItemAtPosition(arg2);
				startdown(imgurl+hmap.get("file"),hmap.get("file"));
				
				return false;
			}
		});
		
		
        
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.download_studymaterials, menu);
		return true;
	}
	

	//from
	


	private class getjson2 extends AsyncTask<Void, Void, Void>{
		ArrayList<HashMap<String,String>> al=new ArrayList<HashMap<String,String>>();
				@Override
				protected Void doInBackground(Void... params) {
					// TODO Auto-generated method stub
					
					String url = "http://192.168.18.5:8000/study_material/android/";
					
					JSONArray jdata=JsonHandler.GetJson(url);
					if(jdata!=null)
					{
						try {
						for (int i = 0; i < jdata.length(); i++) {
		                    JSONObject c;
							c = jdata.getJSONObject(i);
							
		                    String sm_id = c.getString("sm_id");	                    
		                    String subject = c.getString("subject");
		                  
		                    String sem=c.getString("sem");
		                    String file = c.getString("file");
		                    String date = c.getString("date");
		                    String t = c.getString("t");
		                    
		                  
		                    
		                    HashMap<String, String> contact =  new HashMap<String, String>();
		                    
		                    contact.put("sm_id", sm_id);   
		                 
		                    contact.put("subject", subject);
		                    contact.put("sem",sem);
		                    contact.put("file",file);
		                    contact.put("date", date);
		                    contact.put("t",t);
		                    
		                    
		                    
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
			         
			         Toast.makeText(getApplicationContext(), "Long press to download", 3).show();
			         //List Adapter                         java
			         ListAdapter adapter = new SimpleAdapter(Download_studymaterials.this, al,
			        		 
			            R.layout.study, new String[]{ "date","subject","file"}, 
			               new int[]{R.id.textView4,R.id.textView5,R.id.textView6});
			         l1.setAdapter(adapter);
			      }
			}
	

	
	
	
	


private void startdown(String ur, String fname) {
        String str = "File Downloaded Successfully";
        int count;
        try {
            URL url = new URL(ur);
            URLConnection conection = url.openConnection();
            conection.connect();
            
            String pth= Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).toString();
            Toast.makeText(getApplicationContext(), pth, Toast.LENGTH_LONG).show();
            InputStream input = new BufferedInputStream(url.openStream(), 8192);
            OutputStream output = new FileOutputStream(pth+"/" + fname);
            byte data[] = new byte[1024];
            long total = 0;

            while ((count = input.read(data)) != -1) {
                total += count;
                //publishProgress(""+(int)((total*100)/lenghtOfFile));
                output.write(data, 0, count);
            }
            output.flush();
            output.close();
            input.close();

        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            str = "URL Issue!!!";
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            str = e.toString();//"File Downloaded Failed..!!!";
            e.printStackTrace();
        }

        Toast.makeText(getApplicationContext(), str, Toast.LENGTH_LONG).show();


    }

	

	
	
	
	
}
