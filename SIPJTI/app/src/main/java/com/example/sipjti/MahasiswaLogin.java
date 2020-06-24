package com.example.sipjti;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class MahasiswaLogin extends AppCompatActivity {
    //deklarasi variabel
    TextView userdosen;
    EditText nim, password;
    Button Login;
    RequestQueue requestQueue;
    String NimHolder,PasswordHolder;
    ProgressDialog progressDialog;
    String HttpUrl="http://192.168.1.7/absensimobile/config/login.php";
    Boolean CheckEditText;
    SessionManager sessionManager;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.login_mahasiswa);

        sessionManager = new SessionManager(this);

        //menetapkan ID
        nim = findViewById(R.id.etNim);
        password = findViewById(R.id.etPassword);
        Login = findViewById(R.id.btlogin);
        userdosen = findViewById(R.id.logdos);
        requestQueue = Volley.newRequestQueue(MahasiswaLogin.this);
        progressDialog = new ProgressDialog(MahasiswaLogin.this);

        //jika klik button daftar
        userdosen.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //pindah ke MainActivity yaitu halaman pendafataran
                Intent i = new Intent(MahasiswaLogin.this, DosenLogin.class);
                startActivity(i);
            }
        });
        //jika klik button Login
        Login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String mNim = nim.getText().toString().trim();
                String mPass = password.getText().toString().trim();
                //menjalankan method CheckEditTextIsEmptyOrNot yang mengecek edittext kosong atau tidak
                CheckEditTextIsEmptyOrNot();
                if (CheckEditText) {
                    //jika tidak kosong menjalankan method UserLogin()
                    Login(mNim,mPass);
                } else {
                    //jika kosong akan menampilkan toast text
                    Toast.makeText(MahasiswaLogin.this, "Lengkapi Data!!", Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    private void Login(final String email, final String password) {
        StringRequest stringRequest = new StringRequest(Request.Method.POST, HttpUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            String success = jsonObject.getString("success");
                            JSONArray jsonArray = jsonObject.getJSONArray("login");

                            if (success.equals("1")) {
                                for (int i = 0; i<jsonArray.length(); i++) {
                                    JSONObject object = jsonArray.getJSONObject(i);

                                    String name = object.getString("name").trim();
                                    String email = object.getString("email").trim();

                                    sessionManager.createSession(name, email, name);

                                    Intent intent = new Intent(MahasiswaLogin.this, MahasiswaActivity.class);
                                    intent.putExtra("name", name);
                                    intent.putExtra("email", email);
                                    startActivity(intent);
                                    finish();

//                                    Toast.makeText(MahasiswaLogin.this, "Success Login. \nYour NIM : "+name+"\nYour Name : "+email, Toast.LENGTH_SHORT).show();
                                }
                            } else {
                                Toast.makeText(MahasiswaLogin.this, "Gagal", Toast.LENGTH_SHORT).show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(MahasiswaLogin.this, "Error "+e.toString(), Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(MahasiswaLogin.this, "Error "+error.toString(), Toast.LENGTH_SHORT).show();
                    }
                })
        {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("email", email);
                params.put("password", password);
                return params;
            }
        };
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }


    public void CheckEditTextIsEmptyOrNot() {
        NimHolder = nim.getText().toString().trim();
        PasswordHolder = password.getText().toString().trim();
        if (TextUtils.isEmpty(NimHolder) || TextUtils.isEmpty(PasswordHolder)) {
            CheckEditText = false;
        } else {
            CheckEditText = true;
        }
    }
}

