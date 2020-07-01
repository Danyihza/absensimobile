package com.example.sipjti;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import java.util.HashMap;

public class MahasiswaActivity extends AppCompatActivity {
    ImageView buttonScan;
    Button btnLogout;
    LinearLayout btnJadwal, btnHadir;

    private TextView nama, nim, prodi, gol, sms, jurusan;
    SessionManager sessionManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mahasiswa);

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
        final String mName = user.get(sessionManager.NAMA_MAHASISWA);
        final String mNim = user.get(sessionManager.NIM);
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

        buttonScan = (ImageView) findViewById(R.id.btnqrcode);
        buttonScan.setClickable(true);
        buttonScan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(MahasiswaActivity.this, ScannerActivity.class);
                i.putExtra("nim", mNim);
                startActivity(i);
            }
        });

        btnJadwal = findViewById(R.id.cardJadwal);
        btnJadwal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //getJadwal(mGol, mSms, mKPro);
                Intent i = new Intent(MahasiswaActivity.this, JadwalActivity.class);
                i.putExtra("golongan", mGol);
                i.putExtra("semester", mSms);
                i.putExtra("kode_prodi", mKPro);
                startActivity(i);
            }
        });

        btnHadir = findViewById(R.id.cardHadir);
        btnHadir.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //getJadwal(mGol, mSms, mKPro);
                Intent i = new Intent(MahasiswaActivity.this, KehadiranActivity.class);
                i.putExtra("golongan", mGol);
                i.putExtra("semester", mSms);
                i.putExtra("nim", mNim);
                i.putExtra("nama", mName);
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
}