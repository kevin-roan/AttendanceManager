package com.example.attendance_prediction;

import org.json.JSONException;
import org.json.JSONObject;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Submit_reason extends Activity {
	
	EditText e1,e2;
	Button b;

	
	String a,d;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_submit_reason);
		 e1=(EditText)findViewById(R.id.editText1);
		 e2=(EditText)findViewById(R.id.editText2);
		 b=(Button)findViewById(R.id.button1);
		 
		 a=getIntent().getStringExtra("a");
		 d=getIntent().getStringExtra("d");
		 
		 e1.setText(d);
		 
		 
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
		getMenuInflater().inflate(R.menu.submit_reason, menu);
		return true;
	}



	public class savejson extends AsyncTask<Void, Void, Void>{
		@Override
		protected Void doInBackground(Void... params) {
			// TODO Auto-generated method stub
			String url ="http://192.168.18.5:8000/absent/android/";
			JSONObject jobj= new JSONObject();
	        try {
	   
				jobj.put("s",Login.uid);
				jobj.put("a",a);
				
				jobj.put("date", e1.getText().toString());
				jobj.put("reason",e2.getText().toString() );
//					
					
				JsonHandler.Postjson(url, jobj);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null; 
		}
		
		@Override
	      protected void onPostExecute(Void result) {
	         super.onPostExecute(result);
	    
	         
	        	 Toast.makeText(getApplicationContext(), "Reason Submitted Successfully", 3).show();
	        	 Intent i=new Intent(getApplicationContext(),Homepage.class);
					startActivity(i);
	     
	      }
	}
	
	
	
}
