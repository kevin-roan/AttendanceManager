package com.example.attendance_prediction;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.example.attendance_prediction.*;
import com.example.attendance_prediction.Submit_reason.savejson;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Login extends Activity {
	
	
	public static String url="http://192.168.43.89:8000/";
	public String perm="okkk";
	private String TAG=Login.class.getSimpleName();
	public static String logid,type,uid;  
	
	EditText e1,e2;
	Button b;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        
        
        e1=(EditText)findViewById(R.id.editText1);
        e2=(EditText)findViewById(R.id.editText2);
        b=(Button)findViewById(R.id.button1);
        
        
        b.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				if(!e1.getText().toString().equals("")&&!e2.getText().toString().equals("")){
					new savejson().execute();
				}
				else{
					Toast.makeText(getApplicationContext(), "Fill fileds", 3).show();
				}
			}
		});
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.login, menu);
        return true;
    }
    
    

    
    public class savejson extends AsyncTask<Void, Void, Void>{
		@Override
		protected Void doInBackground(Void... params) {
			// TODO Auto-generated method stub
			String url = "http://192.168.43.89:8000/login/android/";
			JSONObject jobj= new JSONObject();
	        try {
	   
				jobj.put("unm",e1.getText().toString());
				jobj.put("pa",e2.getText().toString());
				String s= JsonHandler.Postjson(url, jobj);
				JSONArray jdata=JsonHandler.Getjarray(s);
				if(jdata!=null)
				{
					perm="error";
					for(int i =0;i<jdata.length();i++)
					{
					perm="ok";
					JSONObject ob;
					ob=jdata.getJSONObject(i);
					logid=ob.getString("l_id");    
					uid=ob.getString("u_id");
					type=ob.getString("type");
						if(type.equals("student"))
						{
							Intent ii=new Intent(getApplicationContext(),Homepage.class);
							startActivity(ii);
						}
					}
				}
				else
				{
					perm="error";
				}
				Log.d("out",perm);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null; 
		}    
		
		@Override
	      protected void onPostExecute(Void result) {
	         super.onPostExecute(result);
	         if(!perm.equals("error"))
	         {
	        	 Log.d("auth","ok");
	        	 Toast.makeText(getApplicationContext(), "Login Successfull", 3).show();
	         }
	         else
	         {
	        	 Log.d("auth", "error");
	        	 Toast.makeText(getApplicationContext(), "Login Failed...Username or Password is incorrect.", 3).show();

	         }
	     
	      }
	}

    
    
    
}
