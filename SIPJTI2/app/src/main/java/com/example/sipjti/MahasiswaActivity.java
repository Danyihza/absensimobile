package com.example.sipjti;

import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import de.hdodenhof.circleimageview.CircleImageView;

public class MahasiswaActivity extends AppCompatActivity {
    ImageView buttonScan;
    Button btnLogout;
    LinearLayout btnJadwal;
    Boolean CheckEditText;

    private TextView nama, nim, prodi, gol, sms, jurusan;
    SessionManager sessionManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mahasiswa);

        buttonScan = (ImageView) findViewById(R.id.btnqrcode);
        buttonScan.setClickable(true);
        buttonScan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(MahasiswaActivity.this, ScannerActivity.class);
                startActivity(i);
            }
        });

        btnLogout = findViewById(R.id.btLogout);
        btnLogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                logoutAlert();
            }
        });

        sessionManager = new SessionManager(this);
        sessionManager.checkLogin();

        nama = findViewById(R.id.tvNama);
        nim = findViewById(R.id.tvNim);
        prodi = findViewById(R.id.tvPro);
        gol = findViewById(R.id.tvGol);
        sms = findViewById(R.id.tvSms);
        jurusan = findViewById(R.id.tvJur);

        HashMap<String, String> user = sessionManager.getUserDetail();
        String mName = user.get(sessionManager.NAMA_MAHASISWA);
        String mNim = user.get(sessionManager.NIM);
        final String mKPro = user.get(sessionManager.KODE_PRODI);
        final String mPro = user.get(sessionManager.NAMA_PRODI);
        final String mGol = user.get(sessionManager.GOLONGAN);
        final String mSms = user.get(sessionManager.SEMESTER);
        String mJur = user.get(sessionManager.NAMA_JURUSAN);
        String mKJur = user.get(sessionManager.KODE_JURUSAN);

        nama.setText(mName);
        nim.setText(mNim);
        prodi.setText(mPro);
        jurusan.setText(mJur);
        gol.setText(mGol);
        sms.setText(mSms);

        btnJadwal = findViewById(R.id.cardJadwal);
        btnJadwal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //getJadwal(mGol, mSms, mKPro);
                Intent i = new Intent(MahasiswaActivity.this, JadwalActivity.class);
                i.putExtra("golongan", mGol);
                i.putExtra("semester", mSms);
                i.putExtra("kode_prodi", mPro);
                startActivity(i);
            }
        });
    }

    private void logoutAlert(){
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage("Click YES if you want to log out.");
        builder.setCancelable(true);

        builder.setPositiveButton(
                "YES",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        sessionManager.logout();
                    }
                });

        builder.setNegativeButton(
                "CANCEL",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });

        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }

//    private void getJadwal(final String gol, final String sms, final  String pro) {
//        progressDialog.setMessage("Data Processing");
//        //menampilkan dialog
//        progressDialog.show();
//        StringRequest stringRequest = new StringRequest(Request.Method.POST, HttpUrl,
//                new Response.Listener<String>() {
//                    @Override
//                    public void onResponse(String response) {
//                        progressDialog.dismiss();
//                        Log.d("strrrrr", ">>" + response);
//                        try {
//                            JSONObject obj = new JSONObject(response);
//                            if (obj.optString("status").equals("true")) {
//                                dataModelArrayList = new ArrayList<>();
//                                JSONArray dataArray = obj.getJSONArray("data");
//                                for (int i = 0; i < dataArray.length(); i++) {
//                                    JSONObject object = dataArray.getJSONObject(i);
//                                    ListJadwal playerModel = new ListJadwal();
//                                    JSONObject dataobj = dataArray.getJSONObject(i);
//                                    playerModel.setHari(dataobj.getString("hari"));
//                                    playerModel.setMatkul(dataobj.getString("nama_matkul"));
//                                    playerModel.setMulai(dataobj.getString("waktu_mulai"));
//                                    playerModel.setSelesai(dataobj.getString("waktu_selesai"));
//                                    playerModel.setDosen(dataobj.getString(""));
//                                    playerModel.setRuang(dataobj.getString("ruangan"));
//                                    playerModel.setGedung(dataobj.getString("gedung"));
//                                    dataModelArrayList.add(playerModel);
//                                }
//                                //Kompiler akan memanggil metode setupListView()
//                                setupListview();
//
//
//                                String hari = object.getString("hari").trim();
//                                String nama_mahasiswa = object.getString("nama_mahasiswa").trim();
//                                String kode_prodi = object.getString("kode_prodi").trim();
//                                String nama_prodi = object.getString("nama_prodi").trim();
//                                String kode_jurusan = object.getString("kode_jurusan").trim();
//                                String nama_jurusan = object.getString("nama_jurusan").trim();
//                                String golongan = object.getString("golongan").trim();
//                                String semester = object.getString("semester").trim();
//
//                                sessionManager.createSession(nim, nama_mahasiswa, kode_prodi, nama_prodi, kode_jurusan, nama_jurusan, golongan, semester);
//
//                                Intent intent = new Intent(MahasiswaLogin.this, MahasiswaActivity.class);
//                                intent.putExtra("nim", nim);
//                                intent.putExtra("nama_mahasiswa", nama_mahasiswa);
//                                intent.putExtra("nama_prodi", nama_prodi);
//                                intent.putExtra("nama_jurusan", nama_jurusan);
//                                intent.putExtra("golongan", golongan);
//                                intent.putExtra("semester", semester);
//                                startActivity(intent);
//                                finish();
//                            }
//
////                                    Toast.makeText(MahasiswaLogin.this, "Success Login. \nYour NIM : "+name+"\nYour Name : "+email, Toast.LENGTH_SHORT).show()
//                        } catch (JSONException e) {
//                            e.printStackTrace();
//                            Toast.makeText(MahasiswaLogin.this, "User login failed. "+e.toString(), Toast.LENGTH_SHORT).show();
//                        }
//                    }
//                },
//                new Response.ErrorListener() {
//                    @Override
//                    public void onErrorResponse(VolleyError error) {
//                        progressDialog.dismiss();
//                        Toast.makeText(MahasiswaLogin.this, "Network Disruption "+error.toString(), Toast.LENGTH_SHORT).show();
//                    }
//                })
//        {
//            @Override
//            protected Map<String, String> getParams() throws AuthFailureError {
//                Map<String, String> params = new HashMap<>();
//                params.put("golongan", gol);
//                params.put("semester", sms);
//                params.put("kode_prodi", pro);
//                return params;
//            }
//        };
//        RequestQueue requestQueue = Volley.newRequestQueue(this);
//        requestQueue.add(stringRequest);
//    }
//
//private void setupListview(){
//        //will remove progressdialog
//        removeSimpleProgressDialog();
//        //mengatur adaptor ke tampilan daftar. Adaptor menyertakan daftar array di parameternya
//        listAdapter = new ListAdapter(this, dataModelArrayList);
//        listView.setAdapter(listAdapter);
//        }

//    private BottomNavigationView.OnNavigationItemSelectedListener navListener =
//            new BottomNavigationView.OnNavigationItemSelectedListener() {
//                @Override
//                public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
//                    Fragment selectedFragment = null;
//                    switch (menuItem.getItemId()) {
//                        case R.id.navigation_home:
//                            selectedFragment = new HomeFragment();
//                            buttonScan = (ImageView) findViewById(R.id.btnqrcode);
//                            buttonScan.bringToFront();
//                            buttonScan.setClickable(true);
//                            buttonScan.setOnClickListener(new View.OnClickListener() {
//                                @Override
//                                public void onClick(View view) {
//                                    Intent i = new Intent(MahasiswaActivity.this, ScannerActivity.class);
//                                    startActivity(i);
//                                }
//                            });
//                            break;
//                        case R.id.navigation_dashboard:
//                            selectedFragment = new JadwalFragment();
//                            break;
//                        case R.id.navigation_notifications:
//                            selectedFragment = new ProfileFragment();
//                            break;
//                    }
//                    getSupportFragmentManager().beginTransaction().replace(R.id.nav_host_fragment,selectedFragment).commit();
//                    return true;
//                }
//            };
}